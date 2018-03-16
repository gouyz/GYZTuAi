//
//  TAHomeVC.swift
//  TuAi
//  首页
//  Created by gouyz on 2018/2/26.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import PYSearch

class TAHomeVC: GYZBaseVC {

    var titleArr : [String] = ["精华","视频","论坛"]
    
    var stateValue : [String] = ["1","2","3"]
    var scrollPageView: ScrollPageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.delegate = self
        view.addSubview(homeTopView)
        homeTopView.addSubview(navigationBarView)
        
        homeTopView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(view)
            make.height.equalTo(kTitleAndStateHeight)
        }
        
        navigationBarView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(homeTopView)
            make.height.equalTo(kTitleHeight)
        }
        
        setScrollView()
        
        navigationBarView.commentImgView.addOnClickListener(target: self, action: #selector(clickedMessage))
        navigationBarView.searchBtn.addTarget(self, action: #selector(clickedSearch), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 私信
    @objc func clickedMessage(){
        let chartVC = TAChartVC()
        self.navigationController?.pushViewController(chartVC, animated: true)
    }
    /// 搜索
    @objc func clickedSearch(){
        
        let searchVC: PYSearchViewController = PYSearchViewController.init(hotSearches: ["家长对幼儿教育的误区","幼儿教育与习惯养成","艺术在幼儿教育的重要性","幼儿教育综合知识"], searchBarPlaceholder: "输入您要搜索的内容") { (searchViewController, searchBar, searchText) in
            
        }
        searchVC.hotSearchStyle = .borderTag
        searchVC.searchHistoryStyle = .borderTag
        searchVC.searchSuggestionHidden = true
        
        let searchNav = GYZBaseNavigationVC(rootViewController:searchVC)
        searchNav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: kBlackColor, NSAttributedStringKey.font: k18Font]
        
        searchNav.navigationBar.barTintColor = kWhiteColor
        searchNav.navigationBar.tintColor = kBlackColor
        self.present(searchNav, animated: true, completion: nil)
    }
    
    /// topView
    lazy var homeTopView: UIView = {
        let topView = UIView()
        topView.backgroundColor = kNavBarColor
        
        return topView
        
    }()
    /// 自定义导航栏
    private lazy var navigationBarView = TAHomeNavigationView()
    
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let jingHuaVC = TAHomeJingHuaVC()
        
        let videoVC = TAHomeVideoVC()
        
        let commentVC = TAHomeCommentVC()
        
        return [jingHuaVC,videoVC,commentVC]
    }
    
    /// 设置scrollView
    func setScrollView(){
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
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
        
        
        scrollPageView = ScrollPageView.init(frame: CGRect.init(x: 0, y: kTitleAndStateHeight, width: kScreenWidth, height: kScreenHeight - kTitleAndStateHeight), segmentStyle: style, titles: titleArr, childVcs: setChildVcs(), parentViewController: self)
        view.addSubview(scrollPageView!)
    }
}

/// mark - UINavigationControllerDelegate
extension TAHomeVC : UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        /// 首页隐藏导航栏
        let isShow = viewController.isKind(of: TAHomeVC.self)
        self.navigationController?.setNavigationBarHidden(isShow, animated: true)
    }
}
