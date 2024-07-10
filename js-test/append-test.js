const fs = require('fs');
const path = require('path');
fs.appendFileSync(path.resolve(__dirname, '../data/log.txt'), '1\n');