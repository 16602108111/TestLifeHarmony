import { BaseColors } from 'BaseStyles'
 import  { UserLoginRouter } from  'FeaUserLogin'
// import { UserLoginRouter } from 'FeaUserLogin'
import { BaseUIRouter } from 'BaseUI'
import {Router} from 'KitRouter'
import * as api from './interface/index'

@Entry
@Component
struct PCPage {

  aboutToAppear() {
    // api.getUserInfo()
  }

  build() {
    Column() {
      Text('个人中心').fontSize(30)
        .margin({
          top:"30%"
        })

      Button() {
        Text('去登录')
          .btnTextStyle()
      }
      .btnStyle()
      .onClick(()=>{
        Router.push(UserLoginRouter.ModuleName, UserLoginRouter.PageOfLogin).then((res)=>{
          console.log("我去登录了========1111")
        }).catch((err)=> {
          console.log("我去登录了========22222"+err)
        })
      })
    }
    .height('100%')
  }
}
export default PCPage

@Extend(Button) function btnStyle() {
  // .fontColor(BaseColors.SubMediumBlack)
  .type(ButtonType.Capsule)
  .margin({
    top: 20
  })
  .backgroundColor('#0D9FFB')
  .width('50%')
  .height('5%')
}

@Extend(Text) function btnTextStyle() {
  .fontColor(BaseColors.SubMediumBlack)
  .fontSize(16)
  .fontWeight(FontWeight.Bold)
}