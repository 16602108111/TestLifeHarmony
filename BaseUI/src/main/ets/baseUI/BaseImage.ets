
//基础图片
@Component
export struct BaseImage {
  // 展位图
  @State placeHolder: string = ''
  // url图片
  @Prop url: string;

  build() {
    Image(this.url)
      // .alt($r('app.media.image_placeholder'))
      .objectFit(ImageFit.Cover)
      .height("100%")
      .width("100%")
  }
}