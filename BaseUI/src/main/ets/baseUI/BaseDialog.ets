import {BaseColors} from 'BaseStyles'

// 弹窗组件
@CustomDialog
export struct BaseDialog {
  //自定义加载的内容
  @BuilderParam contentBuilder?: () => void
  //标题
  title: Resource | string
  //描述
  description: Resource | string
  //确认按钮文案
  private positiveText = "确认"
  //取消按钮文案
  private negativeText = "取消"
  //确认按钮回调
  private positiveCallback: () => void
  //取消按钮回调
  private negativeCallback: () => void
  //展示确认按钮
  private showPositive = true
  //展示取消按钮
  private showNegative = true
  //弹窗控制器
  controller: CustomDialogController

  aboutToAppear() {

  }

  build() {
    Stack() {
      Column() {
        Text(this.title)
          .fontSize('16fp')
          .fontColor(BaseColors.SubMediumBlack)
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .height('50fp')
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Divider()
          .color(BaseColors.BlackF8)

        // 内容
        Text(this.description)
          .fontSize('14fp')
          .fontColor(BaseColors.SubRegularBlack)
          .textAlign(TextAlign.Center)
          .padding('20fp')


        Divider()
          .color(BaseColors.BlackF8)

        Row() {
          Text(this.negativeText)
            .flexShrink(1)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .fontColor(BaseColors.SubLightBlack)
            .visibility(this.showNegative ? Visibility.Visible : Visibility.None)
            .onClick(() => {
              this.negativeCallback?.()
              this.controller.close()
            })

          Divider().color(BaseColors.BlackF8)
            .vertical(true)
            .visibility((this.showPositive && this.showNegative) ? Visibility.Visible : Visibility.None)

          Text(this.positiveText)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .fontColor(BaseColors.SuRegularPurple)
            .visibility(this.showPositive ? Visibility.Visible : Visibility.None)
            .onClick(() => {
              this.positiveCallback?.()
              this.controller.close()
            })

        }
        .height('50fp')
        .width("100%")
      }
      .backgroundColor(BaseColors.SubWhite)
      .border({
        radius: '6fp'
      })
      .alignItems(HorizontalAlign.Center)
    }
    .width("100%")
  }
}