//
//  TASearchHomeVC.swift
//  TuAi
//  首页搜索
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

class TASearchHomeVC: GYZBaseVC,UISearchBarDelegate {
    
    var titleArr : [String] = ["机构","文章","视频"]
    
    var stateValue : [String] = ["1","2","3"]
    var scrollPageView: ScrollPageView?
    
    var searchContent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setScrollView()
        searchBar.text = searchContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        
        navigationItem.titleView = searchBar
        
        let btn = UIButton(type: .custom)
        btn.setTitle("取消", for: .normal)
        btn.titleLabel?.font = k14Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.frame = CGRect.init(x: 0, y: 0, width: kTitleHeight, height: kTitleHeight)
        btn.addTarget(self, action: #selector(cancleSearchClick), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    
    /// 搜索框
    lazy var searchBar : UISearchBar = {
        let search = UISearchBar()
        
        search.backgroundImage = UIImage.init(named: "icon_search_clearbg")
        search.placeholder = "输入您要搜索的内容"
        search.delegate = self
        //显示输入光标
        search.tintColor = kNavBarColor
        //弹出键盘
//        search.becomeFirstResponder()
        
        return search
    }()
    
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let jiGouVC = TASearchJiGouVC()
        
        let articleVC = TASearchArticlesVC()
        
        let videoVC = TASearchVideoVC()
        
        return [jiGouVC,articleVC,videoVC]
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
    
    /// 取消搜索
    @objc func cancleSearchClick(){
        searchBar.resignFirstResponder()
        
        clickedBackBtn()
    }
    
    ///mark - UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        searchContent = searchBar.text!
        if searchContent.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入搜索内容")
            return
        }
    }
}
