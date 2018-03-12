//
//  GYZMainTabBarVC.swift
//  baking
//
//  Created by gouyz on 2017/3/23.
//  Copyright © 2017年 gouyz. All rights reserved.
//

import UIKit

class GYZMainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customTabbar: TACustomTabBar = TACustomTabBar.init(frame: self.tabBar.frame)
        customTabbar.clickBlock = { () in
            
            let nav = GYZBaseNavigationVC.init(rootViewController: TAOthersVC())
            self.present(nav, animated: true, completion: nil)
        }
        
        self.setValue(customTabbar, forKey: "tabBar")

        setUp()
    }
    
    func setUp(){
//        tabBar.tintColor = kWhiteColor
        tabBar.barTintColor = kNavBarColor
        tabBar.isTranslucent = false
        
        addViewController(TAHomeVC(), title: "首页", normalImgName: "icon_tabbar_home")
        addViewController(TAFavoriteVC(), title: "收藏", normalImgName: "icon_tabbar_favourite")
//        addViewController(TAOthersVC(), title: "", normalImgName: "icon_tabbar_add")
        addViewController(TAFriendsVC(), title: "朋友", normalImgName: "icon_tabbar_friends")
        addViewController(TAMineVC(), title: "我的", normalImgName: "icon_tabbar_mine")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 添加子控件
    fileprivate func addViewController(_ childController: UIViewController, title: String,normalImgName: String) {
        let nav = GYZBaseNavigationVC(rootViewController:childController)
        addChildViewController(nav)
        childController.tabBarItem.title = title
        
        // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
        childController.tabBarItem.image = UIImage(named: normalImgName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: normalImgName + "_selected")?.withRenderingMode(.alwaysOriginal)
       
        // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : kWhiteColor], for: .normal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.RGBColor(15, g: 65, b: 148)], for: .selected)
    }
}
