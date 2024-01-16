
@Component
struct CategoryPage {

  build() {
    Column() {
      Text('我的分类').fontSize(30)
        .margin({
          top:"30%"
        })
    }
    .height('100%')
  }
}
export default CategoryPage