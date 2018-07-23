package com.talkingdata.adtracking;

import android.content.Context;

import com.tendcloud.appcpa.Order;
import com.tendcloud.appcpa.ShoppingCart;
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
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


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
            TalkingDataAppCpa.onRegister(accountId);
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
        }
        return false;
    }
    
    private Order stringToOrder(String orderStr) {
        try {
            JSONObject orderJson = new JSONObject(orderStr);
            Order order = Order.createOrder(orderJson.getString("orderId"), orderJson.getInt("total"), orderJson.getString("currencyType"));
            JSONArray items = orderJson.getJSONArray("items");
            for (int i=0; i<items.length(); i++) {
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
            for (int i=0; i<items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                shoppingCart.addItem(item.getString("itemId"), item.getString("category"), item.getString("name"), item.getInt("unitPrice"), item.getInt("amount"));
            }
            return shoppingCart;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }
}
