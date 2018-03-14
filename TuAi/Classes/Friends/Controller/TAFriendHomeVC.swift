//
//  TAFriendHomeVC.swift
//  TuAi
//  朋友主页
//  Created by gouyz on 2018/3/14.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

let headViewHeight: CGFloat  = 300.0
let defaultOffSetY: CGFloat = headViewHeight + kTitleHeight

class TAFriendHomeVC: GYZBaseVC {
    
    var titleArr : [String] = ["动态","关于TA"]
    
    var stateValue : [String] = ["1","2"]
    /// 用来记录子控制器的tableView的滚动的offsetY
    var offSetY: CGFloat = -defaultOffSetY

    override func viewDidLoad() {
        super.viewDidLoad()

        navBarBgAlpha = 0
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(contentView)
        view.addSubview(headerView)
        view.addSubview(scrollSegmentView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 懒加载 scrollSegmentView
    lazy var scrollSegmentView: ScrollSegmentView = {
        
        var style = SegmentStyle()
        
        // 滚动条
        style.showLine = true
        style.scrollTitle = false
        // 颜色渐变
        style.gradualChangeTitleColor = true
        // 滚动条颜色
        style.scrollLineColor = kBlueFontColor
        style.normalTitleColor = kBlackFontColor
        style.selectedTitleColor = kBlueFontColor
        /// 显示角标
        style.showBadge = false
        
        let topView = ScrollSegmentView(frame: CGRect(x: 0.0, y: headerView.bottomY, width: self.view.bounds.size.width, height: kTitleHeight), segmentStyle: style, titles: titleArr)
        
        topView.titleBtnOnClick = {[unowned self] (label: UILabel, index: Int) in
            self.contentView.setContentOffSet(CGPoint(x: self.contentView.bounds.size.width * CGFloat(index), y: 0), animated: false)
            
        }
        topView.backgroundColor = kWhiteColor
        
        return topView
        
    }()
    
    // 懒加载contentView
    lazy var contentView: ContentView! = {[unowned self] in
        
        let contentView = ContentView(frame: self.view.bounds, childVcs: self.setChildVcs(), parentViewController: self)
        contentView.delegate = self // 必须实现代理方法
        
        return contentView
    }()
    /// header
    lazy var headerView: TAFriendsHomeHeaderView = TAFriendsHomeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: headViewHeight))
    
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let dynamicVC = TAFriendHomeDynamicVC()
        dynamicVC.delegate = self
        
        let aboutVC = TAFriendHomeDynamicVC()
        aboutVC.delegate = self
        
        return [dynamicVC,aboutVC]
    }
}

// MARK:- ContentViewDelegate
extension TAFriendHomeVC: ContentViewDelegate {
    var segmentView: ScrollSegmentView {
        return scrollSegmentView
    }
}

extension TAFriendHomeVC: PageViewDelegate {
    
    // 设置将要显示的tableview的contentOffset.y
    func setupTableViewOffSetYWhenViewWillAppear(scrollView: UIScrollView) {
        // 当子控制器的tableview向上滚动很多的时候, 重新设置offY
        if offSetY > -kTitleHeight {
            offSetY = -kTitleHeight
            
        }
        print("\\\\\\\\(offSetY)--------------")
        scrollView.contentOffset.y = offSetY
        
    }
    // 根据子控制器的scrolView的偏移量来调整UI
    func scrollViewIsScrolling(scrollView: UIScrollView) {
        let deltaY = scrollView.contentOffset.y - offSetY
        offSetY = scrollView.contentOffset.y
        
        let showNavBarOffsetY = kStateHeight - topLayoutGuide.length
        
        
        //navigationBar alpha
        if offSetY > showNavBarOffsetY  {
            
            var navAlpha = (offSetY - showNavBarOffsetY) / 100.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            self.navigationItem.title = "朋友主页"
        }else{
            navBarBgAlpha = 0
            self.navigationItem.title = ""
        }
        
        // print(offSetY)
        if offSetY > -(defaultOffSetY - headViewHeight) {
            // 使滑块停在navigationBar下面
            headerView.frame.origin.y = kTitleAndStateHeight - headViewHeight
            scrollSegmentView.frame.origin.y = kTitleAndStateHeight
            return
            
        } else if offSetY < -defaultOffSetY {
            // 使headView停在navigationBar下面
            headerView.frame.origin.y = 0
            scrollSegmentView.frame.origin.y = headViewHeight
            return
            
        }
        
        if offSetY < headViewHeight {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kLeaveFromTopNotification), object: nil,userInfo:nil)
        }
        // 这里是让滑块和headView随着上下滚动
        headerView.frame.origin.y -= deltaY
        scrollSegmentView.frame.origin.y -= deltaY
        
    }
    
}
