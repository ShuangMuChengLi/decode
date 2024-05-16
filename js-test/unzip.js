let unzipper = require("unzipper");
const il = require('iconv-lite');
let fs = require("fs");
let path = require("path");
async function pipe(rs, ws) {
  await new Promise((resolve) => {
    rs.pipe(ws);
    rs.on("end", () => {
      setTimeout(resolve, 10);
    });
  });
}
// let s = '�½� DOCX �ĵ�.docx';
// console.log(il.decode(s, 'gbk'))
async function main() {
  let tem = path.resolve(__dirname, "test");
  let readStream = fs.createReadStream(path.resolve(__dirname, "1.zip"));
  readStream
  .pipe(unzipper.Parse())
  .on('entry', function (entry) {
    // if some legacy zip tool follow ZIP spec then this flag will be set
    const isUnicode = entry.props.flags.isUnicode;
    // decode "non-unicode" filename from OEM Cyrillic character set
    console.log(entry.path);
    // const fileName = isUnicode ? entry.path : il.decode(entry.props.pathBuffer, 'gbk');
    // const type = entry.type; // 'Directory' or 'File'
    // const size = entry.vars.uncompressedSize; // There is also compressedSize;
    // if (type === 'File') {
    //   let path = '';
    //   let list = fileName.split('/');
    //   list.pop();
    //   for(let item of list){
    //     if(path){
    //       path += ('/' + item);
    //     }else{
    //       path = item;
    //     }
        
    //     try{
    //       fs.mkdirSync(path)
    //     }catch(e){
    //       // console.log(e)
    //     }
    //   }
    //   entry.pipe(fs.createWriteStream(fileName));
    // }
  })
//   readStream.pipe(unzipper.Parse())
//   .on('entry', function (entry) {
//     // if some legacy zip tool follow ZIP spec then this flag will be set
//     const isUnicode = entry.props.flags.isUnicode;
//     // decode "non-unicode" filename from OEM Cyrillic character set
//     const fileName = isUnicode ? entry.path : il.decode(entry.props.pathBuffer, 'gbk');
//     console.log(entry.path, isUnicode, fileName)
//     // const type = entry.type; // 'Directory' or 'File'
//     // const size = entry.vars.uncompressedSize; // There is also compressedSize;
//     // if (fileName === "Текстовый файл.txt") {
//     entry.pipe(fs.createWriteStream(fileName));
//     // } else {
//     // entry.autodrain();
//     // }
//   });
//   await pipe(readStream, unzipper.Extract({ path: tem }));
//   await pipe(readStream, unzipper.Extract({ path: tem }));
}
main();
