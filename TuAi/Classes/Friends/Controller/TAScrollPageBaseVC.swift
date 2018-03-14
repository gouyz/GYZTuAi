//
//  TAScrollPageBaseVC.swift
//  TuAi
//
//  Created by gouyz on 2018/3/14.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAScrollPageBaseVC: GYZBaseVC,UIScrollViewDelegate {

    // 代理
    weak var delegate: PageViewDelegate?
    
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(leaveFromTop), name: NSNotification.Name(rawValue: kLeaveFromTopNotification), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @objc func leaveFromTop(){
//        scrollView?.contentOffset = CGPoint.zero
//    }
    ///MARK:- UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.scrollView = scrollView
        delegate?.scrollViewIsScrolling(scrollView: scrollView)
    }
    
    //MARK: Dealloc
    deinit{
        ///移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
}
protocol PageViewDelegate: NSObjectProtocol {
    func scrollViewIsScrolling(scrollView: UIScrollView)
//    func setupTableViewOffSetYWhenViewWillAppear(scrollView: UIScrollView)
}
