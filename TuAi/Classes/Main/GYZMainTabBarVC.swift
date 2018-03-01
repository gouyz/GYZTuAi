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

        setUp()
    }
    
    func setUp(){
        tabBar.tintColor = kNavBarColor
        
        addViewController(TAHomeVC(), title: "首页", normalImgName: "icon_tabbar_home")
        addViewController(TAFavoriteVC(), title: "收藏", normalImgName: "icon_tabbar_favourite")
        addViewController(TAOthersVC(), title: "", normalImgName: "icon_tabbar_add")
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
        childController.tabBarItem.image = UIImage(named: normalImgName)
        childController.tabBarItem.selectedImage = UIImage(named: normalImgName + "_selected")
    }
}
