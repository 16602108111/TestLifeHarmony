



// 处理响应结果
export interface BaseResponse {
  errorCode: number
  errorMsg: string
}

//业务使用
export interface ApiResponse<T = any> extends BaseResponse {
  data: T | any;
}


