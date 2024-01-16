

import {RefreshFooter} from 'BaseUI'

@Component
export default struct TestComponent {

  @State dataList: Array<string> = new Array(5)

  aboutToAppear() {
    for (let index = 0; index < 20; index++) {
      this.dataList.push("测试数据啦")
    }
  }

  @Builder
  itemBuild(index: number) {
    Column() {
      Text(`我是一个Cell  ${index}`)
        .height('45vp')
    }.alignItems(HorizontalAlign.Start)
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.dataList, (item, index) => {
        ListItem() {
          this.itemBuild(index)
        }
      })
      ListItem() {
        RefreshFooter({show: true})
      }
    }
  }

}


/*
@Component
export default struct TestComponent {

  @State dataList: Array<string> = new Array(5)

  aboutToAppear() {
    for (let index = 0; index < 100; index++) {
      this.dataList.push("测试数据啦")
    }
  }

  @Builder
  itemBuild(index: number) {
    Column() {
      Text(`我是一个Cell  ${index}`)
    }.alignItems(HorizontalAlign.Start)
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.dataList, (item, index) => {
        ListItem() {
          this.itemBuild(index)
        }
      })
    }
  }

}
*/