import  { BaseText } from '../baseUI/BaseText'
import { BaseImage } from '../baseUI/BaseImage'
import { BaseDialog } from '../baseUI/BaseDialog'
import { BaseColors } from 'BaseStyles'

@Entry
@Component
struct Index {
  @State dataList: Array<string> = new Array(5)

  dialogController: CustomDialogController

  aboutToAppear() {

    this.dataList = [
      "base text",
      "base image",
      "base dialog",
    ]
  }

  aboutToDisappear() {
    this.dialogController = null;
  }

  @Builder
  itemBuild(showStr: string, tapEvent: ()=>void) {
    Column() {
      Text(`${showStr}`)
        .height('42vp')
        .width("100%")
    }
    .width("90%")
    .margin({
      left:'5%',
      right: '5%'
    })
    .onClick(()=>{
      tapEvent()
    })
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      Text('Base UI').fontSize(30)
        .margin({
          top:"10%"
        })

      List({ space: 10 }) {

        ListItem() {
          this.itemBuild("base text", () => {
            console.log("111")
          })
        }

        ListItem() {
          this.itemBuild("base image", () => {
            console.log("111")
          })
        }

        ListItem() {
          this.itemBuild("base dialog", () => {

            this.dialogController = new CustomDialogController({
              builder: BaseDialog({
                title: "请求接口",
                description: "获取数据成功!",
                showPositive: true,
                showNegative: true
              })
            })
            this.dialogController.open()
          })
        }

        // ForEach(this.dataList, (item, index) => {
        //   ListItem() {
        //     this.itemBuild(`${index} ${item}`)
        //   }
        // })
      }
      .divider({
        strokeWidth: 1,
        startMargin: '12vp',
        endMargin: '12vp',
        color: '#ffe9f0f0'
      })

    }
    .height('100%')
    .width('100%')
  }
}


