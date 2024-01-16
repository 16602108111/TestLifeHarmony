import {Router} from 'KitRouter'
import image from '@ohos.multimedia.image'
import { YHCheckBox } from 'BaseUI'
@Entry
@Component
export  struct LoginPage {
  @State showClearIcon : boolean = false
  @State userPhoneName: string = ''
  @State checkState : boolean = false

  build() {
    Column(){
      Image($r("app.media.icon_close"))
        .width(20)
        .height(20)
        .margin({top:30,left:30})
        .fillColor(Color.Gray)
        .objectFit(ImageFit.Cover)


      Text("欢迎登录永辉生活")
        .fontColor(Color.Black)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({top:"30%",left:"15%"})
        .alignSelf(ItemAlign.Start)

      Row(){
        TextInput({placeholder:"请输入手机号",text:this.userPhoneName})
          .type(InputType.Number)
          .maxLength(11)
          .enterKeyType(EnterKeyType.Done)
          .caretColor(Color.Red)
          .textAlign(TextAlign.Start)
          .backgroundColor(Color.White)
          .fontSize(12)
          .onChange((value : string) => {
            this.userPhoneName = value
            this.showClearIcon = this.userPhoneName.length > 0 ? true:false
          })

        Image($r("app.media.icon_close"))
          .fillColor(Color.Gray)
          .width(20)
          .height(20)
          .objectFit(ImageFit.Fill)
          .visibility(this.showClearIcon?Visibility.Visible:Visibility.Hidden)
      }
      .margin({left:"10%",top:"15%",right:"15%"})

      Divider()
        .strokeWidth(0.5)
        .margin({left:"10%",right:"10%"})

      Row(){
        Image($r(this.checkState?'app.media.icon_add_cart':'app.media.icon_add_cart'))
          // Image($r('app.media.icon_add_cart'))
          .width(20)
          .height(20)
            // .backgroundColor(Color.Blue)
          .fillColor(Color.Green)
      }
      .margin(({left:"10%",right:"10%",top:4}))
      .width("80%")
      // .backgroundColor(Color.Red)
    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Start)

  }
}