
import ApiService from 'KitApiService';


// const UrlPath_Common_Config: string = "/api/fp/commonconfig/get";
const UrlPath_UserInfo: string = "/mock/2958/web/user/asset/info/700";

export function getUserInfo() {

  ApiService.post(UrlPath_UserInfo,{}).then((res)=>{
    let theOne = res;
    console.log('res')
  }).catch((err)=>{
    console.log(err)
  })

}
