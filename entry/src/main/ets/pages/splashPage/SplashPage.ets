
import Router from "KitRouter"
import {LifeMainRouter} from 'FeaLifeMain'

@Entry
@Component
struct SplashPage {

  aboutToAppear() {
    setTimeout(()=> {

      Router.replaceUrl(LifeMainRouter.ModuleName,LifeMainRouter.PageOfMain).then((res) => {
        console.log("")
      }).catch((err) => {
        console.log("")
      })

      // 测试代码,用于页面ui的开发
      const theUrl = `@bundle:com.yh.life/FeaViewTest/ets/pages/Index`
      // const theUrl = `@bundle:com.yh.life/FeaViewTest/ets/pages/pageA`
      // Router.pushUrl(theUrl)

    },1000)
  }

  build() {
    Flex({
      direction:FlexDirection.Column,
      justifyContent:FlexAlign.Center
      }) {
      Image($r('app.media.launch_over_img_1')).objectFit(ImageFit.ScaleDown)
        .width('100%')
        .height('75%')
        .margin({top:'25%'})
      Image($r('app.media.launch_bottom_logo_1')).objectFit(ImageFit.ScaleDown)
        .width('100%')
        .height('15%')
    }
    .width('100%')
    .height('100%')
  }
}