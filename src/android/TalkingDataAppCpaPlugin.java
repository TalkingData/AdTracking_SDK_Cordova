package com.talkingdata.adtracking;

import android.content.Context;
import android.text.TextUtils;
import com.tendcloud.appcpa.TDSearch;

import com.tendcloud.appcpa.Order;
import com.tendcloud.appcpa.ShoppingCart;
import com.tendcloud.appcpa.TDTransaction;
import com.tendcloud.appcpa.TalkingDataAppCpa;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


public class TalkingDataAppCpaPlugin extends CordovaPlugin {
    private Context ctx;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        this.ctx = cordova.getActivity().getApplicationContext();
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("init".equals(action)) {
            // 初始化 TalkingData AdTracking SDK
            String appId = args.getString(0);
            String channelId = args.getString(1);
            TalkingDataAppCpa.init(ctx, appId, channelId);
            return true;
        } else if ("setVerboseLogDisable".equals(action)) {
            // 关闭在LogCat中打印运行日志
            TalkingDataAppCpa.setVerboseLogDisable();
            return true;
        } else if ("getDeviceId".equals(action)) {
            // 获取 TalkingData Device Id，并将其作为参数传入 JS 的回调函数
            String deviceId = TalkingDataAppCpa.getDeviceId(ctx);
            callbackContext.success(deviceId);
            return true;
        } else if ("onReceiveDeepLink".equals(action)) {
            // DeepLink事件
            String link = args.getString(0);
            TalkingDataAppCpa.onReceiveDeepLink(link);
            return true;
        } else if ("onRegister".equals(action)) {
            // 注册事件
            String accountId = args.getString(0);
            if(args.length() == 1) {
                TalkingDataAppCpa.onRegister(accountId);
            }else if(args.length() == 2) {
                String invitationCode = args.getString(1);
                TalkingDataAppCpa.onRegister(accountId, invitationCode);
            }
            return true;
        } else if ("onLogin".equals(action)) {
            // 登录事件
            String accountId = args.getString(0);
            TalkingDataAppCpa.onLogin(accountId);
            return true;
        } else if ("onCreateRole".equals(action)) {
            // 创建角色
            String roleName = args.getString(0);
            TalkingDataAppCpa.onCreateRole(roleName);
            return true;
        } else if ("onPay".equals(action)) {
            // 支付
            String accountId = args.getString(0);
            String orderId = args.getString(1);
            int amount = args.getInt(2);
            String currencyType = args.getString(3);
            String payType = args.getString(4);
            TalkingDataAppCpa.onPay(accountId, orderId, amount, currencyType, payType);
        } else if ("onPlaceOrder".equals(action)) {
            // 下单
            String accountId = args.getString(0);
            String orderStr = args.getString(1);
            Order order = this.stringToOrder(orderStr);
            TalkingDataAppCpa.onPlaceOrder(accountId, order);
            return true;
        } else if ("onOrderPaySucc".equals(action)) {
            // 支付订单
            String accountId = args.getString(0);
            String orderId = args.getString(1);
            int amount = args.getInt(2);
            String currencyType = args.getString(3);
            String payType = args.getString(4);
            TalkingDataAppCpa.onOrderPaySucc(accountId, orderId, amount, currencyType, payType);
            return true;
        } else if ("onViewItem".equals(action)) {
            // 查看商品
            String itemId = args.getString(0);
            String category = args.getString(1);
            String name = args.getString(2);
            int unitPrice = args.getInt(3);
            TalkingDataAppCpa.onViewItem(itemId, category, name, unitPrice);
            return true;
        } else if ("onAddItemToShoppingCart".equals(action)) {
            // 添加商品到购物车
            String itemId = args.getString(0);
            String category = args.getString(1);
            String name = args.getString(2);
            int unitPrice = args.getInt(3);
            int amount = args.getInt(4);
            TalkingDataAppCpa.onAddItemToShoppingCart(itemId, category, name, unitPrice, amount);
            return true;
        } else if ("onViewShoppingCart".equals(action)) {
            // 查看购物车
            String shoppingCartStr = args.getString(0);
            ShoppingCart shoppingCart = this.stringToShoppingCart(shoppingCartStr);
            TalkingDataAppCpa.onViewShoppingCart(shoppingCart);
            return true;
        } else if (action.startsWith("onCustEvent")) {
            // 触发自定义事件
            try {
                Method onCustEvent = TalkingDataAppCpa.class.getDeclaredMethod(action);
                onCustEvent.invoke(null);
                return true;
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        } else if (action.startsWith("onCreateCard")){
            String accountId = args.getString(0);
            String method = args.getString(1);
            String content = args.getString(2);
            TalkingDataAppCpa.onCreateCard(accountId, method, content);
            return true;
        } else if (action.startsWith("onSearch")) {
            String search = args.getString(0);
            TalkingDataAppCpa.onSearch(getSearch(search));
            return true;
        } else if (action.startsWith("onTransaction")) {
            String accountId = args.getString(0);
            String transaction = args.getString(1);
            TalkingDataAppCpa.onTransaction(accountId, stringToTransaction(transaction));
            return true;
        } else if (action.startsWith("onCredit")) {
            String accountId = args.getString(0);
            int amount = args.getInt(1);
            String content = args.getString(2);
            TalkingDataAppCpa.onCredit(accountId, amount, content);
            return true;
        } else if (action.startsWith("onFavorite")) {
            String category = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onFavorite(category, content);
            return true;
        } else if (action.startsWith("onShare")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onShare(accountId, content);
            return true;
        } else if (action.startsWith("onPunch")) {
            String accountId = args.getString(0);
            String punchId  = args.getString(1);
            TalkingDataAppCpa.onPunch(accountId, punchId);
            return true;
        } else if (action.startsWith("onReservation")) {
            String accountId = args.getString(0);
            String reservationId = args.getString(1);
            String category = args.getString(2);
            int amount = args.getInt(3);
            String term = args.getString(4);
            TalkingDataAppCpa.onReservation(accountId, reservationId, category, amount, term);
            return true;
        } else if (action.startsWith("onBooking")) {
            String accountId = args.getString(0);
            String bookingId = args.getString(1);
            String category = args.getString(2);
            int amount = args.getInt(3);
            String content = args.getString(4);
            TalkingDataAppCpa.onBooking(accountId, bookingId, category, amount, content);
            return true;
        } else if (action.startsWith("onContact")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onContact(accountId, content);
            return true;
        } else if (action.startsWith("onLearn")) {
            String accountId = args.getString(0);
            String course = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onLearn(accountId, course, begin, duration);
            return true;
        } else if (action.startsWith("onRead")) {
            String accountId = args.getString(0);
            String book = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onRead(accountId, book, begin, duration);
            return true;
        } else if (action.startsWith("onBrowse")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onBrowse(accountId, content, begin, duration);
            return true;
        } else if (action.startsWith("onChargeBack")) {
            String accountId = args.getString(0);
            String orderId = args.getString(1);
            String reason = args.getString(2);
            String type = args.getString(3);
            TalkingDataAppCpa.onChargeBack(accountId, orderId, reason, type);
            return true;
        } else if (action.startsWith("onTrialFinished")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onTrialFinished(accountId, content);
            return true;
        } else if (action.startsWith("onGuideFinished")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onGuideFinished(accountId, content);
            return true;
        }else if (action.startsWith("onPreviewFinished")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onPreviewFinished(accountId, content);
            return true;
        }else if (action.startsWith("onFreeFinished")) {
            String accountId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onFreeFinished(accountId, content);
            return true;
        }else if (action.startsWith("onLevelPass")) {
            String accountId = args.getString(0);
            String levelId = args.getString(1);
            TalkingDataAppCpa.onLevelPass(accountId, levelId);
            return true;
        }else if (action.startsWith("onAchievementUnlock")) {
            String accountId = args.getString(0);
            String achievementId = args.getString(1);
            TalkingDataAppCpa.onAchievementUnlock(accountId, achievementId);
            return true;
        }
        return false;
    }

    private Order stringToOrder(String orderStr) {
        try {
            JSONObject orderJson = new JSONObject(orderStr);
            Order order = Order.createOrder(orderJson.getString("orderId"), orderJson.getInt("total"), orderJson.getString("currencyType"));
            JSONArray items = orderJson.getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                order.addItem(item.getString("itemId"), item.getString("category"), item.getString("name"), item.getInt("unitPrice"), item.getInt("amount"));
            }
            return order;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    private ShoppingCart stringToShoppingCart(String shoppingCartStr) {
        try {
            JSONObject shoppingCartJson = new JSONObject(shoppingCartStr);
            ShoppingCart shoppingCart = ShoppingCart.createShoppingCart();
            JSONArray items = shoppingCartJson.getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                shoppingCart.addItem(item.getString("itemId"), item.getString("category"), item.getString("name"), item.getInt("unitPrice"), item.getInt("amount"));
            }
            return shoppingCart;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    private TDTransaction stringToTransaction(String json) {
        TDTransaction tdTransaction = TDTransaction.createTDTransaction();
        if (TextUtils.isEmpty(json)) {
            return tdTransaction;
        }
        try {
            JSONObject jsonObject = new JSONObject(json);
            tdTransaction.setTransactionId(jsonObject.optString("transactionId", null))
                    .setCategory(jsonObject.optString("category", null))
                    .setAmount(jsonObject.optInt("amount", 0))
                    .setPersonA(jsonObject.optString("personA", null))
                    .setPersonB(jsonObject.optString("personB", null))
                    .setStartDate(jsonObject.optLong("startDate", 0))
                    .setEndDate(jsonObject.optLong("endDate", 0))
                    .setContent(jsonObject.optString("content", null))
                    .setCurrencyType(jsonObject.optString("currencyType", null));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return tdTransaction;
    }

    private TDSearch getSearch(String json){
        TDSearch tdSearch = TDSearch.createAdSearch();
        try{
            JSONObject jsonObject = new JSONObject(json);
            tdSearch.setCategory(jsonObject.optString("category", null));
            tdSearch.setContent(jsonObject.optString("content", null));
            tdSearch.setItemId(jsonObject.optString("itemId", null));
            tdSearch.setItemLocationId(jsonObject.optString("itemLocationId", null));
            tdSearch.setDestination(jsonObject.optString("destination", null));
            tdSearch.setOrigin(jsonObject.optString("origin", null));
            if (jsonObject.has("startDate")){
                tdSearch.setStartDate(jsonObject.optLong("startDate", 0));
            }
            if (jsonObject.has("endDate")){
                tdSearch.setEndDate(jsonObject.optLong("endDate", 0));
            }
        }catch (Throwable t){
            t.printStackTrace();
        }
        return tdSearch;
    }
}
