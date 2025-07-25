let express = require('express');
let formidable = require('formidable');
let route = express.Router();
let url = require('url');
let fs = require('fs');
let path = require('path');
let util = require('../service/util');
let _ = require('lodash');
let { getNginxConfig, putNginxConfig } = require('../service/nginx-script.js');
let log = require('../service/log')
route.post('/', async (req, res) =>{
  let ip = req.ip;
  const form = formidable({ multiples: true, maxFileSize: 400 * 1024 * 1024 });
  function showError(msg){
    console.error(msg);
    res.writeHead(500, {'Content-Type': 'application/json;charset=utf-8'});
    res.end(JSON.stringify({
      'code': 500,
      'message': msg,
      'success': false,
      'result': null
    }));
  }
  form.uploadDir = path.resolve(__dirname, '../tem');
  form.parse(req, async function (err, fields, files) {
    if (err) {
      console.error(err);
      util.endRequest(res, {
        code: 500,
        message: '上传异常',
        success: false
      });
      return;
    }

    let fileName = _.get(fields, 'fileName', false);
    // if(!fileName){
    //   showError('缺少项目的id');
    //   return;
    // }

    // let file = _.get(files, 'file', false);
    // if(!file){
    //   showError('请上传配置文件');
    //   return;
    // }

    await putNginxConfig(files.file.path, fileName).then((data)=>{
      log(ip + ': ' + data);
      util.endRequest(res, {
        code: 200,
        data: data,
        message: '上传成功',
        success: true
      });
    }).catch((e)=>{
      console.error(e);
      showError('上传失败');
    });
  });



});

module.exports = route;
