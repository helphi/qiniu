# 使用 curl 上传文件到七牛云

```
export url=<http://区域.qiniup.com> #存储区域见 https://developer.qiniu.com/kodo/manual/1671/region-endpoint
export file=<YOUR_FILE_NAME>
export bucket=<YOUR_BUCKET_NAME>
export accesskey=<YOUR_ACCESSKEY>
export secretkey=<YOUR_SECRETKEY>
bash upload.sh
```

> 参考文件：
> - https://developer.qiniu.com/kodo/manual/1272/form-upload
> - https://developer.qiniu.com/kodo/manual/1208/upload-token