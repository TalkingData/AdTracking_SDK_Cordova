var TDTransaction = {
    /**
     * 创建交易详情
     * @param {String}  transactionId   : 交易ID
     * @param {String}  category        : 交易分类
     * @param {Number}  amount          : 交易额
     * @param {String}  personA         : 交易甲方
     * @param {String}  personB         : 交易乙方
     * @param {Number}  startDate       : 起始时间
     * @param {Number}  endDate         : 截止时间
     * @param {String}  content         : 交易内容
     * @param {String}  currencyType    : 货币类型
     */
    createTDTransaction: function(transactionId, category, amount, personA, personB, startDate, endDate, content, currencyType) {
        var transaction = {};
        transaction.transactionId = transactionId;
        transaction.category = category;
        transaction.amount = amount;
        transaction.personA = personA;
        transaction.personB = personB;
        transaction.startDate = startDate;
        transaction.endDate = endDate;
        transaction.content = content;
        transaction.currencyType = currencyType;
        return transaction;
    }
}

module.exports = TDTransaction;
