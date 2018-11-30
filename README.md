# TalkingData AD Tracking Cordova/PhoneGap SDK
AD Tracking Cordova 平台 SDK 由`封装层`和`Native SDK`两部分构成，目前GitHub上提供了封装层代码，需要从 [TalkingData官网](https://www.talkingdata.com/spa/sdk/#/config) 下载最新版的 Android 和 iOS 平台 Native SDK，组合使用。
## 集成说明
1. 下载本项目（封装层）到本地；  
2. 访问 [TalkingData官网](https://www.talkingdata.com/spa/sdk/#/config) 下载最新版的 Android 和 iOS 平台AD Tracking SDK（ Native SDK）
	- 方法1：选择 PhoneGap 平台进行功能定制；
	- 方法2：分别选择 Android 和 iOS 平台进行功能定制，请确保两个平台功能项一致；
3. 将下载的最新版 `Native SDK` 复制到`封装层`中，构成完整的 Cordova SDK。  
	- Android 平台  
	将最新的 .jar 文件复制到 `src/android` 目录下
	- iOS 平台  
	将最新的 .a 文件复制到 `src/ios` 目录下
4. 将 Cordova SDK 集成您需要统计的工程中，并按 [集成文档](http://doc.talkingdata.com/posts/860) 进行必要配置和功能调用。
