
@Component
struct CartPage {

  build() {
    Column() {
      Text('我的购物车').fontSize(30)
        .margin({
          top:"30%"
        })
    }
    .height('100%')
  }
}
export default CartPage