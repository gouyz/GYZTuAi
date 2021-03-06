//
//  GYZBaseNavigationVC.swift
//  flowers
//  导航控制器
//  Created by gouyz on 2016/11/5.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import UIKit

class GYZBaseNavigationVC: UINavigationController ,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.tintColor = UIColor.white
        navBar.barTintColor = kNavBarColor
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: k18Font]
        
        ///去除Bar的模糊效果，默认为true
//        if #available(iOS 11.0, *) {
//            navBar.isTranslucent = true
//        }else{
//            navBar.isTranslucent = false
//        }
        // 右滑返回代理
        self.interactivePopGestureRecognizer?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            // push的时候, 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: 代理：UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1
    }
}
