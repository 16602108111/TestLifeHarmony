
import * as api from './api/index'
import { UserCenterRouter } from 'FeaUserCenter'
import { BaseUIRouter } from 'BaseUI'
import {Router} from 'KitRouter'
import {BaseDialog} from 'BaseUI'
import {BaseColors} from 'BaseStyles'

@Extend(Text) function btnTextStyle() {
  .fontColor(BaseColors.SubMediumBlack)
  .fontSize(16)
  .fontWeight(FontWeight.Bold)
}

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

@Component
struct HomePage {

  dialogController: CustomDialogController

  aboutToAppear() {

  }
  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Column() {
      Text('首页页面112').fontSize(30)
        .margin({
          top:"30%"
        })

      Button() {
        Text('跳到子模块')
          .btnTextStyle()
      }
      .btnStyle()
      .onClick(()=>{
        Router.push(UserCenterRouter.ModuleName, UserCenterRouter.PageOfTest).then((res)=>{
          console.log("")
        }).catch((err)=> {
          console.log("")
        })
      })

      Button() {
        Text('请求接口')
          .btnTextStyle()
      }
      .btnStyle()
      .onClick(()=>{
        // 请求数据
        api.getCommonConfig().then((res)=>{
          let theOne = res;
          console.log('res')
          this.dialogController = new CustomDialogController({
            builder: BaseDialog({
              title: "请求接口",
              description: "获取数据成功!",
              showPositive: true,
              showNegative: true
            })
          })

          this.dialogController.open()
          }).catch((err)=>{
            console.log(err)
          })
      })

      Button() {
        Text('BaseUI')
          .btnTextStyle()
      }
      .btnStyle()
      .onClick(()=>{
        Router.push(BaseUIRouter.ModuleName, BaseUIRouter.PageOfMain).then((res)=>{
          console.log("")
        }).catch((err)=> {
          console.log("")
        })
      })

    }
    .height('100%')
  }
}
export default HomePage