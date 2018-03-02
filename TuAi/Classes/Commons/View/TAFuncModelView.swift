//
//  TAFuncModelView.swift
//  TuAi
//  功能模块的按钮View
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFuncModelView: UIView {

    ///图片尺寸大小
    var imgSize: CGSize = CGSize.init(width: 35, height: 35)
    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    convenience init(frame: CGRect, iconName : String,title: String,size: CGSize? = nil){
        self.init(frame: frame)
        
        if size != nil {
            imgSize = size!
            menuImg.snp.updateConstraints({ (make) in
                make.size.equalTo(imgSize)
            })
        }
        
        menuImg.image = UIImage.init(named: iconName)
        menuTitle.text = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        addSubview(menuImg)
        addSubview(menuTitle)
        
        menuImg.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self)
            make.size.equalTo(imgSize)
        }
        menuTitle.snp.makeConstraints { (make) in
            make.top.equalTo(menuImg.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self).offset(-15)
        }
    }
    
    /// menu  图标
    lazy var menuImg : UIImageView = UIImageView()
    /// menu标题
    lazy var menuTitle : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.textAlignment = .center
        
        return lab
    }()
}
