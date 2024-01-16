
import {BaseStyles} from 'BaseStyles'
import TestComponent from '../component/TestComponent'

//Text相关
// @Extend(Text) function fancy (fontSize: number) {
//   .fontColor(Color.Red)
//   .fontSize(fontSize)
// }

@Entry
@Component
struct Index {
  @State message: string = '用来测试的页面'
  @State showMsg: string = "初始值"

  build() {
    Row() {
      Column() {
        // Text(this.message)
        //   // .fancy(16)
        //   .fontSize(16)
        //   // .fontWeight(FontWeight.Bold)
        //
        // Button(){
        //   Text('按钮试试')
        //     .fontSize(16)
        // }
        // .type(ButtonType.Capsule)
        // .onClick(()=>{
        //   this.showMsg = 'Hello, ArkUI!';
        // })

        TestComponent()
          .width('100%')
          .height('70%')
          .margin({top:"15%"})
          .backgroundColor(Color.Pink)

      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}