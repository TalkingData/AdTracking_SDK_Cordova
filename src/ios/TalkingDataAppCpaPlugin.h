#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>


@interface TalkingDataAppCpaPlugin : CDVPlugin

- (void)setVerboseLogDisable:(CDVInvokedUrlCommand*)command;
- (void)getDeviceId:(CDVInvokedUrlCommand*)command;
- (void)onRegister:(CDVInvokedUrlCommand*)command;
- (void)onLogin:(CDVInvokedUrlCommand*)command;
- (void)onCreateCard:(CDVInvokedUrlCommand*)command;
- (void)onReceiveDeepLink:(CDVInvokedUrlCommand*)command;
- (void)onFavorite:(CDVInvokedUrlCommand*)command;
- (void)onShare:(CDVInvokedUrlCommand*)command;
- (void)onPunch:(CDVInvokedUrlCommand*)command;
- (void)onSearch:(CDVInvokedUrlCommand*)command;
- (void)onContact:(CDVInvokedUrlCommand*)command;
- (void)onPay:(CDVInvokedUrlCommand*)command;
- (void)onChargeBack:(CDVInvokedUrlCommand*)command;
- (void)onReservation:(CDVInvokedUrlCommand*)command;
- (void)onBooking:(CDVInvokedUrlCommand*)command;
- (void)onViewItem:(CDVInvokedUrlCommand*)command;
- (void)onAddItemToShoppingCart:(CDVInvokedUrlCommand*)command;
- (void)onViewShoppingCart:(CDVInvokedUrlCommand*)command;
- (void)onPlaceOrder:(CDVInvokedUrlCommand*)command;
- (void)onOrderPaySucc:(CDVInvokedUrlCommand*)command;
- (void)onCredit:(CDVInvokedUrlCommand*)command;
- (void)onTransaction:(CDVInvokedUrlCommand*)command;
- (void)onCreateRole:(CDVInvokedUrlCommand*)command;
- (void)onLevelPass:(CDVInvokedUrlCommand*)command;
- (void)onGuideFinished:(CDVInvokedUrlCommand*)command;
- (void)onLearn:(CDVInvokedUrlCommand*)command;
- (void)onPreviewFinished:(CDVInvokedUrlCommand*)command;
- (void)onRead:(CDVInvokedUrlCommand*)command;
- (void)onFreeFinished:(CDVInvokedUrlCommand*)command;
- (void)onAchievementUnlock:(CDVInvokedUrlCommand*)command;
- (void)onBrowse:(CDVInvokedUrlCommand*)command;
- (void)onTrialFinished:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent1:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent2:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent3:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent4:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent5:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent6:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent7:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent8:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent9:(CDVInvokedUrlCommand*)command;
- (void)onCustEvent10:(CDVInvokedUrlCommand*)command;

@end
