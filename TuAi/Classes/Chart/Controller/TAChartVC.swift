//
//  TAChartVC.swift
//  TuAi
//  私信
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAChartVC: GYZBaseVC,ContentViewDelegate {
    var titleArr : [String] = ["通知","私信"]
    
    var stateValue : [String] = ["1","2"]
    var scrollPageView: ScrollSegmentView?
    var contentView: ContentView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScrollView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let notificationVC = TAChartNotificationVC()
        
        let messageVC = TAChartMessageVC()
        
        return [notificationVC,messageVC]
    }
    
    /// 设置scrollView
    func setScrollView(){
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
        var style = SegmentStyle()
        // 是否显示遮盖
        style.showCover = true
        style.scrollTitle = false
        // 颜色渐变
        style.gradualChangeTitleColor = true
        // 遮盖颜色
        style.coverBackgroundColor = kWhiteColor
        // title选中状态颜色 使用RGB空间值
        style.selectedTitleColor = UIColor.RGBColor(103.0, g: 157.0, b: 245.0)
        // title正常状态颜色 使用RGB空间值
        style.normalTitleColor = UIColor.RGBColor(255.0, g: 255.0, b: 255.0)
        /// 显示角标
        style.showBadge = false
        
        scrollPageView = ScrollSegmentView.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 28), segmentStyle: style, titles: titleArr)
        navigationItem.titleView = scrollPageView
        
        contentView = ContentView.init(frame: self.view.bounds, childVcs: setChildVcs(), parentViewController: self)
        contentView?.delegate = self // 必须实现代理方法
        
        scrollPageView?.titleBtnOnClick = {[unowned self] (label: UILabel, index: Int) in
            self.contentView?.setContentOffSet(CGPoint(x: (self.contentView?.bounds.size.width)! * CGFloat(index), y: 0), animated: false)
            
        }
        
        view.addSubview(contentView!)
    }
    
    /// MARK: ContentViewDelegate
    var segmentView: ScrollSegmentView{
        return scrollPageView!
    }
}
