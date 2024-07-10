const fs = require('fs');
const path = require('path');
const moment = require('moment')
function log(info){
    const time = moment().format('YYYY-MM-DD HH:mm:ss');
    let text = time + ':' + info + '\n';
    console.log(text);
    fs.appendFileSync(path.resolve(__dirname, '../data/log.txt'), text);
}
module.exports = log;