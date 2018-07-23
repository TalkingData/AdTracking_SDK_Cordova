var exec = require('cordova/exec');

var TalkingDataAppCpa = {

    // 初始化 TalkingData AdTracking SDK
    // appId        : TalkingData appId
    // channelId    : 渠道号
    init:function(appId, channelId) {
        exec(null, null, "TalkingDataAppCpa", "init", [appId, channelId]);
    },

    // 关闭在控制台中打印运行时日志
    setVerboseLogDisable:function() {
        exec(null, null, "TalkingDataAppCpa", "setVerboseLogDisable", []);
    },

    // 获取 TalkingData Device Id，并将其作为参数传入 JS 的回调函数
    // callBack     : 处理 deviceId 的回调函数
    getDeviceId:function(callBack) {
        exec(callBack, null, "TalkingDataAppCpa", "getDeviceId", []);
    },

    // DeepLink事件
    // link         : 链接
    onReceiveDeepLink: function(link) {
        exec(null, null, "TalkingDataAppCpa", "onReceiveDeepLink", [link]);
    },

    // 注册事件
    // accountId    : 帐户ID
    onRegister:function(accountId) {
        exec(null, null, "TalkingDataAppCpa", "onRegister", [accountId]);
    },

    // 登录事件
    // accountId    : 帐户ID
    onLogin:function(accountId) {
        exec(null, null, "TalkingDataAppCpa", "onLogin", [accountId]);
    },

    // 创建角色
    // roleName     : 角色名称
    onCreateRole: function(roleName){
        exec(null, null, "TalkingDataAppCpa", "onCreateRole", [roleName]);
    },

    // 支付
    // accountId    : 账户ID
    // orderId      : 订单ID
    // amount       : 金额
    // currencyType : 币种
    // payType      : 支付类型
    onPay: function(accountId, orderId, amount, currencyType, payType) {
        exec(null, null, "TalkingDataAppCpa", "onPay", [accountId, orderId, amount, currencyType, payType]);
    },
    
    // 下单
    // accountId    : 帐户ID
    // order        : 订单详情
    onPlaceOrder:function(accountId, order) {
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onPlaceOrder", [accountId, orderJson]);
    },

    // 支付订单
    // accountId    : 帐户ID
    // orderId      : 订单ID
    // amount       : 金额
    // currencyType : 币种
    // payType      : 支付类型
    onOrderPaySucc:function(accountId, orderId, amount, currencyType, payType) {
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onOrderPaySucc", [accountId, orderId, amount, currencyType, payType]);
    },

    // 查看商品
    // itemId       : 商品ID
    // category     : 商品类别
    // name         : 商品名称
    // unitPrice    : 商品单价
    onViewItem:function(itemId, category, name, unitPrice) {
        exec(null, null, "TalkingDataAppCpa", "onViewItem", [itemId, category, name, unitPrice]);
    },

    // 添加商品到购物车
    // itemId       : 商品ID
    // category     : 商品类别
    // name         : 商品名称
    // unitPrice    : 商品单价
    // amount       : 商品数量
    onAddItemToShoppingCart:function(itemId, category, name, unitPrice, amount) {
        exec(null, null, "TalkingDataAppCpa", "onAddItemToShoppingCart", [itemId, category, name, unitPrice, amount]);
    },

    // 查看购物车
    // shoppingCart : 购物车详情
    onViewShoppingCart:function(shoppingCart) {
        var shoppingCartJson = JSON.stringify(shoppingCart);
        exec(null, null, "TalkingDataAppCpa", "onViewShoppingCart", [shoppingCartJson]);
    },

    // 触发自定义事件1
    onCustEvent1: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent1", []);
    },

    // 触发自定义事件2
    onCustEvent2: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent2", []);
    },

    // 触发自定义事件3
    onCustEvent3: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent3", []);
    },

    // 触发自定义事件4
    onCustEvent4: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent4", []);
    },

    // 触发自定义事件5
    onCustEvent5: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent5", []);
    },

    // 触发自定义事件6
    onCustEvent6: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent6", []);
    },

    // 触发自定义事件7
    onCustEvent7: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent7", []);
    },

    // 触发自定义事件8
    onCustEvent8: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent8", []);
    },

    // 触发自定义事件9
    onCustEvent9: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent9", []);
    },

    // 触发自定义事件10
    onCustEvent10: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent10", []);
    }
};

module.exports = TalkingDataAppCpa;
