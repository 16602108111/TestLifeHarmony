import {Router} from "KitRouter"

//模块服务
export class ModuleService {

  // 注册页面信息
  registerPages(): {[key: string]: string} {
    return {};
  }
  //注册模块名
  registerModuleName(): string {
    return ""
  }

  //will judge
  willToPage() {

  }

  //did show 用作一些判定
  didShowPage() {

  }
}

// 注册服务
export const registerModule = (theService: ModuleService)=> {

  const moduleName = theService.registerModuleName()
  const pages = theService.registerPages()
  Router.registerRouter(moduleName,pages)
}
