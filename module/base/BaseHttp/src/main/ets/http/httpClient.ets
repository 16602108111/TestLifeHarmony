
import httpConstant from './constants';
import Http from './http';

//剥离单例
export const http = new Http({
  readTimeout: httpConstant.READ_TIMEOUT,
  connectTimeout: httpConstant.CONNECT_TIMEOUT
})

// export default http