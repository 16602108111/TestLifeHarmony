import router from '@ohos.router'

import RouterManager from './RouterManager'
import BaseLog from 'BaseLog'

// 打开页面
export const pushUrl = (url: string, params?: Object) =>{
  router.pushUrl({ url: url, params: params }, router.RouterMode.Standard, (err) => {
    if (err) {
      BaseLog.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    BaseLog.info('pushUrl success' + url);
  })
}

// 打开页面
export const push = (moduleName: string, pageName: string, params?: Object): Promise<void> =>{
  const routerManager = RouterManager.getInstance()
  const theUrl = routerManager.routerUrl(moduleName,pageName)
  if (!theUrl) {
    return Promise.reject(new Error(`获取模块页面信息失败!`))
  }
  return router.pushUrl({ url: theUrl, params: params }, router.RouterMode.Standard)
}

// 替换一个页面
export const replaceUrl = (moduleName: string, pageName: string, params?: Object): Promise<void> => {
  const theUrl = RouterManager.getInstance().routerUrl(moduleName,pageName)
  if (!theUrl) {
    return Promise.reject(new Error(`获取模块页面信息失败!`))
  }
  return router.replaceUrl({ url: theUrl, params: params }, router.RouterMode.Standard)
};

// 获取跳转的url
export const routerUrl = (moduleName: string, pageName: string)=> {
  const theUrl = RouterManager.getInstance().routerUrl(moduleName,pageName)
  return theUrl
}

// 返回
export const back = () => {
  router.back()
}

// 注册
export const registerRouter = (moduleName: string, pages: {[key: string]: string}) =>{
  RouterManager.getInstance().addModuleInfo(moduleName,pages)
}
