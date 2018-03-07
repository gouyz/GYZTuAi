//
//  GYZConst.swift
//  flowers
//  常量及共用方法定义
//  Created by gouyz on 2016/11/4.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


// keyWindow
let KeyWindow : UIWindow = UIApplication.shared.keyWindow!

/// 屏幕的宽
let kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕的高
let kScreenHeight = UIScreen.main.bounds.size.height
/// 间距
let kMargin: CGFloat = 10.0
/// 圆角
let kCornerRadius: CGFloat = 5.0
/// 线宽
let klineWidth: CGFloat = 0.5
/// 双倍线宽
let klineDoubleWidth: CGFloat = 1.0
/// 状态栏高度
let kStateHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 标题栏高度
let kTitleHeight : CGFloat = 44.0
/// 状态栏和标题栏高度
let kTitleAndStateHeight : CGFloat = kStateHeight + kTitleHeight
/// 底部导航栏高度
let kTabBarHeight: CGFloat = kStateHeight > 20.0 ? 83.0 : 49.0
/// 底部按钮高度
let kBottomTabbarHeight : CGFloat = 49.0

/// 按钮高度
let kUIButtonHeight : Float = 44.0

////sheetView 常量定义
///分割线高度
let kLineHeight : CGFloat = 0.5
/// 间距
let kSheetMargin: CGFloat = 6.0
/// sheetView cell高度
let kCellH : CGFloat = 45
/// sheetView 最大高度
let kSheetViewMaxH : CGFloat = kScreenHeight * 0.7
/// sheetView 宽度
let kSheetViewWidth  = kScreenWidth - kSheetMargin * 2
/// 消失动画时间
let kDismissTime = 0.3
/// 显示动画时间
let kPushTime = 0.3

/// alertViewController 取消的回调返回的索引
let cancelIndex = -1

/////3列，列间隔为10，距离屏幕边距左右各10
let kPhotosImgHeight: CGFloat = (kScreenWidth - 40)/3.0
/////3列，列间隔为10，距离屏幕边距右10,左50
let kPhotosImgHeight4Processing: CGFloat = (kScreenWidth - 80)/3.0
/// 最大上传图片张数
let kMaxSelectCount = 3

/// 记录版本号的key
let LHSBundleShortVersionString = "LHSBundleShortVersionString"
/// 是否登录标识
let kIsLoginTagKey = "loginTag"

/// 保存异常信息标识
let ERROR_MESSAGE = "ERROR_MESSAGE"


//APPID，应用提交时候替换
let APPID = "1262684394"
/// 极光推送AppKey
let kJPushAppKey = "62f70fe9bed6d366b2c740a8"

// 经度
let kDefaultLon = 119.967775
// 纬度
let kDefaultLat = 31.781376

/// 数据返回的分页数量
let kPageSize = 10
/// 网络数据请求成功标识
let kQuestSuccessTag = 1

/// 字体常量
let k10Font = UIFont.systemFont(ofSize: 10.0)
let k12Font = UIFont.systemFont(ofSize: 12.0)
let k13Font = UIFont.systemFont(ofSize: 13.0)
let k14Font = UIFont.systemFont(ofSize: 14.0)
let k15Font = UIFont.systemFont(ofSize: 15.0)
let k18Font = UIFont.systemFont(ofSize: 18.0)
let k20Font = UIFont.systemFont(ofSize: 20.0)

let userDefaults = UserDefaults.standard

///颜色常量

/// 通用背景颜色
let kBackgroundColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xf2f2f2)
/// 导航栏背景颜色
let kNavBarColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x679df5)
/// 黑色字体颜色
let kBlackFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x333333)
/// 深灰色字体颜色
let kHeightGaryFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x666666)
/// 灰色字体颜色
let kGaryFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x999999)
/// 黄色字体颜色
let kYellowFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xfda007)
/// 蓝色字体颜色
let kBlueFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x679df5)
/// 浅灰色字体颜色
let kLightGaryFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xdcdcdc)
/// 红色字体颜色
let kRedFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xf53333)
/// 绿色字体颜色
let kGreenFontColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x2dae99)
/// 灰色线的颜色
let kGrayLineColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xdcdcdc)
/// btn不可点击背景色
let kBtnNoClickBGColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xd8d8d8)
/// btn可点击背景色
let kBtnClickBGColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x679df5)
/// btn可点击浅绿色背景色
let kBtnClickLightGreenColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0x36dbc0)
/// 系统白色
let kWhiteColor : UIColor = UIColor.white
/// 系统黑色
let kBlackColor : UIColor = UIColor.black

/// 网络监听
let networkManager = NetworkReachabilityManager.init(host: "www.apple.com")

/// 根据版本号来确定是否进入新特性界面
///
/// - returns: true/false
func newFeature() -> Bool {
    
    /// 获取当前版本号
    let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    let oldVersion = userDefaults.object(forKey: LHSBundleShortVersionString) ?? ""
    
    if currentVersion.compare(oldVersion as! String) == .orderedDescending{
        
        userDefaults.set(currentVersion, forKey: LHSBundleShortVersionString)
        return true
    }
    return false
}

/****** 自定义Log ******/
func GYZLog<T>(_ message: T, fileName: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        let filename = (fileName as NSString).pathComponents.last
        print("\(filename!)\(function)[\(lineNumber)]: \(message)")
    #endif
}
