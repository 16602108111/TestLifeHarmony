import {Router} from 'KitRouter'


@Entry
@Component
struct Index {
  @State message: string = '个人中心模块'

  build() {
    Column() {
      Column() {
        Text(this.message)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({
        top:'30%'
      })


      Button() {
        Text('返回主模块...')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('50%')
      .height('5%')
      .onClick(()=>{
        Router.back()
      })

    }
    .height('100%')
  }
}