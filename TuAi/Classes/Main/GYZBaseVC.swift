//
//  GYZBaseVC.swift
//  flowers
//  基控制器
//  Created by gouyz on 2016/11/7.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import UIKit
import MBProgressHUD

class GYZBaseVC: UIViewController {
    
    var hud : MBProgressHUD?
    var statusBarShouldLight = true
    
    /// 是否是白色返回键
    var isWhiteBack = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = kBackgroundColor
        
        if navigationController?.childViewControllers.count > 1 {
            
            // 添加返回按钮
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: (isWhiteBack ? "icon_back_white" : "icon_back_black")), style: .done, target: self, action: #selector(clickedBackBtn))
        }
        
    }
    /// 重载设置状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if statusBarShouldLight {
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: kWhiteColor, NSAttributedStringKey.font: k18Font]
            
            navigationController?.navigationBar.barTintColor = kNavBarColor
            navigationController?.navigationBar.tintColor = kWhiteColor
            
            return .lightContent
        } else {
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: kBlackColor, NSAttributedStringKey.font: k18Font]
            
            navigationController?.navigationBar.barTintColor = kWhiteColor
            navigationController?.navigationBar.tintColor = kBlackColor
            
            return .default
        }
    }
    
    /// 设置状态栏样式为default,设置导航栏透明
    func setStatusBarStyle(){
        
//        navBarBgAlpha = 0
        navBarTintColor = kBlackColor
        statusBarShouldLight = false
        setNeedsStatusBarAppearanceUpdate()
    }
    /// 返回
    @objc func clickedBackBtn() {
        _ = navigationController?.popViewController(animated: true)
    }
    /// 创建HUD
    func createHUD(message: String){
        if hud == nil {
            hud = MBProgressHUD.showHUD(message: message,toView: view)
        }else{
            hud?.show(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
