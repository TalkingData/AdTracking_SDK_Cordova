#import "TalkingDataAppCpaPlugin.h"
#import "TalkingDataAppCpa.h"


@implementation TalkingDataAppCpaPlugin

- (void)setVerboseLogDisable:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa setVerboseLogDisable];
}

- (void)getDeviceId:(CDVInvokedUrlCommand*)command {
    NSString *deviceId = [TalkingDataAppCpa getDeviceId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceId];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)onRegister:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *invivateCode = [command.arguments objectAtIndex:1];
    if (![invivateCode isKindOfClass:[NSString class]]) {
        invivateCode = nil;
    }
    
    [TalkingDataAppCpa onRegister:profileId invitationCode:invivateCode];
}

- (void)onLogin:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    [TalkingDataAppCpa onLogin:profileId];
}

- (void)onCreateCard:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *method = [command.arguments objectAtIndex:1];
    if (![method isKindOfClass:[NSString class]]) {
        method = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:2];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onCreateCard:profileId method:method content:content];
}

- (void)onReceiveDeepLink:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSString class]]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:arg0];
    
    [TalkingDataAppCpa onReceiveDeepLink:url];
}

- (void)onFavorite:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onFavorite:profileId content:content];
}

- (void)onShare:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onShare:profileId content:content];
}

- (void)onPunch:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *punchId = [command.arguments objectAtIndex:1];
    if (![punchId isKindOfClass:[NSString class]]) {
        punchId = nil;
    }
    
    [TalkingDataAppCpa onPunch:profileId punchId:punchId];
}

- (void)onSearch:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    TDSearch *search = [self stringToSearch:arg0];
    
    [TalkingDataAppCpa onSearch:search];
}

- (void)onContact:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onContact:profileId content:content];
}

- (void)onPay:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    
    int amount = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        amount = [arg2 intValue];
    }
    
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if (![currencyType isKindOfClass:[NSString class]]) {
        currencyType = nil;
    }
    
    NSString *payType = [command.arguments objectAtIndex:4];
    if (![payType isKindOfClass:[NSString class]]) {
        payType = nil;
    }
    
    [TalkingDataAppCpa onPay:profileId withOrderId:orderId withAmount:amount withCurrencyType:currencyType withPayType:payType];
}

- (void)onChargeBack:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    
    NSString *reason = [command.arguments objectAtIndex:2];
    if (![reason isKindOfClass:[NSString class]]) {
        reason = nil;
    }
    
    NSString *type = [command.arguments objectAtIndex:3];
    if (![type isKindOfClass:[NSString class]]) {
        type = nil;
    }
    
    [TalkingDataAppCpa onChargeBack:profileId orderId:orderId reason:reason type:type];
}

- (void)onReservation:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *reservationId = [command.arguments objectAtIndex:1];
    if (![reservationId isKindOfClass:[NSString class]]) {
        reservationId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:2];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    int amount = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        amount = [arg3 intValue];
    }
    
    NSString *term = [command.arguments objectAtIndex:4];
    if (![term isKindOfClass:[NSString class]]) {
        term = nil;
    }
    
    [TalkingDataAppCpa onReservation:profileId reservationId:reservationId category:category amount:amount term:term];
}

- (void)onBooking:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *bookingId = [command.arguments objectAtIndex:1];
    if (![bookingId isKindOfClass:[NSString class]]) {
        bookingId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:2];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    int amount = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        amount = [arg3 intValue];
    }
    
    NSString *content = [command.arguments objectAtIndex:4];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onBooking:profileId bookingId:bookingId category:category amount:amount content:content];
}

- (void)onViewItem:(CDVInvokedUrlCommand*)command {
    NSString *itemId = [command.arguments objectAtIndex:0];
    if (![itemId isKindOfClass:[NSString class]]) {
        itemId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:1];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    NSString *name = [command.arguments objectAtIndex:2];
    if (![name isKindOfClass:[NSString class]]) {
        name = nil;
    }
    
    int unitPrice = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        unitPrice = [arg3 intValue];
    }
    
    [TalkingDataAppCpa onViewItemWithCategory:category itemId:itemId name:name unitPrice:unitPrice];
}

- (void)onAddItemToShoppingCart:(CDVInvokedUrlCommand*)command {
    NSString *itemId = [command.arguments objectAtIndex:0];
    if (![itemId isKindOfClass:[NSString class]]) {
        itemId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:1];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    NSString *name = [command.arguments objectAtIndex:2];
    if (![name isKindOfClass:[NSString class]]) {
        name = nil;
    }
    
    int unitPrice = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        unitPrice = [arg3 intValue];
    }
    
    int amount = 0;
    NSNumber *arg4 = [command.arguments objectAtIndex:4];
    if ([arg4 isKindOfClass:[NSNumber class]]) {
        amount = [arg4 intValue];
    }
    
    [TalkingDataAppCpa onAddItemToShoppingCartWithCategory:category itemId:itemId name:name unitPrice:unitPrice amount:amount];
}

- (void)onViewShoppingCart:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    TDShoppingCart *shoppingCart = [self stringToShoppingCart:arg0];
    
    [TalkingDataAppCpa onViewShoppingCart:shoppingCart];
}

- (void)onPlaceOrder:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *arg1 = [command.arguments objectAtIndex:1];
    TDOrder *order = [self stringToOrder:arg1];
    
    [TalkingDataAppCpa onPlaceOrder:profileId withOrder:order];
}

- (void)onOrderPaySucc:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    
    int amount = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        amount = [arg2 intValue];
    }
    
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if (![currencyType isKindOfClass:[NSString class]]) {
        currencyType = nil;
    }
    
    NSString *payType = [command.arguments objectAtIndex:4];
    if (![payType isKindOfClass:[NSString class]]) {
        payType = nil;
    }
    
    [TalkingDataAppCpa onOrderPaySucc:profileId withOrderId:orderId withAmount:amount withCurrencyType:currencyType withPayType:payType];
}

- (void)onCredit:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    int amount = 0;
    NSNumber *arg1 = [command.arguments objectAtIndex:1];
    if ([arg1 isKindOfClass:[NSNumber class]]) {
        amount = [arg1 intValue];
    }
    
    NSString *content = [command.arguments objectAtIndex:2];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onCredit:profileId amount:amount content:content];
}

- (void)onTransaction:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *arg1 = [command.arguments objectAtIndex:1];
    TDTransaction *transaction = [self stringToTransaction:arg1];
    
    [TalkingDataAppCpa onTransaction:profileId transaction:transaction];
}

- (void)onCreateRole:(CDVInvokedUrlCommand*)command {
    NSString *roleName = [command.arguments objectAtIndex:0];
    if (![roleName isKindOfClass:[NSString class]]) {
        roleName = nil;
    }
    
    [TalkingDataAppCpa onCreateRole:roleName];
}

- (void)onLevelPass:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *levelId = [command.arguments objectAtIndex:1];
    if (![levelId isKindOfClass:[NSString class]]) {
        levelId = nil;
    }
    
    [TalkingDataAppCpa onLevelPass:profileId levelId:levelId];
}

- (void)onGuideFinished:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onGuideFinished:profileId content:content];
}

- (void)onLearn:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *course = [command.arguments objectAtIndex:1];
    if (![course isKindOfClass:[NSString class]]) {
        course = nil;
    }
    
    int64_t begin = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        begin = [arg2 longLongValue];
    }
    
    int duration = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        duration = [arg3 intValue];
    }

    [TalkingDataAppCpa onLearn:profileId course:course begin:begin duration:duration];
}

- (void)onPreviewFinished:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onPreviewFinished:profileId content:content];
}

- (void)onRead:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *book = [command.arguments objectAtIndex:1];
    if (![book isKindOfClass:[NSString class]]) {
        book = nil;
    }
    
    int64_t begin = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        begin = [arg2 longLongValue];
    }
    
    int duration = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        duration = [arg3 intValue];
    }
    
    [TalkingDataAppCpa onRead:profileId book:book begin:begin duration:duration];
}

- (void)onFreeFinished:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onFreeFinished:profileId content:content];
}

- (void)onAchievementUnlock:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *achievementId = [command.arguments objectAtIndex:1];
    if (![achievementId isKindOfClass:[NSString class]]) {
        achievementId = nil;
    }
    
    [TalkingDataAppCpa onAchievementUnlock:profileId achievementId:achievementId];
}

- (void)onBrowse:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    int64_t begin = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        begin = [arg2 longLongValue];
    }
    
    int duration = 0;
    NSNumber *arg3 = [command.arguments objectAtIndex:3];
    if ([arg3 isKindOfClass:[NSNumber class]]) {
        duration = [arg3 intValue];
    }
    
    [TalkingDataAppCpa onBrowse:profileId content:content begin:begin duration:duration];
}

- (void)onTrialFinished:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        profileId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onTrialFinished:profileId content:content];
}

- (void)onCustEvent1:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent1];
}

- (void)onCustEvent2:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent2];
}

- (void)onCustEvent3:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent3];
}

- (void)onCustEvent4:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent4];
}

- (void)onCustEvent5:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent5];
}

- (void)onCustEvent6:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent6];
}

- (void)onCustEvent7:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent7];
}

- (void)onCustEvent8:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent8];
}

- (void)onCustEvent9:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent9];
}

- (void)onCustEvent10:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa onCustEvent10];
}

- (NSDictionary *)jsonToDictionary:(NSString *)jsonStr {
    if (![jsonStr isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (error || ![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    return object;
}

- (TDSearch *)stringToSearch:(NSString *)searchStr {
    NSDictionary *searchDic = [self jsonToDictionary:searchStr];
    if (searchDic == nil) {
        return nil;
    }
    
    TDSearch *search = [[TDSearch alloc] init];
    search.category = searchDic[@"category"];
    search.content = searchDic[@"content"];
    search.itemLocationId = searchDic[@"itemLocationId"];
    search.itemId = searchDic[@"itemId"];
    search.destination = searchDic[@"destination"];
    search.origin = searchDic[@"origin"];
    search.startDate = [searchDic[@"startDate"] intValue];
    search.endDate = [searchDic[@"endDate"] intValue];

    return search;
}

- (TDOrder *)stringToOrder:(NSString *)orderStr {
    NSDictionary *orderDic = [self jsonToDictionary:orderStr];
    if (orderDic == nil) {
        return nil;
    }
    
    TDOrder *order = [TDOrder orderWithOrderId:orderDic[@"orderId"] total:[orderDic[@"total"] intValue] currencyType:orderDic[@"currencyType"]];
    NSArray *items = orderDic[@"items"];
    for (NSDictionary *item in items) {
        [order addItemWithCategory:item[@"category"] itemId:item[@"itemId"] name:item[@"name"] unitPrice:[item[@"unitPrice"] intValue] amount:[item[@"amount"] intValue]];
    }
    
    return order;
}

- (TDShoppingCart *)stringToShoppingCart:(NSString *)shoppingCartStr {
    NSDictionary *shoppingCartDic = [self jsonToDictionary:shoppingCartStr];
    if (shoppingCartDic == nil) {
        return nil;
    }
    
    TDShoppingCart *shoppingCart = [TDShoppingCart createShoppingCart];
    NSArray *items = shoppingCartDic[@"items"];
    for (NSDictionary *item in items) {
        [shoppingCart addItemWithCategory:item[@"category"] itemId:item[@"itemId"] name:item[@"name"] unitPrice:[item[@"unitPrice"] intValue] amount:[item[@"amount"] intValue]];
    }
    
    return shoppingCart;
}

- (TDTransaction *)stringToTransaction:(NSString *)transactionStr {
    NSDictionary *transactionDic = [self jsonToDictionary:transactionStr];
    if (transactionDic == nil) {
        return nil;
    }
    
    TDTransaction *transaction = [[TDTransaction alloc] init];
    transaction.transactionId = transactionDic[@"transactionId"];
    transaction.category = transactionDic[@"category"];
    transaction.amount = [transactionDic[@"amount"]intValue];
    transaction.personA = transactionDic[@"personA"];
    transaction.personB = transactionDic[@"personB"];
    transaction.startDate = [transactionDic[@"startDate"] intValue];
    transaction.endDate = [transactionDic[@"endDate"] intValue];
    transaction.currencyType = transactionDic[@"currencyType"];
    transaction.content = transactionDic[@"content"];
    
    return transaction;
}

@end
