//
//  GYZTool.swift
//  LazyHuiSellers
//  通用功能
//  Created by gouyz on 2016/12/15.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import UIKit
import AudioToolbox
import MJRefresh
import SKPhotoBrowser

///小于运算符
func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool
{
    switch (lhs, rhs)
    {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}
///等于运算符
func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool
{
    switch (lhs, rhs)
    {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class GYZTool: NSObject {

    
    ///1.单例
    static let shareTool = GYZTool()
    private override init() {}

    
    /// 播放声音
    ///这个只能播放不超过30秒的声音，它支持的文件格式有限，具体的说只有CAF、AIF和使用PCM或IMA/ADPCM数据的WAV文件
    /// - Parameter sound: 声音文件名称
    class func playAlertSound(sound:String)
    {
        //声音地址
        guard let soundPath = Bundle.main.path(forResource: sound, ofType: nil)  else { return }
        guard let soundUrl = NSURL(string: soundPath) else { return }
        //建立的systemSoundID对象
        var soundID:SystemSoundID = 0
        //赋值
        AudioServicesCreateSystemSoundID(soundUrl, &soundID)
        //播放声音
        AudioServicesPlaySystemSound(soundID)
    }
    
    ///MARK -添加上拉/下拉刷新
    
    /// 添加下拉刷新
    ///
    /// - Parameters:
    ///   - scorllView: 添加下拉刷新的视图
    ///   - pullRefreshCallBack: 刷新回调
    class func addPullRefresh(scorllView : UIScrollView?,pullRefreshCallBack : MJRefreshComponentRefreshingBlock?){
        
        if scorllView == nil || pullRefreshCallBack == nil {
            return
        }
//        weak var weakScrollView = scorllView
        let refreshHeader : MJRefreshNormalHeader = MJRefreshNormalHeader.init {
            
            pullRefreshCallBack!()
            
//            if weakScrollView?.mj_footer.isHidden == false {
//                weakScrollView?.mj_footer.resetNoMoreData()
//            }
        }
        
        scorllView?.mj_header = refreshHeader
    }
    /// 添加上拉刷新
    ///
    /// - Parameters:
    ///   - scorllView: 添加上拉刷新的视图
    ///   - loadMoreCallBack: 刷新回调
    class func addLoadMore(scorllView : UIScrollView?,loadMoreCallBack : MJRefreshComponentRefreshingBlock?){
        if scorllView == nil || loadMoreCallBack == nil {
            return
        }
        
        let loadMoreFooter = MJRefreshAutoNormalFooter.init {
            loadMoreCallBack!()
        }
        //空数据时，设置文字为空
        loadMoreFooter?.setTitle("", for: .idle)
        loadMoreFooter?.setTitle("正在为您加载数据", for: .refreshing)
        loadMoreFooter?.setTitle("没有更多了~", for: .noMoreData)
//        loadMoreFooter?.isAutomaticallyRefresh = false
        scorllView?.mj_footer = loadMoreFooter
    }
    /// 停止下拉刷新
    class func endRefresh(scorllView : UIScrollView?){
        scorllView?.mj_header.endRefreshing()
    }
    
    /// 停止上拉加载
    class func endLoadMore(scorllView : UIScrollView?){
        scorllView?.mj_footer.endRefreshing()
    }
    
    /// 提示没有更多数据的情况
    class func noMoreData(scorllView : UIScrollView?){
        scorllView?.mj_footer.endRefreshingWithNoMoreData()
    }
    /// 重置没有更多数据的情况
    class func resetNoMoreData(scorllView : UIScrollView?){
        scorllView?.mj_footer.resetNoMoreData()
    }
    
    /// 拨打电话
    ///
    /// - Parameter phone: 电话号码
    class func callPhone(phone: String){
        //自动打开拨号页面并自动拨打电话UIApplication.shared.openURL(URL(string: "tel://10086")!)
        //有提示
        UIApplication.shared.openURL(URL(string: "telprompt://"+phone)!)
    }
    
    /// 退出登录时，移除用户信息
    class func removeUserInfo(){
        userDefaults.removeObject(forKey: kIsLoginTagKey)
        userDefaults.removeObject(forKey: "userId")
        userDefaults.removeObject(forKey: "phone")
        userDefaults.removeObject(forKey: "ppaName")
        userDefaults.removeObject(forKey: "ppaPost")
        userDefaults.removeObject(forKey: "wrId")
        userDefaults.removeObject(forKey: "isManager")
        userDefaults.removeObject(forKey: "headImg")
        userDefaults.removeObject(forKey: "serviceArea")
        
//        userDefaults.removeObject(forKey: COMMUNITY_SELECTED_BS)
    }
    
    /// 字典转json字符串
    ///
    /// - Parameter dict: 字典
    /// - Returns: 字符串
    class func convertDictionaryToString(dict: [String:Any]) -> String{
        var result:String = ""
        do {
            //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding:.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
    
    /// 封装查看图片大图的URL
    ///
    class func createWebPhotos(urls: [String]?) -> [SKPhotoProtocol] {
        return (0..<(urls?.count)!).map { (i: Int) -> SKPhotoProtocol in
            
            let photo = SKPhoto.photoWithImageURL((urls?[i].getOriginImgUrl())!)
            //            SKPhotoBrowserOptions.displayToolbar = false
            ///隐藏分享按钮
            SKPhotoBrowserOptions.displayAction = false
            //            photo.shouldCachePhotoURLImage = true
            return photo
        }
    }
    
    //MARK: 计算天数差 
    static func dateDifference(_ endDate:Date, from startDate:Date) -> Double {
        let interval = endDate.timeIntervalSince(startDate)
        return interval/86400  //24*60*60
        
    }
    /// 得到当前时间之前和之后N天的日期
    ///
    /// - Parameters:
    ///   - currDate: 当前日期
    ///   - dayNum: 当前时间之前和之后N天，之前的传负数，之后传正数
    /// - Returns: 日期
    static func getBehindDay(currDate: Date,dayNum: Int) -> Date?{
        
        var date  = currDate
        if dayNum != 0 {
            let oneDay = TimeInterval(86400*dayNum)
            date = currDate.addingTimeInterval(oneDay)
        }
        
        return date
    }
    /*
     * 根据日期格式字符串返回日期代表星期几
     * 参数：date  日期
     * 返回值：日期代表星期几，Int类型，星期一到星期日分别表示为：1～7
     */
    static func getWeekDay(date: Date ) -> Int{
        
        let interval = Int(date.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
        
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        ///星期一到星期日分别表示为：1～7
//        return weekday == 0 ? 7 : weekday
        /// 周日到周六分别表示为：0～6
        return weekday
    }
}
