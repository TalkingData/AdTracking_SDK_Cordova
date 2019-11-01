//
//  TalkingDataAppCpaPlugin.m
//  TalkingDataAppCpa_Cordova
//
//  Created by liweiqiang on 13-12-2.
//
//

#import "TalkingDataAppCpaPlugin.h"
#import "TalkingDataAppCpa.h"


@implementation TalkingDataAppCpaPlugin



- (void)setVerboseLogDisable:(CDVInvokedUrlCommand*)command {
    [TalkingDataAppCpa setVerboseLogDisabled];
}

- (void)getDeviceId:(CDVInvokedUrlCommand*)command {
    NSString *deviceId = [TalkingDataAppCpa getDeviceId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceId];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)onReceiveDeepLink:(CDVInvokedUrlCommand*)command {
    NSString *link = [command.arguments objectAtIndex:0];
    if (![link isKindOfClass:[NSString class]]) {
        link = nil;
    }
    NSURL *url = [NSURL URLWithString:link];
    [TalkingDataAppCpa onReceiveDeepLink:url];
}

- (void)onRegister:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId == nil;
    }
    NSString * invivateCode = nil;
    if (command.arguments.count >= 2) {
        invivateCode = [command.arguments objectAtIndex:1];
        if (![invivateCode isKindOfClass:[NSString class]]) {
            invivateCode == nil;
        }
    }
    [TalkingDataAppCpa onRegister:accountId invitationCode:invivateCode];
}

- (void)onLogin:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId == nil;
    }
    [TalkingDataAppCpa onLogin:accountId];
}


- (void)onCreateCard:(CDVInvokedUrlCommand*)command {
    NSString *account = [command.arguments objectAtIndex:0];
    if (![account isKindOfClass:[NSString class]]) {
        account == nil;
    }
    NSString *method = [command.arguments objectAtIndex:1];
    if (![method isKindOfClass:[NSString class]]) {
        method == nil;
    }
    NSString *content = [command.arguments objectAtIndex:2];
    if (![content isKindOfClass:[NSString class]]) {
        content == nil;
    }
    [TalkingDataAppCpa onCreateCard:account method:method content:content];
}


- (void)onCreateRole:(CDVInvokedUrlCommand*)command {
    NSString *roleName = [command.arguments objectAtIndex:0];
    if (![roleName isKindOfClass:[NSString class]]) {
        roleName = nil;
    }
    [TalkingDataAppCpa onCreateRole:roleName];
}

- (void)onPay:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    int amount = [[command.arguments objectAtIndex:2] intValue];
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if (![currencyType isKindOfClass:[NSString class]]) {
        currencyType = nil;
    }
    NSString *payType = [command.arguments objectAtIndex:4];
    if (![payType isKindOfClass:[NSString class]]) {
        payType = nil;
    }
    [TalkingDataAppCpa onPay:accountId withOrderId:orderId withAmount:amount withCurrencyType:currencyType withPayType:payType];
}

- (void)onPlaceOrder:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    NSString *orderStr = [command.arguments objectAtIndex:1];
    if (![orderStr isKindOfClass:[NSString class]]) {
        orderStr = nil;
    }
    TDOrder *order = [self stringToOrder:orderStr];
    [TalkingDataAppCpa onPlaceOrder:accountId withOrder:order];
}

- (void)onOrderPaySucc:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    int amount = [[command.arguments objectAtIndex:2] intValue];
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if (![currencyType isKindOfClass:[NSString class]]) {
        currencyType = nil;
    }
    NSString *payType = [command.arguments objectAtIndex:4];
    if (![payType isKindOfClass:[NSString class]]) {
        payType = nil;
    }
    [TalkingDataAppCpa onOrderPaySucc:accountId withOrderId:orderId withAmount:amount withCurrencyType:currencyType withPayType:payType];
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
    int unitPrice = [[command.arguments objectAtIndex:3] intValue];
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
    int unitPrice = [[command.arguments objectAtIndex:3] intValue];
    int amount = [[command.arguments objectAtIndex:4] intValue];
    [TalkingDataAppCpa onAddItemToShoppingCartWithCategory:category itemId:itemId name:name unitPrice:unitPrice amount:amount];
}

- (void)onViewShoppingCart:(CDVInvokedUrlCommand*)command {
    NSString *shoppingCartStr = [command.arguments objectAtIndex:0];
    if (!shoppingCartStr || ![shoppingCartStr isKindOfClass:[NSString class]]) {
        return;
    }
    TDShoppingCart *shoppingCart = [self stringToShoppingCart:shoppingCartStr];
    [TalkingDataAppCpa onViewShoppingCart:shoppingCart];
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

- (TDOrder *)stringToOrder:(NSString *)orderStr {
    NSDictionary *orderDic = [self jsonToDictionary:orderStr];
    TDOrder *order = [TDOrder orderWithOrderId:orderDic[@"orderId"] total:[orderDic[@"total"] intValue] currencyType:orderDic[@"currencyType"]];
    NSArray *items = orderDic[@"items"];
    for (NSDictionary *item in items) {
        [order addItemWithCategory:item[@"category"] itemId:item[@"itemId"] name:item[@"name"] unitPrice:[item[@"unitPrice"] intValue] amount:[item[@"amount"] intValue]];
    }
    
    return order;
}

- (TDShoppingCart *)stringToShoppingCart:(NSString *)shoppingCartStr {
    NSDictionary *shoppingCartDic = [self jsonToDictionary:shoppingCartStr];
    TDShoppingCart *shoppingCart = [TDShoppingCart createShoppingCart];
    NSArray *items = shoppingCartDic[@"items"];
    for (NSDictionary *item in items) {
        [shoppingCart addItemWithCategory:item[@"category"] itemId:item[@"itemId"] name:item[@"name"] unitPrice:[item[@"unitPrice"] intValue] amount:[item[@"amount"] intValue]];
    }
    
    return shoppingCart;
}

- (NSDictionary *)jsonToDictionary:(NSString *)jsonStr {
    if (jsonStr) {
        NSError* error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
        if (error == nil && [object isKindOfClass:[NSDictionary class]]) {
            return object;
        }
    }
    
    return nil;
}

- (TDSearch *)stringToSearch:(NSString *)orderStr {
    NSDictionary *transactionDict = [self jsonToDictionary:orderStr];
    TDSearch * search = [[TDSearch alloc]init];
    search.category = transactionDict[@"category"];
    search.content = transactionDict[@"content"];
    search.itemLocationId = transactionDict[@"itemLocationId"];
    search.destination = transactionDict[@"destination"];
    search.origin = transactionDict[@"origin"];
    search.startDate = [transactionDict[@"startDate"] intValue];
    search.endDate = [transactionDict[@"endDate"] intValue];
    return search;
}


- (TDTransaction *)stringToTransaction:(NSString *)orderStr {
    NSDictionary *transactionDict = [self jsonToDictionary:orderStr];
    TDTransaction * transaction = [[TDTransaction alloc]init];
    transaction.transactionId = transactionDict[@"transactionId"];
    transaction.category = transactionDict[@"category"];
    transaction.amount = [transactionDict[@"amount"]intValue];
    transaction.personA = transactionDict[@"personA"];
    transaction.personB = transactionDict[@"personB"];
    transaction.startDate = [transactionDict[@"startDate"] intValue];
    transaction.endDate = [transactionDict[@"endDate"] intValue];
    transaction.currencyType = transactionDict[@"currencyType"];
    transaction.content = transactionDict[@"content"];
    
    return transaction;
}

- (void)onTransaction:(CDVInvokedUrlCommand*)command{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    NSString *transactionStr = [command.arguments objectAtIndex:1];
    TDTransaction * t = [self stringToTransaction:transactionStr];
    [TalkingDataAppCpa onTransaction:accountId transaction:t];
}

- (void)onCredit:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    int amount = [[command.arguments objectAtIndex:1]intValue];

    NSString *content = [command.arguments objectAtIndex:2];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onCredit:accountId amount:amount content:content];
}

- (void)onFavorite:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onFavorite:accountId content:content];
}

- (void)onShare:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onShare:accountId content:content];
}

- (void)onPunch:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *punchId = [command.arguments objectAtIndex:1];
    if (![punchId isKindOfClass:[NSString class]]) {
        punchId = nil;
    }
    [TalkingDataAppCpa onPunch:accountId punchId:punchId];
}

- (void)onSearch:(CDVInvokedUrlCommand*)command
{
    NSString *searchString = [command.arguments objectAtIndex:0];
    TDSearch * s = [self stringToSearch:searchString];
    [TalkingDataAppCpa onSearch:s];
}

- (void)onReservation:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *reservationId = [command.arguments objectAtIndex:1];
    if (![reservationId isKindOfClass:[NSString class]]) {
        reservationId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:2];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    int amount = [[command.arguments objectAtIndex:3]intValue];

    NSString *term = [command.arguments objectAtIndex:4];
    if (![term isKindOfClass:[NSString class]]) {
        term = nil;
    }
    [TalkingDataAppCpa onReservation:accountId reservationId:reservationId category:category amount:amount term:term];
}

- (void)onBooking:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *bookingId = [command.arguments objectAtIndex:1];
    if (![bookingId isKindOfClass:[NSString class]]) {
        bookingId = nil;
    }
    
    NSString *category = [command.arguments objectAtIndex:2];
    if (![category isKindOfClass:[NSString class]]) {
        category = nil;
    }
    
    int amount = [[command.arguments objectAtIndex:3]intValue];
    
    NSString *content = [command.arguments objectAtIndex:4];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    [TalkingDataAppCpa onBooking:accountId bookingId:bookingId category:category amount:amount content:content];
}

- (void)onContact:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }

    [TalkingDataAppCpa onContact:accountId content:content];
}


- (void)onLearn:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *course = [command.arguments objectAtIndex:1];
    if (![course isKindOfClass:[NSString class]]) {
        course = nil;
    }
    
    int64_t begin = [[command.arguments objectAtIndex:2] integerValue];
    int duration = [[command.arguments objectAtIndex:3] intValue];

    [TalkingDataAppCpa onLearn:accountId course:course begin:begin duration:duration];
}

- (void)onRead:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *book = [command.arguments objectAtIndex:1];
    if (![book isKindOfClass:[NSString class]]) {
        book = nil;
    }
    
    int64_t begin = [[command.arguments objectAtIndex:2] integerValue];
    int duration = [[command.arguments objectAtIndex:3] intValue];
    
    [TalkingDataAppCpa onRead:accountId book:book begin:begin duration:duration];
}

- (void)onBrowse:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    
    int64_t begin = [[command.arguments objectAtIndex:2] integerValue];
    int duration = [[command.arguments objectAtIndex:3] intValue];
    
    [TalkingDataAppCpa onBrowse:accountId content:content begin:begin duration:duration];
}

- (void)onChargeBack:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *orderId = [command.arguments objectAtIndex:1];
    if (![orderId isKindOfClass:[NSString class]]) {
        orderId = nil;
    }
    
    NSString *reason = [command.arguments objectAtIndex:1];
    if (![reason isKindOfClass:[NSString class]]) {
        reason = nil;
    }
    
    NSString *type = [command.arguments objectAtIndex:1];
    if (![type isKindOfClass:[NSString class]]) {
        type = nil;
    }
    
    [TalkingDataAppCpa onChargeBack:accountId orderId:orderId reason:reason type:type];
}


- (void)onTrailFinished:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onTrialFinished:accountId content:content];
}

- (void)onGuideFinished:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onGuideFinished:accountId content:content];
}

- (void)onPreviewFinished:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onPreviewFinished:accountId content:content];
}


- (void)onFreeFinished:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *content = [command.arguments objectAtIndex:1];
    if (![content isKindOfClass:[NSString class]]) {
        content = nil;
    }
    [TalkingDataAppCpa onFreeFinished:accountId content:content];
}

//通过关卡
- (void)onLevelPass:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *levelId = [command.arguments objectAtIndex:1];
    if (![levelId isKindOfClass:[NSString class]]) {
        levelId = nil;
    }
    [TalkingDataAppCpa onLevelPass:accountId levelId:levelId];
}

//成就
- (void)onAchievementUnlock:(CDVInvokedUrlCommand*)command
{
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId = nil;
    }
    
    NSString *achievementId = [command.arguments objectAtIndex:1];
    if (![achievementId isKindOfClass:[NSString class]]) {
        achievementId = nil;
    }
    [TalkingDataAppCpa onAchievementUnlock:accountId achievementId:achievementId];
}

@end
