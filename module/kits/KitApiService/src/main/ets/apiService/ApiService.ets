
import http from '@ohos.net.http';
import httpClient from 'BaseHttp'
import {json} from 'BaseCell'
import ApiRequest from './ApiRequest'
import {ApiGetParamsMap} from './ApiConstants'


// 处理业务相关
class ApiService {

  requestSimple<T = any>(request: ApiRequest): Promise<T> {
    return new Promise<T>((resolve, reject) => {

      httpClient.request({
        method: request.method as http.RequestMethod,
        url: request.getUrl(),
        header: request.getHeader(),
        extraData: request.body,
      }).then((response: http.HttpResponse)=>{

        // const result:MyAwesomeData<T> = JSON.parse(response.result.toString()) as MyAwesomeData<T>

        const res = json.parse(response.result.toString())

        resolve(res)
      }).catch((err)=>{
        reject(err)
      })
    });

  }

  /*
  通过path和参数请求，日常用这种就可以了,默认添加公共参数
 */
  get<T = any>(path: string, params: ApiGetParamsMap = null, needPublicParams: boolean = true): Promise<T> {
    const request = new ApiRequest()
    request.method = http.RequestMethod.GET
    request.path = path
    request.params = params
    request.body = null
    request.params = needPublicParams
    return this.requestSimple(request);
  }
  /*
  post请求
  * param: 里面传body
  * urlParams: 特殊需要在url里面传参数
   */
  post<T = any>(path: string, params: any = null, urlParams: ApiGetParamsMap = null ,needPublicParams: boolean = true): Promise<T> {
    const request = new ApiRequest()
    request.method = http.RequestMethod.POST
    request.path = path
    request.params = urlParams
    request.body = params
    request.params = needPublicParams
    return this.requestSimple(request);
  }


}

export const apiInstance = new ApiService()
export default apiInstance;