import Url from '@ohos.url';

//拼接url参数
export function jointParam(host, urlParams) {
  const url = Url.URL.parseURL(host);

  let paramsObject = url.params;
  // 检查是否有参数字典，然后将其添加到 URL 上
  if (urlParams) {
    Object.keys(urlParams).forEach((key) => {
      const theValue = urlParams[key];
      paramsObject.append(key, `${theValue}`);
    });
  }
  const paramsStr = paramsObject.toString()
  const res = host + "?" + paramsStr;
  return res;
}

export default {
  jointParam
}