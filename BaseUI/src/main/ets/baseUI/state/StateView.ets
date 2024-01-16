// 页面状态相关

// 页面相关状态
export class ViewStateType {
  //加载中
  static readonly Loading: string = "view_state_loading"
  //网络异常
  static readonly Network_Error: string = "view_state_network_error"
  //空页面
  static readonly Empty: string = "view_state_empty"
}

@Component
export struct StateView {

  @Prop viewState: string; //页面状态类型
  @BuilderParam viewContent: () => void //页面显示内容,loading状态会使用

  //重试的回调方法
  retryCallback?: () => void

  build() {
    Text('等待开发状态页面....')
  }
}