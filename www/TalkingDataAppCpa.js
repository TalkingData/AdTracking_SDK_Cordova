var exec = require('cordova/exec');

var TalkingDataAppCpa = {

    // 初始化 TalkingData AdTracking SDK
    // appKey    : TalkingData appid
    // channelId : 渠道号
    init:function(appKey, channelId) {
        exec(null, null, "TalkingDataAppCpa", "init", [appKey, channelId]);
    },

    setVerboseLogDisable:function() {
        exec(null, null, "TalkingDataAppCpa", "setAntiCheatingEnabled", []);
    },

    // 注册事件
    // accountId : 帐户ID
    onRegister:function(accountId) {
        exec(null, null, "TalkingDataAppCpa", "onRegister", [accountId]);
    },

    // 登录事件
    // accountId : 帐户ID
    onLogin:function(accountId) {
        exec(null, null, "TalkingDataAppCpa", "onLogin", [accountId]);
    },

    onCreateRole: function(roleName){
        exec(null, null, "TalkingDataAppCpa", "onCreateRole", [roleName]);
    },

    onPay: function(accountId, orderid, amount, currencyType) {
        exec(null, null, "TalkingDataAppCpa", "onPay", [accountId, orderid, amount, currencyType]);
    },

    onPayWithPayType: function(accountId, orderid, amount, currencyType, payType) {
        exec(null, null, "TalkingDataAppCpa", "onPayWithPayType", [accountId, orderid, amount, currencyType, payType]);
    },

    onPayWithOrder: function(accountId, orderid, amount, currencyType, payType, order){
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onPayWithOrder", [accountId, orderid, amount, currencyType, payType, orderJson]);
    },

    onPayWithItem: function(accountId, orderid, amount, currencyType, payType, itemId, itemCount) {
        exec(null, null, "TalkingDataAppCpa", "onPayWithItem", [accountId, orderid, amount, currencyType, payType, itemId, itemCount]);
    },
    
    onPlaceOrder:function(accountId, order) {
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onPlaceOrder", [accountId, orderJson]);
    },

    onOrderPaySucc:function(accountId, orderId, amount, currencyType, payType) {
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onOrderPaySucc", [accountId, orderId, amount, currencyType, payType]);
    },

    onViewItem:function(itemId, category, name, unitPrice) {
        exec(null, null, "TalkingDataAppCpa", "onViewItem", [itemId, category, name, unitPrice]);
    },

    onAddItemToShoppingCart:function(itemId, category, name, unitPrice, amount) {
        exec(null, null, "TalkingDataAppCpa", "onAddItemToShoppingCart", [itemId, category, name, unitPrice, amount]);
    },

    // 查看购物车
    // shoppingCart : 购物车详情
    onViewShoppingCart:function(shoppingCart) {
        var shoppingCartJson = JSON.stringify(shoppingCart);
        exec(null, null, "TalkingDataAppCpa", "onViewShoppingCart", [shoppingCartJson]);
    },

    // 获取 TalkingData Device Id，并将其作为参数传入 JS 的回调函数
    // callBack  : 处理 deviceId 的回调函数
    getDeviceId:function(callBack) {
        exec(callBack, null, "TalkingDataAppCpa", "getDeviceId", []);
    },

    onReceiveDeepLink: function(link) {
        exec(null, null, "TalkingDataAppCpa", "onReceiveDeepLink", [link]);
    },

    onCustEvent1: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent1", []);
    },

    onCustEvent2: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent2", []);
    },

    onCustEvent3: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent3", []);
    },

    onCustEvent4: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent4", []);
    },

    onCustEvent5: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent5", []);
    },

    onCustEvent6: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent6", []);
    },

    onCustEvent7: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent7", []);
    },

    onCustEvent8: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent8", []);
    },

    onCustEvent9: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent9", []);
    },

    onCustEvent10: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent10", []);
    }
};

module.exports = TalkingDataAppCpa;
