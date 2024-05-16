let fs = require("fs");
let path = require("path");
let _ = require("lodash");
var archiver = require("archiver");
let unzipper = require("unzipper");
const il = require('iconv-lite');
async function pipe(rs, ws) {
  await new Promise((resolve) => {
    rs.pipe(ws);
    rs.on("end", () => {
      setTimeout(resolve, 10);
    });
  });
}
async function extract(readStream, temPath) {
  await new Promise((resolve) => {
    readStream
      .pipe(unzipper.Parse())
      .on("entry", function (entry) {
        // if some legacy zip tool follow ZIP spec then this flag will be set
        const isUnicode = entry.props.flags.isUnicode;
        // decode "non-unicode" filename from OEM Cyrillic character set
        const fileName = isUnicode
          ? entry.path
          : il.decode(entry.props.pathBuffer, "gbk");
        const type = entry.type; // 'Directory' or 'File'
        const size = entry.vars.uncompressedSize; // There is also compressedSize;
        if (type === "File") {
          let dir = "";
          let list = fileName.split("/");
          list.pop();
          for (let item of list) {
            if (dir) {
              dir += "/" + item;
            } else {
              dir = item;
            }

            try {
              fs.mkdirSync(path.resolve(temPath, dir));
            } catch (e) {
              // console.log(e)
            }
          }
          entry.pipe(fs.createWriteStream(path.resolve(temPath, fileName)));
        }
      })
      .on("end", () => {
        setTimeout(resolve, 10);
      });
  });
}
async function hanlderZip(filePath, resolve) {
  let fileName = new Date().getTime() + "";
  let targetDir = path.resolve(__dirname, "../user", fileName);
  let tem = path.resolve(__dirname, "../tem", fileName);
  try {
    fs.mkdirSync(targetDir);
  } catch (e) {}
  try {
    fs.mkdirSync(tem);
  } catch (e) {}
  let readStream = fs.createReadStream(filePath);
  await extract(readStream, tem);

  async function readDir(dir, targetPath) {
    let dirFiles = fs.readdirSync(dir);
    let reqs = [];
    for (let file of dirFiles) {
      let fullPath = dir + "/" + file;
      if (fs.statSync(fullPath).isDirectory()) {
        let childDir = path.resolve(targetPath, file);
        fs.mkdirSync(childDir);
        reqs.push(readDir(fullPath, childDir));
      } else {
        let rs = fs.createReadStream(fullPath);
        let ws = fs.createWriteStream(path.resolve(targetPath, file));
        reqs.push(pipe(rs, ws));
      }
    }
    await Promise.all(reqs);
  }
  await readDir(tem, targetDir);
  // create a file to stream archive data to.
  var output = fs.createWriteStream(targetDir + ".zip");
  var archive = archiver("zip", {
    zlib: { level: 9 }, // Sets the compression level.
  });

  // listen for all archive data to be written
  // 'close' event is fired only when a file descriptor is involved
  output.on("close", async function () {});

  // This event is fired when the data source is drained no matter what was the data source.
  // It is not part of this library but rather from the NodeJS Stream API.
  // @see: https://nodejs.org/api/stream.html#stream_event_end
  output.on("end", function () {});

  // good practice to catch warnings (ie stat failures and other non-blocking errors)
  archive.on("warning", function (err) {
    if (err.code === "ENOENT") {
      // log warning
      console.error(err);
    } else {
      // throw error
      throw err;
    }
  });

  // good practice to catch this error explicitly
  archive.on("error", function (err) {
    throw err;
  });

  // pipe archive data to the file
  archive.pipe(output);

  // append files from a sub-directory, putting its contents at the root of archive
  archive.directory(targetDir, false);

  // finalize the archive (ie we are done appending files but streams have to finish yet)
  // 'close', 'end' or 'finish' may be  fired right after calling this method so register to them beforehand
  archive.finalize();
  resolve(fileName + ".zip");
}
function hanlderFile(filePath, suff, resolve) {
  let fileName = new Date().getTime() + "";
  let targetDir = path.resolve(__dirname, "../user", fileName + "." + suff);
  let rs = fs.createReadStream(filePath);
  let ws = fs.createWriteStream(targetDir);
  let rss = rs.pipe(ws);
  rs.on("end", () => {
    resolve(fileName + "." + suff);
  });
}
function putNginxConfig(filePath, fileName) {
  return new Promise((resolve, reject) => {
    if (fileName.indexOf(".zip") !== -1) {
      hanlderZip(filePath, resolve);
    } else {
      let arr = fileName.split(".");
      hanlderFile(filePath, arr[arr.length - 1], resolve);
    }
  });
}
module.exports = {
  putNginxConfig,
};
