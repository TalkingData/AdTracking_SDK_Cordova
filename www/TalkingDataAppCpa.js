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
    onRegister:function(accountId, invitationCode) {
        exec(null, null, "TalkingDataAppCpa", "onRegister", [accountId, invitationCode]);
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
    },

    onCreateCard: function(accountId, method, content){
        exec(null, null, "TalkingDataAppCpa", "onCreateCard", [accountId, method, content]);
    },

    onSearch: function(search){
        exec(null, null,  "TalkingDataAppCpa", "onSearch", [search]);
    },

    /**
     * 专属-交易事件
     * @param {String} accountId 
     * @param {Object} transaction 
     */
    onTransaction: function(accountId, transaction) {
        var t = JSON.stringify(transaction);
        exec(null, null, "TalkingDataAppCpa", "onTransaction", [accountId, t]);
    },

    /**
     * 专属-授信
     * @param {String} accountId 
     * @param {Number} amount 
     * @param {String} content 
     */
    onCredit: function(accountId, amount, content) {
        exec(null, null, "TalkingDataAppCpa", "onCredit", [accountId, amount, content]);
    },
    /**
     * 收藏
     * @param {*} category 
     * @param {*} content 
     */
    onFavorite: function(category, content) {
        exec(null, null, "TalkingDataAppCpa", "onFavorite", [category, content]);
    },
    /**
     * 分享
     * @param {*} accountId 
     * @param {*} content 
     */
    onShare: function(accountId, content) {
        exec(null, null, "TalkingDataAppCpa", "onShare", [accountId, content]);
    },
    /**
     * 签到打卡
     * @param {*} accountId 
     * @param {*} punchId 
     */
    onPunch: function(accountId, punchId) {
        exec(null, null, "TalkingDataAppCpa", "onPunch", [accountId, punchId]);
    },
    /**
     * 预约
     * @param {*} accountId 
     * @param {*} reservationId 
     * @param {*} category 
     * @param {*} amount 
     * @param {*} term 
     */
    onReservation: function(accountId, reservationId, category, amount, term) {
        exec(null, null, "TalkingDataAppCpa", "onReservation", [accountId, reservationId, category, amount, term]);
    },
    /**
     * 预定
     */
    onBooking: function(accountId, bookingId, category, amount, content) {
        exec(null, null, "TalkingDataAppCpa", "onBooking", [accountId, bookingId, category, amount, content]);        
    },
    /**
     * 联系
     * @param {*} accountId 
     * @param {*} content 
     */
    onContact: function(accountId, content) {
        exec(null, null, "TalkingDataAppCpa", "onContact", [accountId, content]);        
    },
    /**
     * 课程学习
     * @param {String} accountId 
     * @param {String} course 
     * @param {Number} begin 
     * @param {Number} duration 
     */
    onLearn: function(accountId, course, begin, duration) {
        exec(null, null, "TalkingDataAppCpa", "onLearn", [accountId, course, begin, duration]);        
    },
    /**
     * 文章阅读
     * @param {*} accountId 
     * @param {*} book 
     * @param {*} begin 
     * @param {*} duration 
     */
    onRead: function(accountId, book, begin, duration) {
        exec(null, null, "TalkingDataAppCpa", "onRead", [accountId, book, begin, duration]);       
    },
    /**
     * 专属-浏览详情
     * @param {*} accountId 
     * @param {*} content 
     * @param {*} begin 
     * @param {*} duration 
     */
    onBrowse: function(accountId, content, begin, duration){
        exec(null, null, "TalkingDataAppCpa", "onBrowse", [accountId, content, begin, duration]);       
    },
    /**
     * 专属-退单
     * @param {*} accountId 
     * @param {*} orderId 
     * @param {*} reason 
     * @param {*} type 
     */
    onChargeBack: function(accountId, orderId, reason, type) {
        exec(null, null, "TalkingDataAppCpa", "onChargeBack", [accountId, orderId, reason, type]);       
    },
    /**
     * 专属-完成使用体验
     * @param {*} accountId 
     * @param {*} content 
     */
    onTrialFinished: function(accountId, content){
        exec(null, null, "TalkingDataAppCpa", "onTrialFinished", [accountId, content]);       
    },
    /**
     * 完成新手教程
     * @param {*} accountId 
     * @param {*} content 
     */
    onGuideFinished: function(accountId, content) {
        exec(null, null, "TalkingDataAppCpa", "onGuideFinished", [accountId, content]);       
    },
    /**
     * 完成课程试听
     * @param {*} accountId 
     * @param {*} content 
     */
    onPreviewFinished: function(accountId, content) {
        exec(null, null, "TalkingDataAppCpa", "onPreviewFinished", [accountId, content]);       
    },
    /**
     * 完成免费阅读
     * @param {*} accountId 
     * @param {*} content 
     */
    onFreeFinished: function(accountId, content) {
        exec(null, null, "TalkingDataAppCpa", "onFreeFinished", [accountId, content]);       
    },
    /**
     * 通过关卡
     * @param {*} accountId 
     * @param {*} levelId 
     */
    onLevelPass: function(accountId, levelId) {
        exec(null, null, "TalkingDataAppCpa", "onLevelPass", [accountId, levelId]);       
    },
    /**
     * 成就
     * @param {*} accountId 
     * @param {*} achievementId 
     */
    onAchievementUnlock: function(accountId, achievementId) {
        exec(null, null, "TalkingDataAppCpa", "onAchievementUnlock", [accountId, achievementId]);       
    },
};

module.exports = TalkingDataAppCpa;
