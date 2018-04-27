deadline=$(echo `date +%s` + 3600| bc )

# 构造JSON格式的上传策略
putPolicy="{\"scope\":\"$bucket\",\"deadline\":$deadline}"
echo "putPolicy=$putPolicy"

# 对上传策略进行Base64编码
encodedPutPolicy=`echo -n "$putPolicy" | base64 | tr "+/" "-_"`
echo "encodedPutPolicy=$encodedPutPolicy"

# 使用访问密钥secretkey对Base64上传策略进行HMAC-SHA1签名，并对签名进行Base64编码
encodedSign=`echo -n "$encodedPutPolicy" | openssl sha1 -hmac $secretkey -binary | base64 | tr "+/" "-_"`
echo "encodedSign=$encodedSign"

# 将AccessKey、encodedSign和encodedPutPolicy组装成uploadToken
uploadToken="$accesskey:$encodedSign:$encodedPutPolicy"
echo $uploadToken

# 使用curl上传
curl -F "file=@$file" -F "key=$file" -F "token=$uploadToken" $url