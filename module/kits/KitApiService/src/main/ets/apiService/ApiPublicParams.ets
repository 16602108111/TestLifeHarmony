
import { ApiConstants,ApiGetParamsMap } from './ApiConstants'
import {time, crypto} from 'BaseCell'


class ApiPublicParams {

  private static instance: ApiPublicParams;
  public static getInstance(): ApiPublicParams {
    if (!this.instance) {
      this.instance = new ApiPublicParams()
    }
    return this.instance;
  }

  params: ApiGetParamsMap = {}; //公共参数

  private constructor() {
    this.params = {
      [ApiConstants.Param_Os]: "harmony",
      [ApiConstants.Param_Channel]: "ios_dev",
      [ApiConstants.Param_ChannelMain]: "2",
      [ApiConstants.Param_ChannelSub]: "",
      [ApiConstants.Param_Brand]: "harmony", //频道
      [ApiConstants.Param_Model]: "harmony", //手机型号
      [ApiConstants.Param_OsVersion]: "1.0.0", //系统版本
      [ApiConstants.Param_NetworkType]: "4G", //网络类型
      [ApiConstants.Param_Screen]: "414*896",
      [ApiConstants.Param_ProductLine]: "YhStore", //产品线

      [ApiConstants.Param_DeviceId]: "emulator", //设备id
      [ApiConstants.Param_Platform]: "harmony",
      [ApiConstants.Param_AppVersion]: "1.0.0", //版本
      [ApiConstants.Param_ApiPro]: "ZZZ_test", //网络返回的一个字段 测时候环境可以用  sign
      // [ApiConstants.Param_Timestamp]: time.timestampMs()

      // "uid":"",
      // "access_token":"",
    }
  }

  //添加公共公共参数
  addPublicParams(params: ApiGetParamsMap) {
    const publicParams = {
      ...this.params,
      ...params,
    }
    this.params = publicParams;
  }

  //删除某个参数
  deletePublicParam(key: string) {
    delete this.params[key]
  }

  //生成签名
  generateSignature(theParams: ApiGetParamsMap = null, body: any = null): string {
    let theParamStr = ''
    if (theParams) {
      // 获取字典中的所有键
      const keyList = Object.keys(theParams);
      // 对键进行排序
      keyList.sort();
      //遍历生成字符串
      keyList.forEach((theKey) => {
        const theValue = theParams[theKey];
        theParamStr = theParamStr + theKey + theValue
      });
    }
    let theBodyStr = ''
    if (body) {
      theBodyStr = JSON.stringify(body)
    }

    const theAllStr = theParamStr + theBodyStr
    //获取签名
    // const sig = crypto.md5(theAllStr)
    return ""
  }

  //获取公共参数，里面包括了签名
  getPublicParams(urlParams: ApiGetParamsMap = null, body: any = null): ApiGetParamsMap {
    const theTimeStamp = time.timestampMs()
    const newParams: ApiGetParamsMap = {
      ...urlParams,
      ...this.params,
      [ApiConstants.Param_Timestamp]: theTimeStamp
    }
    const signature = this.generateSignature(newParams, body);
    newParams[ApiConstants.Param_Sign] = signature;
    const res = {
      ...this.params,
      [ApiConstants.Param_Timestamp]: theTimeStamp,
      [ApiConstants.Param_Sign]: signature
    }
    return res;
  }

}

const instance = ApiPublicParams.getInstance()
export default instance;