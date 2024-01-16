
// 路由链接类型
export enum RouterLinkType {
  Page = 1, //页面
  Web = 2, //web
  ExternalWeb = 4,//外部web
}

// 路由类型
export enum RouterType {
  InternalPage = 1, //内部跳转
  BundlePage = 2,//其他包页面
  External = 4, //外部链接
}

// 定义路由页面类型
export interface RouterPageType {
  [key: string]: string;
}