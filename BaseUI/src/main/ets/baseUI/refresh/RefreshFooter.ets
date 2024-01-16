
/**
 * 上拉加载底部页面
 */

import { BaseColors } from 'BaseStyles'

@Component
export struct RefreshFooter {
  @Prop show: boolean

  build() {
    Row() {
      Text("数据加载中，请稍后...")
        .fontColor(BaseColors.SubMediumBlack)
        .fontSize('15fp')
    }
    .width("100%")
    .height('50vp')
    .backgroundColor(BaseColors.BlackF8)
    .visibility(this.show ? Visibility.Visible : Visibility.None)
    .justifyContent(FlexAlign.Center)
  }
}