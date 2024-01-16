import http from '@ohos.net.http';

interface RequestConfig extends http.HttpRequestOptions {
  url?: string, //请求网络链接
}

/*
网络请求相关
 */
export class Http {
  httpClient: http.HttpRequest
  config: RequestConfig

  constructor(options: RequestConfig) {
    this.httpClient = http.createHttp()
    this.config = options
  }

  request(config: RequestConfig): Promise<http.HttpResponse> {
    return new Promise<http.HttpResponse>((resolve, reject) => {
      this.httpClient.request(
        config.url,
        config,
        (error, data) => {
          if (!error) {
            resolve(data);
          } else {
            reject(error)
          }
          // 主动销毁
          this.httpClient.destroy()
        }
      )
    })
  }

  get<T = any>(config: RequestConfig): Promise<http.HttpResponse> {
    return this.request({ ...config, method: http.RequestMethod.GET })
  }

  post<T = any>(config: RequestConfig): Promise<http.HttpResponse> {
    return this.request({ ...config, method: http.RequestMethod.POST })
  }
}

export default Http;