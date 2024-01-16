import {ModuleService} from 'KitModuleService'
import * as UserCenterRouter from './UserCenterRouter'


// 模块路由相关
export class UserCenterService extends ModuleService {

  // 注册页面信息
  registerPages(): { [key: string]: string } {
    return UserCenterRouter.ModulePages;
  }

  //注册模块名
  registerModuleName(): string {
    return UserCenterRouter.ModuleName
  }

}