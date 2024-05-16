let fs = require('fs')
async function main(){
    let list = fs.readdirSync('./1');
    console.log(list)
}
main();