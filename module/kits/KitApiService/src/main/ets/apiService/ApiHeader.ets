import { ApiConstants,ApiGetParamsMap } from './ApiConstants'

class ApiHeader {

  private static instance: ApiHeader;
  public static getInstance(): ApiHeader {
    if (!this.instance) {
      this.instance = new ApiHeader()
    }
    return this.instance;
  }


  headers: ApiGetParamsMap = {}; //header参数

  private constructor() {
    this.headers = {
      [ApiConstants.Header_DNT]: "0",
      [ApiConstants.Header_Biz]: "ncjkdy=&vkkdy=mfpeor)'$gxgx$+oac&vmzv=&nzggzmdy=",
      [ApiConstants.Header_Context]: "origin=ios&morse=1",
      [ApiConstants.Header_Agent]: "YhStore/9.12.0(client/phone; iOS 16.6.1; iPhone12,1)",
      // [ApiConstants.Header_UserKey]: "userKey",
    }
  }

  //添加公共公共参数
  addParams(params: ApiGetParamsMap) {
    const publicParams = {
      ...this.headers,
      ...params,
    }
    this.headers = publicParams;
  }

  //删除某个参数
  deleteParam(key: string) {
    delete this.headers[key]
  }

  //获取公共参数，里面包括了签名
  getHeaderParams(): ApiGetParamsMap {
    return this.headers;
  }

}

const instance = ApiHeader.getInstance()
export default instance;