//
//  TAEditMyProfileHeaderView.swift
//  TuAi
//  编辑个人资料 header 
//  Created by gouyz on 2018/3/16.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAEditMyProfileHeaderView: UIView {
    // MARK: 生命周期方法
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.addSubview(userHeaderView)
        self.addSubview(desLab)
        self.addSubview(manBtn)
        self.addSubview(womanBtn)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(20)
            make.size.equalTo(CGSize.init(width: 80, height: 80))
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(userHeaderView.snp.bottom)
            make.height.equalTo(24)
        }
        
        manBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.centerX).offset(-kMargin)
            make.bottom.equalTo(-20)
            make.size.equalTo(CGSize.init(width: 60, height: 24))
        }
        womanBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX).offset(kMargin)
            make.bottom.size.equalTo(manBtn)
        }
        
        manBtn.set(image: UIImage.init(named: "icon_profile_man_gray"), title: "男", titlePosition: .right, additionalSpacing: 8, state: .normal)
        manBtn.set(image: UIImage.init(named: "icon_profile_man_white"), title: "男", titlePosition: .right, additionalSpacing: 8, state: .selected)
        womanBtn.set(image: UIImage.init(named: "icon_profile_woman_gray"), title: "女", titlePosition: .right, additionalSpacing: 8, state: .normal)
        womanBtn.set(image: UIImage.init(named: "icon_profile_woman_white"), title: "女", titlePosition: .right, additionalSpacing: 8, state: .selected)
    }
    /// 用户头像 图片
    lazy var userHeaderView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = 40
        
        return imgView
    }()
    ///
    lazy var desLab: UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kGaryFontColor
        lab.textAlignment = .center
        lab.text = "点击头像编辑"
        
        return lab
    }()
    /// 男
    lazy var manBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitleColor(kHeightGaryFontColor, for: .normal)
        btn.setTitleColor(kWhiteColor, for: .selected)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kGaryFontColor
        btn.borderWidth = klineDoubleWidth
        
        btn.cornerRadius = 12
        return btn
    }()
    /// 女
    lazy var womanBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitleColor(kGaryFontColor, for: .normal)
        btn.setTitleColor(kWhiteColor, for: .selected)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kGaryFontColor
        btn.borderWidth = klineDoubleWidth
        
        btn.cornerRadius = 12
        return btn
    }()
   
}
