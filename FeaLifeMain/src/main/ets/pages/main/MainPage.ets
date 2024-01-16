import UIConstants from '../../constants/UIConstants';
import { TabItem } from './mainPage/model/TabBarItem'
import HomePage from './home/HomePage'
import CategoryPage from './category/CategoryPage'
import CartPage from './cart/CartPage'
import PersonalCenter from './personalCenter/PersonalCenter'

@Entry
@Component

struct MainPage {
  @State selectIndex: number = 0 //选中的索引

  // tab bar信息
  tabBarInfo: Array<TabItem> = []

  initViewData() {
    this.tabBarInfo = [
      {
        index: 0,
        title: "首页",
        iconWidth: '18vp',
        imageActivated: $r('app.media.tab_bar_home_selected_log'),
        imageOriginal: $r('app.media.tab_bar_home_unselected')
      },
      {
        index: 1,
        title: "分类",
        iconWidth: '25vp',
        imageActivated: $r('app.media.tab_bar_category_selected'),
        imageOriginal: $r('app.media.tab_bar_category_unselected')
      },
      {
        index: 2,
        title: "购物车",
        iconWidth: '25vp',
        imageActivated: $r('app.media.tab_bar_cart_selected'),
        imageOriginal: $r('app.media.tab_bar_cart_unselected')
      },
      {
        index: 3,
        title: "我的",
        iconWidth: '25vp',
        imageActivated: $r('app.media.tab_bar_user_selected'),
        imageOriginal: $r('app.media.tab_bar_user_unselected')
      }
    ]
  }

  aboutToAppear() {
    this.initViewData()
  }

  build() {
    Column() {
      Tabs({
        index: this.selectIndex,
        barPosition: BarPosition.End
      }) {
         TabContent() {
           HomePage()
         }
        .tabBar(this.tabBarBtn(this.tabBarInfo[0]))

        TabContent() {
          CategoryPage()
        }
        .tabBar(this.tabBarBtn(this.tabBarInfo[1]))

        TabContent() {
          CartPage()
        }
        .tabBar(this.tabBarBtn(this.tabBarInfo[2]))

        TabContent() {
          PersonalCenter()
        }
        .tabBar(this.tabBarBtn(this.tabBarInfo[3]))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight('50vp')
      .onChange((index: number) => {
        this.selectIndex = index;
      })
    }
    .height('100%')
    .padding({
      bottom:'20vp'
    })
  }

  @Builder tabBarBtn(item: TabItem) {

    if (item.index === 0 && this.selectIndex === 0) {
      Column() {
        Image(this.selectIndex === item.index ? item.imageActivated : item.imageOriginal).objectFit(ImageFit.ScaleDown)
          .height("40vp")
          .width('100%')
          .margin({
            top:'5vp',
            bottom: '5vp'
          })
      }
      .justifyContent(FlexAlign.Center)
      .height(UIConstants.Position.Full_H_Percent)
      .width(UIConstants.Position.Full_W_Percent)
      .backgroundColor(UIConstants.Color.Color_TabBar_Back)
    } else {
      Column() {
        Image(this.selectIndex === item.index ? item.imageActivated : item.imageOriginal).objectFit(ImageFit.ScaleDown)
          .height("30vp")
          .width(item.iconWidth)
          .margin({
            top:'2vp'
          })
        Text(item.title)
          .width('100%')
          .height('15vp')
          .fontSize('10fp')
          .fontWeight(UIConstants.Font.Font_Weight_Normal)
          .fontColor(this.selectIndex === item.index ? UIConstants.Color.Color_TabBar_Select : Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({
            bottom:'5vp'
          })
      }
      .justifyContent(FlexAlign.Center)
      .height(UIConstants.Position.Full_H_Percent)
      .width(UIConstants.Position.Full_W_Percent)
      .backgroundColor(UIConstants.Color.Color_TabBar_Back)
    }
  }
}