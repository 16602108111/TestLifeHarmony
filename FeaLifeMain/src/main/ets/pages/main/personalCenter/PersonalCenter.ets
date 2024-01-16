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



    }
    .height('100%')
  }
}
export default PCPage