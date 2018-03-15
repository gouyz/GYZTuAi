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

class CustomGestureTableView: UITableView,UIGestureRecognizerDelegate {

    /// 返回true  ---- 能同时识别多个手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (gestureRecognizer is UIPanGestureRecognizer) && (otherGestureRecognizer is UIPanGestureRecognizer)
    }
}

class TAFriendHomeVC: GYZBaseVC {
    
    var titleArr : [String] = ["动态","关于TA"]
    
    var stateValue : [String] = ["1","2"]
    
    var childScrollView: UIScrollView?
    
    var offSetY = kTitleAndStateHeight

    override func viewDidLoad() {
        super.viewDidLoad()

        navBarBgAlpha = 0
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
        if #available(iOS 11.0, *){
            offSetY = kTitleAndStateHeight * 2
        }
        
        // 设置tableView的headView
        tableView.tableHeaderView = headerView
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in

            if #available(iOS 11.0, *) {
                make.edges.equalTo(UIEdgeInsets.init(top: -kTitleAndStateHeight, left: 0, bottom: 0, right: 0))
            }else{
                make.edges.equalTo(0)
            }
        }
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
        
        let topView = ScrollSegmentView(frame: CGRect(x: 0.0, y: 0, width: self.view.bounds.size.width, height: kTitleHeight), segmentStyle: style, titles: titleArr)
        
        topView.titleBtnOnClick = {[unowned self] (label: UILabel, index: Int) in
            self.contentView.setContentOffSet(CGPoint(x: self.contentView.bounds.size.width * CGFloat(index), y: 0), animated: false)
            
        }
        topView.backgroundColor = kWhiteColor
        
        return topView
        
    }()
    
    // 懒加载contentView
    lazy var contentView: ContentView! = {[unowned self] in
        
        let contentView = ContentView(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - kTitleHeight), childVcs: self.setChildVcs(), parentViewController: self)
        contentView.delegate = self // 必须实现代理方法
        
        return contentView
    }()
    
    lazy var tableView: CustomGestureTableView = {[unowned self] in
        let table = CustomGestureTableView(frame: CGRect.zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        return table
        
        }()
    /// header
    lazy var headerView: TAFriendsHomeHeaderView = TAFriendsHomeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: headViewHeight))
    
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let dynamicVC = TAFriendHomeDynamicVC()
        dynamicVC.delegate = self
        
        let aboutVC = TAAboutFriendVC()
        aboutVC.delegate = self
        
        return [dynamicVC,aboutVC]
    }
}

extension TAFriendHomeVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "friendHomeCellId")
        
        cell.contentView.subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        
        cell.contentView.addSubview(contentView)
        
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return scrollSegmentView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return contentView.bounds.size.height
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        
        if childScrollView?.contentOffset.y > 0 || contentOffsetY > headViewHeight - offSetY{
            tableView.contentOffset = CGPoint.init(x: 0, y: headViewHeight - offSetY)
        }
        
        let showNavBarOffsetY = kTitleAndStateHeight - topLayoutGuide.length

        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {

            var navAlpha = (contentOffsetY - showNavBarOffsetY) / 100.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            self.navigationItem.title = "朋友主页"
        }else{
            navBarBgAlpha = 0
            self.navigationItem.title = ""
        }
    }
}

// MARK:- ContentViewDelegate
extension TAFriendHomeVC: ContentViewDelegate {
    var segmentView: ScrollSegmentView {
        return scrollSegmentView
    }
    
    // 监控开始滚动contentView的时候, 这里将滚动条滚动至顶部(简书没有这个效果,但其他的有---这里拒绝广告)
    func contentViewDidBeginMove() {
        tableView.setContentOffset(CGPoint(x: 0.0, y: headViewHeight - offSetY), animated: true)
    }
}

extension TAFriendHomeVC: PageViewDelegate {
    
    // 根据子控制器的scrolView的偏移量来调整UI
    func scrollViewIsScrolling(scrollView: UIScrollView) {
        /// 记录便于处理联动
        childScrollView = scrollView
        if tableView.contentOffset.y < headViewHeight - offSetY{
            scrollView.contentOffset = CGPoint.zero
            scrollView.showsVerticalScrollIndicator = false
        }else {
            
            tableView.contentOffset.y = headViewHeight - offSetY
            scrollView.showsVerticalScrollIndicator = true
        }
    }
    
}
