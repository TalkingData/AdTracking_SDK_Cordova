var TDSearch = {
    /**
     * 创建搜索详情
     * @param {String}  category        : 搜索分类
     * @param {String}  content         : 搜索内容
     * @param {String}  itemId          : （电商类专用）商品ID
     * @param {String}  itemLocationId  : （电商类专用）商品位置
     * @param {String}  destination     : （旅游类专用）目的地城市
     * @param {String}  origin          : （旅游类专用）出发地城市
     * @param {Number}  startDate       : （旅游类专用）起始时间
     * @param {Number}  endDate         : （旅游类专用）截止时间
     */
    createAdSearch: function(category, content, itemId, itemLocationId, destination, origin, startDate, endDate) {
        var search = {};
        search.category = category;
        search.content = content;
        search.itemId = itemId;
        search.itemLocationId = itemLocationId;
        search.destination = destination;
        search.origin = origin;
        search.startDate = startDate;
        search.endDate = endDate;
        return search;
    }
}

module.exports = TDSearch;
