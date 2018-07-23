//
//  TalkingDataAppCpaPlugin.m
//  TalkingDataAppCpa_Cordova
//
//  Created by liweiqiang on 13-12-2.
//
//

#import "TalkingDataAppCpaPlugin.h"
#import "TalkingDataAppCpa.h"


@implementation TalkingDataPluginAppCpa

- (void)init:(CDVInvokedUrlCommand*)command {
    NSString *appId = [command.arguments objectAtIndex:0];
    if (appId == nil || [appId isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *channelId = [command.arguments objectAtIndex:1];
    if ([channelId isKindOfClass:[NSNull class]]) {
        channelId = nil;
    }
    [TalkingDataAppCpa inti:appId withChannelId:channelId];
}

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
    [TalkingDataAppCpa onRegister:accountId];
}

- (void)onLogin:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (![accountId isKindOfClass:[NSString class]]) {
        accountId == nil;
    }
    [TalkingDataAppCpa onLogin:accountId];
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

@end
