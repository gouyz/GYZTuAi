//
//  TACustomTabBar.swift
//  TuAi
//  自定义 TabBar
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACustomTabBar: UITabBar {
    
    /// 点击事件
    var clickBlock: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(plusBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var plusBtn: UIButton = {
       
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 35, height: 30)
        btn.setBackgroundImage(UIImage.init(named: "icon_tabbar_add"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "icon_tabbar_add_selected"), for: .selected)
        btn.addTarget(self, action: #selector(plusBtnClick), for: .touchUpInside)
        
        return btn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 算出每一个占据的宽度 加上了加号 Button 的位置
        let itemW: CGFloat = self.bounds.size.width / CGFloat.init((self.items?.count)! + 1)
        var itemCurrent: CGFloat = 0
        
        var itemCenterY = self.bounds.size.height / 2.0
        
        //遍历tabBar中的所有子视图
        //只有当遍历到的子视图的类型是UITabBarButton
        //时，才代表找到的其他按钮，调整位置即可
        for itemTemp in self.subviews {
            
            if NSStringFromClass(itemTemp.classForCoder) == "UITabBarButton" {
                
                var frame = itemTemp.frame
                //设置宽度
                frame.size.width = itemW
                //设置横向x
                frame.origin.x = itemW * itemCurrent
                
                itemTemp.frame = frame;
                
                if itemCurrent == 0{
                    itemCenterY = itemTemp.centerY
                }
                
                itemCurrent += 1
                if (itemCurrent == 2) {
                    itemCurrent += 1
                }
            }
        }
        //设置中间按钮的位置
        self.plusBtn.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: itemCenterY)
    }

    /// 加号
    @objc func plusBtnClick(){
        if clickBlock != nil {
            clickBlock!()
        }
    }
}
