let fs = require('fs')
var iconv = require('iconv-lite');
async function main(){
    let state = fs.statSync('./2.txt')
    console.log(state)
    let text = fs.readFileSync('./2.txt');
    let str = iconv.decode(text, 'gbk');
    console.log(text, str)
}
main();
// let buf = iconv.encode("停车项目记事本", 'gbk');
// let str = iconv.decode(buf, 'gbk');
// let exist = iconv.encodingExists("utf8")
// console.log(buf, str, exist)