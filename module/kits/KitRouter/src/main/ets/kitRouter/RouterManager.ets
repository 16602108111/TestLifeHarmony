
import { RouterPageType } from './constants'

class RouterManager {
  // private static instance: RouterManager;
  // private constructor() { }
  // public static getInstance(): RouterManager {
  //   if (!this.instance) {
  //     this.instance = new RouterManager()
  //   }
  //   return this.instance;
  // }

  public static getInstance(): RouterManager {
    let theRm = globalThis.routerManager;
    if (!theRm) {
      theRm = new RouterManager()
      globalThis.routerManager = theRm
    }
    return theRm;
  }

  // 包名
  bundleName = "com.yh.life"
  // 存放路由信息
  moduleInfo: {[key: string]: {[key:string]: string}} = {}

  //添加模块router信息
  addModuleInfo(moduleName:string, pages:{[key:string]: string}) {
    this.moduleInfo[moduleName] = pages
  }

  // 路由url,用作跳转
  routerUrl(moduleName: string, pageName:string) {
    const pages = this.moduleInfo[moduleName]
    if (!pages) {
      return ""
    }
    const pagePath = pages[pageName]
    if (!pagePath) {
      return ""
    }
    const url = `@bundle:${this.bundleName}/${moduleName}${pagePath}`
    return url
  }
}
export default RouterManager;