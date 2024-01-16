import BaseLog from 'BaseLog'

import { registerModule } from 'KitModuleService'
import {UserCenterService} from 'FeaUserCenter'
import {LifeMainService} from 'FeaLifeMain'
import {BaseUIService} from 'BaseUI'

import s from 'FeaUserCenter'

// 调用一些初始化的任务
export function startInitModule () {
  BaseLog.info("初始化模块...")
  registerModule(new UserCenterService())
  registerModule(new LifeMainService())
  registerModule(new BaseUIService())
}
