//
//  TalkingDataPlugin.h
//  TalkingData_PhoneGap
//
//  Created by liweiqiang on 13-12-2.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>


@interface TalkingDataAppCpaPlugin : CDVPlugin

// 初始化 TalkingData Analytics SDK
// command 中的值：
// appId        : TalkingData appId
// channelId    : 渠道号
- (void)init:(CDVInvokedUrlCommand*)command;

// 关闭在控制台中打印运行时日志
- (void)setVerboseLogDisable:(CDVInvokedUrlCommand*)command;

// 获取 TalkingData Device ID，并将其作为参数传入 JS 的回调函数
// command 中的值：
// callBack     : 处理 deviceID 的回调函数
- (void)getDeviceId:(CDVInvokedUrlCommand*)command;

// DeepLing事件
// command 中的值：
// link         : 链接
- (void)onReceiveDeepLink:(CDVInvokedUrlCommand*)command;

// 注册事件
// command 中的值：
// accountId    : 帐号ID
- (void)onRegister:(CDVInvokedUrlCommand*)command;

// 登录事件
// command 中的值：
// accountId    : 帐号ID
- (void)onLogin:(CDVInvokedUrlCommand*)command;

//创建卡片
- (void)onCreateCard:(CDVInvokedUrlCommand*)command;

// 创建角色
// command 中的值：
// roleName     : 角色名称
- (void)onCreateRole:(CDVInvokedUrlCommand*)command;

// 支付
// command 中的值：
// accountId    : 账户ID
// orderId      : 订单ID
// amount       : 金额
// currencyType : 币种
// payType      : 支付类型
- (void)onPay:(CDVInvokedUrlCommand*)command;

// 下单
// command 中的值：
// accountId    : 帐户ID
// order        : 订单详情
- (void)onPlaceOrder:(CDVInvokedUrlCommand*)command;

// 支付订单
// command 中的值：
// accountId    : 帐户ID
// orderId      : 订单ID
// amount       : 金额
// currencyType : 币种
// payType      : 支付类型
- (void)onOrderPaySucc:(CDVInvokedUrlCommand*)command;

// 查看商品
// command 中的值：
// itemId       : 商品ID
// category     : 商品类别
// name         : 商品名称
// unitPrice    : 商品单价
- (void)onViewItem:(CDVInvokedUrlCommand*)command;

// 添加商品到购物车
// command 中的值：
// itemId       : 商品ID
// category     : 商品类别
// name         : 商品名称
// unitPrice    : 商品单价
// amount       : 商品数量
- (void)onAddItemToShoppingCart:(CDVInvokedUrlCommand*)command;

// 查看购物车
// command 中的值：
// shoppingCart : 购物车详情
- (void)onViewShoppingCart:(CDVInvokedUrlCommand*)command;

// 触发自定义事件1
- (void)onCustEvent1:(CDVInvokedUrlCommand*)command;

// 触发自定义事件2
- (void)onCustEvent2:(CDVInvokedUrlCommand*)command;

// 触发自定义事件3
- (void)onCustEvent3:(CDVInvokedUrlCommand*)command;

// 触发自定义事件4
- (void)onCustEvent4:(CDVInvokedUrlCommand*)command;

// 触发自定义事件5
- (void)onCustEvent5:(CDVInvokedUrlCommand*)command;

// 触发自定义事件6
- (void)onCustEvent6:(CDVInvokedUrlCommand*)command;

// 触发自定义事件7
- (void)onCustEvent7:(CDVInvokedUrlCommand*)command;

// 触发自定义事件8
- (void)onCustEvent8:(CDVInvokedUrlCommand*)command;

// 触发自定义事件9
- (void)onCustEvent9:(CDVInvokedUrlCommand*)command;

// 触发自定义事件10
- (void)onCustEvent10:(CDVInvokedUrlCommand*)command;

//交易事件
- (void)onTransaction:(CDVInvokedUrlCommand*)command;

//专属-授信
- (void)onCredit:(CDVInvokedUrlCommand*)command;

//收藏
- (void)onFavorite:(CDVInvokedUrlCommand*)command;

//分享
- (void)onShare:(CDVInvokedUrlCommand*)command;

//签到
- (void)onPunch:(CDVInvokedUrlCommand*)command;

//广告搜索
- (void)onSearch:(CDVInvokedUrlCommand*)command;

//预约
- (void)onReservation:(CDVInvokedUrlCommand*)command;

//预定
- (void)onBooking:(CDVInvokedUrlCommand*)command;

//预定
- (void)onContact:(CDVInvokedUrlCommand*)command;

//课程学习
- (void)onLearn:(CDVInvokedUrlCommand*)command;

//文章阅读
- (void)onRead:(CDVInvokedUrlCommand*)command;

//专属 浏览详情
- (void)onBrowse:(CDVInvokedUrlCommand*)command;

//专属-退单
- (void)onChargeBack:(CDVInvokedUrlCommand*)command;

//专属-完成使用体验
- (void)onTrailFinished:(CDVInvokedUrlCommand*)command;

//完成新手教程
- (void)onGuideFinished:(CDVInvokedUrlCommand*)command;

//完成新手教程
- (void)onPreviewFinished:(CDVInvokedUrlCommand*)command;

//完成免费阅读
- (void)onFreeFinished:(CDVInvokedUrlCommand*)command;

//通过关卡
- (void)onLevelPass:(CDVInvokedUrlCommand*)command;

//成就
- (void)onAchievementUnlock:(CDVInvokedUrlCommand*)command;

@end
