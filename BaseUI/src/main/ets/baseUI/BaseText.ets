
//方便后续统一改字体啥的

@Component
export struct BaseText {
  @Prop message: string;
  private fontColor: ResourceColor = Color.Blue;
  private fontSize: number | string | Resource = 12

  build() {
    Text(this.message)
      .fontSize(this.fontSize)
      .fontColor(this.fontColor)
  }
}