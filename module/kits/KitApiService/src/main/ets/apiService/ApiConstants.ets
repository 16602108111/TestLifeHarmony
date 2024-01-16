

export type ApiGetParamsMap = Record<string, number | string>;

export class ApiConstants {
  // 公共参数
  static readonly Param_Os = "os";
  static readonly Param_Channel = "channel";
  static readonly Param_ChannelMain = "channelMain";
  static readonly Param_ChannelSub = "channelSub";
  static readonly Param_Brand = "brand";
  static readonly Param_Model = "model";
  static readonly Param_OsVersion = "osVersion";
  static readonly Param_NetworkType = "networkType";
  static readonly Param_Screen = "screen";
  static readonly Param_ProductLine = "productLine";
  static readonly Param_DeviceId = "deviceid";
  static readonly Param_Platform = "platform";
  static readonly Param_AppVersion = "v";

  static readonly Param_Uid = "uid";
  static readonly Param_AccessToken = "access_token";
  static readonly Param_ApiPro = "apiPro";
  static readonly Param_Timestamp = "timestamp";
  static readonly Param_Sign = "sign";

  // header
  static readonly Header_DNT = "DNT";
  static readonly Header_Biz = "X-YH-Biz-Params";
  static readonly Header_Context = "X-YH-Context";
  static readonly Header_Agent= "User-Agent";
  static readonly Header_UserKey = "userKey";
}

