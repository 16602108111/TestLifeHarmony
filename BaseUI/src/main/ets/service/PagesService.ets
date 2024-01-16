import {ModuleService} from 'KitModuleService'
import * as PagesRouter from './PagesRouter'


// 模块路由相关
export class PagesService extends ModuleService {

  // 注册页面信息
  registerPages(): { [key: string]: string } {
    return PagesRouter.ModulePages;
  }

  //注册模块名
  registerModuleName(): string {
    return PagesRouter.ModuleName
  }

}