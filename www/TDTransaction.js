var TDTransaction = {
    createTDTransaction: function(transactionId, category, amount, personA, personB, startData, endData, content, currencyType){
        var transaction = {};
        transaction.transactionId = transactionId;
        transaction.category = category;
        transaction.amount = amount;
        transaction.personA = personA;
        transaction.personB = personB;
        transaction.startData = startData;
        transaction.endData = endData;
        transaction.content = content;
        transaction.currencyType = currencyType;

        return transaction;
    }
}

module.exports = TDTransaction;