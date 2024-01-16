
// import {ApiService} from 'kit_api_service';
import ApiService from 'KitApiService';

// const UrlPath_CommonConfig: string = "/api/fp/commonconfig/get";
const UrlPath_CommonConfig: string = "/mock/2958/commonconfig";

export function getCommonConfig<T = any>(): Promise<T>  {

  return ApiService.get(UrlPath_CommonConfig,{type: 1})

  // ApiService.get(UrlPath_CommonConfig,{type: 1}).then((res)=>{
  //   let theOne = res;
  //   console.log('res')
  // }).catch((err)=>{
  //   console.log(err)
  // })

}