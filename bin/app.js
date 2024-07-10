const createError = require('http-errors');
const express = require('express');
const fs = require('fs');
const path = require('path');
const url = require('url');
const proxy = require('http-proxy-middleware');
var bodyParser = require('body-parser');
var cors = require('cors');
var compression = require('compression');
let nginxRoute = require('../routes/nginx-route');
let log = require('../service/log')
const app = express();

try{
  fs.mkdirSync(path.resolve(__dirname, '../tem'));
}catch (e){
  // console.error('tem文件夹已存在');
}
app.use(function (req, res, next) {
  if(req.path === '/'){
    log(req.ip);
  }
  next();
});
app.use(compression());
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
// 静态资源文件夹
app.use(express.static(path.join(__dirname, '../dist')));
app.use(express.static(path.join(__dirname, '../user')));
app.use('/remove-api/nginx', nginxRoute);
// catch 404 and forward to error handler
app.use(function (req, res, next) {
  console.log(req.ip);
  next(createError(404));
});
// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  if(req.app.get('env') === 'development'){
    res.locals.error = err;
  }else{
    res.locals.error = {};
  }

  let status = err.status || 500;
  // render the error page
  res.status(err.status || 500);
  res.end(status + '');
});
module.exports = app;
