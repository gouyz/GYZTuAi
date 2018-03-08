//
//  GYZImgLeftAndTxtRightView.swift
//  TuAi
//  图文btn，图片在左，文字在右
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class GYZImgLeftAndTxtRightView: UIView {

    ///图片尺寸大小
    var imgSize: CGSize = CGSize.init(width: 20, height: 18)
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
            make.left.equalTo(self)
            make.centerY.equalTo(self)
            make.size.equalTo(imgSize)
        }
        menuTitle.snp.makeConstraints { (make) in
            make.left.equalTo(menuImg.snp.right).offset(2)
            make.right.bottom.top.equalTo(self)
        }
    }
    
    /// menu  图标
    lazy var menuImg : UIImageView = UIImageView()
    /// menu标题
    lazy var menuTitle : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k10Font
        
        return lab
    }()
}
