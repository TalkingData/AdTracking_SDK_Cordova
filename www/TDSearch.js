var TDSearch = {
    createAdSearch: function(category, content, itemId, itemLocationId, destination, origin, startDate, endDate){
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