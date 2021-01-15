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
        if ("setVerboseLogDisable".equals(action)) {
            TalkingDataAppCpa.setVerboseLogDisable();
            return true;
        } else if ("getDeviceId".equals(action)) {
            String deviceId = TalkingDataAppCpa.getDeviceId(ctx);
            callbackContext.success(deviceId);
            return true;
        } else if ("getOAID".equals(action)) {
            String oaid = TalkingDataAppCpa.getOAID(ctx);
            callbackContext.success(oaid);
            return true;
        } else if ("onRegister".equals(action)) {
            String profileId = args.getString(0);
            String invitationCode = args.getString(1);
            TalkingDataAppCpa.onRegister(profileId, invitationCode);
            return true;
        } else if ("onLogin".equals(action)) {
            String profileId = args.getString(0);
            TalkingDataAppCpa.onLogin(profileId);
            return true;
        } else if (action.startsWith("onCreateCard")) {
            String profileId = args.getString(0);
            String method = args.getString(1);
            String content = args.getString(2);
            TalkingDataAppCpa.onCreateCard(profileId, method, content);
            return true;
        } else if ("onReceiveDeepLink".equals(action)) {
            String link = args.getString(0);
            TalkingDataAppCpa.onReceiveDeepLink(link);
            return true;
        } else if (action.startsWith("onFavorite")) {
            String category = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onFavorite(category, content);
            return true;
        } else if (action.startsWith("onShare")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onShare(profileId, content);
            return true;
        } else if (action.startsWith("onPunch")) {
            String profileId = args.getString(0);
            String punchId  = args.getString(1);
            TalkingDataAppCpa.onPunch(profileId, punchId);
            return true;
        } else if (action.startsWith("onSearch")) {
            String search = args.getString(0);
            TalkingDataAppCpa.onSearch(stringToSearch(search));
            return true;
        } else if (action.startsWith("onContact")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onContact(profileId, content);
            return true;
        } else if ("onPay".equals(action)) {
            String profileId = args.getString(0);
            String orderId = args.getString(1);
            int amount = args.getInt(2);
            String currencyType = args.getString(3);
            String payType = args.getString(4);
            TalkingDataAppCpa.onPay(profileId, orderId, amount, currencyType, payType);
            return true;
        } else if (action.startsWith("onChargeBack")) {
            String profileId = args.getString(0);
            String orderId = args.getString(1);
            String reason = args.getString(2);
            String type = args.getString(3);
            TalkingDataAppCpa.onChargeBack(profileId, orderId, reason, type);
            return true;
        } else if (action.startsWith("onReservation")) {
            String profileId = args.getString(0);
            String reservationId = args.getString(1);
            String category = args.getString(2);
            int amount = args.getInt(3);
            String term = args.getString(4);
            TalkingDataAppCpa.onReservation(profileId, reservationId, category, amount, term);
            return true;
        } else if (action.startsWith("onBooking")) {
            String profileId = args.getString(0);
            String bookingId = args.getString(1);
            String category = args.getString(2);
            int amount = args.getInt(3);
            String content = args.getString(4);
            TalkingDataAppCpa.onBooking(profileId, bookingId, category, amount, content);
            return true;
        } else if ("onViewItem".equals(action)) {
            String itemId = args.getString(0);
            String category = args.getString(1);
            String name = args.getString(2);
            int unitPrice = args.getInt(3);
            TalkingDataAppCpa.onViewItem(itemId, category, name, unitPrice);
            return true;
        } else if ("onAddItemToShoppingCart".equals(action)) {
            String itemId = args.getString(0);
            String category = args.getString(1);
            String name = args.getString(2);
            int unitPrice = args.getInt(3);
            int amount = args.getInt(4);
            TalkingDataAppCpa.onAddItemToShoppingCart(itemId, category, name, unitPrice, amount);
            return true;
        } else if ("onViewShoppingCart".equals(action)) {
            String shoppingCartStr = args.getString(0);
            ShoppingCart shoppingCart = this.stringToShoppingCart(shoppingCartStr);
            TalkingDataAppCpa.onViewShoppingCart(shoppingCart);
            return true;
        } else if ("onPlaceOrder".equals(action)) {
            String profileId = args.getString(0);
            String orderStr = args.getString(1);
            Order order = this.stringToOrder(orderStr);
            TalkingDataAppCpa.onPlaceOrder(profileId, order);
            return true;
        } else if ("onOrderPaySucc".equals(action)) {
            String profileId = args.getString(0);
            String orderId = args.getString(1);
            int amount = args.getInt(2);
            String currencyType = args.getString(3);
            String payType = args.getString(4);
            TalkingDataAppCpa.onOrderPaySucc(profileId, orderId, amount, currencyType, payType);
            return true;
        } else if (action.startsWith("onCredit")) {
            String profileId = args.getString(0);
            int amount = args.getInt(1);
            String content = args.getString(2);
            TalkingDataAppCpa.onCredit(profileId, amount, content);
            return true;
        } else if (action.startsWith("onTransaction")) {
            String profileId = args.getString(0);
            String transaction = args.getString(1);
            TalkingDataAppCpa.onTransaction(profileId, stringToTransaction(transaction));
            return true;
        } else if ("onCreateRole".equals(action)) {
            String roleName = args.getString(0);
            TalkingDataAppCpa.onCreateRole(roleName);
            return true;
        } else if (action.startsWith("onLevelPass")) {
            String profileId = args.getString(0);
            String levelId = args.getString(1);
            TalkingDataAppCpa.onLevelPass(profileId, levelId);
            return true;
        } else if (action.startsWith("onGuideFinished")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onGuideFinished(profileId, content);
            return true;
        } else if (action.startsWith("onLearn")) {
            String profileId = args.getString(0);
            String course = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onLearn(profileId, course, begin, duration);
            return true;
        } else if (action.startsWith("onPreviewFinished")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onPreviewFinished(profileId, content);
            return true;
        } else if (action.startsWith("onRead")) {
            String profileId = args.getString(0);
            String book = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onRead(profileId, book, begin, duration);
            return true;
        } else if (action.startsWith("onFreeFinished")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onFreeFinished(profileId, content);
            return true;
        } else if (action.startsWith("onAchievementUnlock")) {
            String profileId = args.getString(0);
            String achievementId = args.getString(1);
            TalkingDataAppCpa.onAchievementUnlock(profileId, achievementId);
            return true;
        } else if (action.startsWith("onBrowse")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            long begin = args.getLong(2);
            int duration = args.getInt(3);
            TalkingDataAppCpa.onBrowse(profileId, content, begin, duration);
            return true;
        } else if (action.startsWith("onTrialFinished")) {
            String profileId = args.getString(0);
            String content = args.getString(1);
            TalkingDataAppCpa.onTrialFinished(profileId, content);
            return true;
        } else if (action.startsWith("onCustEvent")) {
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

    private TDSearch stringToSearch(String json) {
        try {
            JSONObject searchJson = new JSONObject(json);
            TDSearch search = TDSearch.createAdSearch();
            search.setCategory(searchJson.optString("category", null));
            search.setContent(searchJson.optString("content", null));
            search.setItemId(searchJson.optString("itemId", null));
            search.setItemLocationId(searchJson.optString("itemLocationId", null));
            search.setDestination(searchJson.optString("destination", null));
            search.setOrigin(searchJson.optString("origin", null));
            if (searchJson.has("startDate")) {
                search.setStartDate(searchJson.optLong("startDate", 0));
            }
            if (searchJson.has("endDate")) {
                search.setEndDate(searchJson.optLong("endDate", 0));
            }
            return search;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
        } catch (Exception e) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private TDTransaction stringToTransaction(String json) {
        try {
            JSONObject transactionJson = new JSONObject(json);
            TDTransaction transaction = TDTransaction.createTDTransaction();
            transaction.setTransactionId(transactionJson.optString("transactionId", null));
            transaction.setCategory(transactionJson.optString("category", null));
            transaction.setAmount(transactionJson.optInt("amount", 0));
            transaction.setPersonA(transactionJson.optString("personA", null));
            transaction.setPersonB(transactionJson.optString("personB", null));
            transaction.setStartDate(transactionJson.optLong("startDate", 0));
            transaction.setEndDate(transactionJson.optLong("endDate", 0));
            transaction.setContent(transactionJson.optString("content", null));
            transaction.setCurrencyType(transactionJson.optString("currencyType", null));
            return transaction;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
