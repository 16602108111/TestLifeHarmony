export { add } from "./utils/Calc"

// 基础控件
export { BaseText } from './baseUI/BaseText'
export { BaseImage } from './baseUI/BaseImage'
export { BaseDialog } from './baseUI/BaseDialog'

//状态相关
export {LoadingA} from './baseUI/state/LoadingA'

//辅助页面
export { RefreshFooter } from './baseUI/refresh/RefreshFooter'


// 用作展示使用
export * as BaseUIRouter from "./service/PagesRouter"
export { PagesService as BaseUIService } from "./service/PagesService"