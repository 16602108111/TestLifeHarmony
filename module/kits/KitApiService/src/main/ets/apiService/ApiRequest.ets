import {url} from 'BaseCell'
import ApiPublicParams from './ApiPublicParams'
import ApiHeader from './ApiHeader'

// 业务请求
class ApiRequest {
  method: string
  header: any

  // host: string = "https://api-sit.yonghuivip.com" //等待渠道模块开发
  host: string = "https://yhmock.yonghui.cn" //等待渠道模块开发
  path: string
  params: any
  body: any
  needPublicParams: boolean = true //是否需要公共参数
  needPublicHeader: boolean = true //是否需要公共header

  //获取url
  getUrl() {
    const theUrl: string = this.host + this.path
    let allUrlParams = {}
    //判断是否需要公共参数
    if (this.needPublicParams) {
      const publicParams = ApiPublicParams.getPublicParams(this.params, this.body);
      allUrlParams = {
        ...this.params,
        ...publicParams,
      }
    } else {
      allUrlParams = {
        ...this.params,
      }
    }

    //获得拼接后的参数
    const theReqUrl = url.jointParam(theUrl, allUrlParams);
    return theReqUrl
  }
  // 获取header
  getHeader() {
    const theHeader = ApiHeader.getHeaderParams();
    const res = {
      ...theHeader,
      ...this.header
    }
    return res;
  }
}

export default ApiRequest;