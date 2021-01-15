var exec = require('cordova/exec');

var TalkingDataAppCpa = {

    /**
     * 关闭日志
     */
    setVerboseLogDisable: function() {
        exec(null, null, "TalkingDataAppCpa", "setVerboseLogDisable", []);
    },

    /**
     * 获取 TDID，并将其作为参数传入 JS 的回调函数
     * @param {Object}  callBack        : 处理 TDID 的回调函数
     */
    getDeviceId: function(callBack) {
        exec(callBack, null, "TalkingDataAppCpa", "getDeviceId", []);
    },

    /**
     * 获取 OAID，并将其作为参数传入 JS 的回调函数
     * @param {Object}  callBack        : 处理 OAID 的回调函数
     */
    getOAID: function(callBack) {
        exec(callBack, null, "TalkingDataAppCpa", "getOAID", []);
    },

    /**
     * 注册
     * @param {String}  profileId       : 用户账号
     * @param {String}  invitationCode  : 邀请码
     */
    onRegister: function(profileId, invitationCode) {
        exec(null, null, "TalkingDataAppCpa", "onRegister", [profileId, invitationCode]);
    },

    /**
     * 登录
     * @param {String}  profileId       : 用户账号
     */
    onLogin: function(profileId) {
        exec(null, null, "TalkingDataAppCpa", "onLogin", [profileId]);
    },

    /**
     * 添加支付信息
     * @param {String}  profileId       : 用户账号
     * @param {String}  method          : 支付方式
     * @param {String}  content         : 支付信息
     */
    onCreateCard: function(profileId, method, content) {
        exec(null, null, "TalkingDataAppCpa", "onCreateCard", [profileId, method, content]);
    },

    /**
     * 唤醒
     * @param {String}  link            : 唤醒应用的链接
     */
    onReceiveDeepLink: function(link) {
        exec(null, null, "TalkingDataAppCpa", "onReceiveDeepLink", [link]);
    },

    /**
     * 收藏
     * @param {String}  category        : 收藏类别
     * @param {String}  content         : 收藏内容
     */
    onFavorite: function(category, content) {
        exec(null, null, "TalkingDataAppCpa", "onFavorite", [category, content]);
    },

    /**
     * 分享
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 分享内容
     */
    onShare: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onShare", [profileId, content]);
    },

    /**
     * 签到打卡
     * @param {String}  profileId       : 用户账号
     * @param {String}  punchId         : 签到打卡ID
     */
    onPunch: function(profileId, punchId) {
        exec(null, null, "TalkingDataAppCpa", "onPunch", [profileId, punchId]);
    },

    /**
     * 搜索
     * @param {Object}  search          : 搜索属性
     */
    onSearch: function(search) {
        var s = JSON.stringify(search);
        exec(null, null,  "TalkingDataAppCpa", "onSearch", [s]);
    },

    /**
     * 联系
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 联系内容
     */
    onContact: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onContact", [profileId, content]);        
    },

    /**
     * 付费
     * @param {String}  profileId       : 用户账号
     * @param {String}  orderId         : 订单ID
     * @param {Number}  amount          : 订单金额
     * @param {String}  currencyType    : 货币类型
     * @param {String}  payType         : 支付类型
     */
    onPay: function(profileId, orderId, amount, currencyType, payType) {
        exec(null, null, "TalkingDataAppCpa", "onPay", [profileId, orderId, amount, currencyType, payType]);
    },

    /**
     * 退单
     * @param {String}  profileId       : 用户账号
     * @param {String}  orderId         : 订单ID
     * @param {String}  reason          : 退单原因
     * @param {String}  type            : 退单类型
     */
    onChargeBack: function(profileId, orderId, reason, type) {
        exec(null, null, "TalkingDataAppCpa", "onChargeBack", [profileId, orderId, reason, type]);       
    },

    /**
     * 预约
     * @param {String}  profileId       : 用户账号
     * @param {String}  reservationId   : 预约ID
     * @param {String}  category        : 预约分类
     * @param {Number}  amount          : 预约金额
     * @param {String}  term            : 预约信息
     */
    onReservation: function(profileId, reservationId, category, amount, term) {
        exec(null, null, "TalkingDataAppCpa", "onReservation", [profileId, reservationId, category, amount, term]);
    },

    /**
     * 预订
     * @param {String}  profileId       : 用户账号
     * @param {String}  bookingId       : 预订ID
     * @param {String}  category        : 预订分类
     * @param {Number}  amount          : 预订金额
     * @param {String}  content         : 预订信息
     */
    onBooking: function(profileId, bookingId, category, amount, content) {
        exec(null, null, "TalkingDataAppCpa", "onBooking", [profileId, bookingId, category, amount, content]);        
    },

    /**
     * 查看商品
     * @param {String}  itemId          : 商品ID
     * @param {String}  category        : 商品类别
     * @param {String}  name            : 商品名称
     * @param {Number}  unitPrice       : 商品单价
     */
    onViewItem: function(itemId, category, name, unitPrice) {
        exec(null, null, "TalkingDataAppCpa", "onViewItem", [itemId, category, name, unitPrice]);
    },

    /**
     * 添加商品到购物车
     * @param {String}  itemId          : 商品ID
     * @param {String}  category        : 商品类别
     * @param {String}  name            : 商品名称
     * @param {Number}  unitPrice       : 商品单价
     * @param {Number}  amount          : 商品数量
     */
    onAddItemToShoppingCart: function(itemId, category, name, unitPrice, amount) {
        exec(null, null, "TalkingDataAppCpa", "onAddItemToShoppingCart", [itemId, category, name, unitPrice, amount]);
    },

    /**
     * 查看购物车
     * @param {Object}  shoppingCart    : 购物车详情
     */
    onViewShoppingCart: function(shoppingCart) {
        var shoppingCartJson = JSON.stringify(shoppingCart);
        exec(null, null, "TalkingDataAppCpa", "onViewShoppingCart", [shoppingCartJson]);
    },

    /**
     * 下单
     * @param {String}  profileId       : 用户账号
     * @param {Object}  order           : 订单详情
     */
    onPlaceOrder: function(profileId, order) {
        var orderJson = JSON.stringify(order);
        exec(null, null, "TalkingDataAppCpa", "onPlaceOrder", [profileId, orderJson]);
    },

    /**
     * 支付订单
     * @param {String}  profileId       : 用户账号
     * @param {String}  orderId         : 订单ID
     * @param {Number}  amount          : 订单金额
     * @param {String}  currencyType    : 货币类型
     * @param {String}  payType         : 支付类型
     */
    onOrderPaySucc: function(profileId, orderId, amount, currencyType, payType) {
        exec(null, null, "TalkingDataAppCpa", "onOrderPaySucc", [profileId, orderId, amount, currencyType, payType]);
    },

    /**
     * 授信
     * @param {String}  profileId       : 用户账号
     * @param {Number}  amount          : 授信额度
     * @param {String}  content         : 授信信息
     */
    onCredit: function(profileId, amount, content) {
        exec(null, null, "TalkingDataAppCpa", "onCredit", [profileId, amount, content]);
    },

    /**
     * 交易
     * @param {String}  profileId       : 用户账号
     * @param {Object}  transaction     : 交易属性
     */
    onTransaction: function(profileId, transaction) {
        var t = JSON.stringify(transaction);
        exec(null, null, "TalkingDataAppCpa", "onTransaction", [profileId, t]);
    },

    /**
     * 创建角色
     * @param {String}  name            : 角色名称
     */
    onCreateRole: function(name) {
        exec(null, null, "TalkingDataAppCpa", "onCreateRole", [name]);
    },

    /**
     * 通过关卡
     * @param {String}  profileId       : 用户账号
     * @param {String}  levelId         : 关卡ID
     */
    onLevelPass: function(profileId, levelId) {
        exec(null, null, "TalkingDataAppCpa", "onLevelPass", [profileId, levelId]);       
    },

    /**
     * 完成新手教程
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 教程信息
     */
    onGuideFinished: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onGuideFinished", [profileId, content]);       
    },

    /**
     * 课程学习
     * @param {String}  profileId       : 用户账号
     * @param {String}  course          : 课程信息
     * @param {Number}  begin           : 开始时间
     * @param {Number}  duration        : 学习时长
     */
    onLearn: function(profileId, course, begin, duration) {
        exec(null, null, "TalkingDataAppCpa", "onLearn", [profileId, course, begin, duration]);        
    },

    /**
     * 完成课程试听
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 试听信息
     */
    onPreviewFinished: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onPreviewFinished", [profileId, content]);       
    },

    /**
     * 文章阅读
     * @param {String}  profileId       : 用户账号
     * @param {String}  book            : 文章信息
     * @param {Number}  begin           : 开始时间
     * @param {Number}  duration        : 阅读时长
     */
    onRead: function(profileId, book, begin, duration) {
        exec(null, null, "TalkingDataAppCpa", "onRead", [profileId, book, begin, duration]);       
    },

    /**
     * 完成免费阅读
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 阅读信息
     */
    onFreeFinished: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onFreeFinished", [profileId, content]);       
    },

    /**
     * 解锁成就
     * @param {String}  profileId       : 用户账号
     * @param {String}  achievementId   : 成就ID
     */
    onAchievementUnlock: function(profileId, achievementId) {
        exec(null, null, "TalkingDataAppCpa", "onAchievementUnlock", [profileId, achievementId]);       
    },

    /**
     * 浏览详情
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 详情信息
     * @param {Number}  begin           : 开始时间
     * @param {Number}  duration        : 浏览时长
     */
    onBrowse: function(profileId, content, begin, duration) {
        exec(null, null, "TalkingDataAppCpa", "onBrowse", [profileId, content, begin, duration]);       
    },

    /**
     * 完成试用体验
     * @param {String}  profileId       : 用户账号
     * @param {String}  content         : 体验信息
     */
    onTrialFinished: function(profileId, content) {
        exec(null, null, "TalkingDataAppCpa", "onTrialFinished", [profileId, content]);       
    },

    /**
     * 触发自定义事件1
     */
    onCustEvent1: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent1", []);
    },

    /**
     * 触发自定义事件2
     */
    onCustEvent2: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent2", []);
    },

    /**
     * 触发自定义事件3
     */
    onCustEvent3: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent3", []);
    },

    /**
     * 触发自定义事件4
     */
    onCustEvent4: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent4", []);
    },

    /**
     * 触发自定义事件5
     */
    onCustEvent5: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent5", []);
    },

    /**
     * 触发自定义事件6
     */
    onCustEvent6: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent6", []);
    },

    /**
     * 触发自定义事件7
     */
    onCustEvent7: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent7", []);
    },

    /**
     * 触发自定义事件8
     */
    onCustEvent8: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent8", []);
    },

    /**
     * 触发自定义事件9
     */
    onCustEvent9: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent9", []);
    },

    /**
     * 触发自定义事件10
     */
    onCustEvent10: function() {
        exec(null, null, "TalkingDataAppCpa", "onCustEvent10", []);
    },
};

module.exports = TalkingDataAppCpa;
