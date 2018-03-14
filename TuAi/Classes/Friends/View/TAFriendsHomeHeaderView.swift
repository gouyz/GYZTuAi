//
//  TAFriendsHomeHeaderView.swift
//  TuAi
//  朋友主页 header
//  Created by gouyz on 2018/3/14.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFriendsHomeHeaderView: UIView {

    // MARK: 生命周期方法
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.addSubview(bgHeaderView)
        bgHeaderView.addSubview(userHeaderView)
        bgHeaderView.addSubview(nameLab)
        bgHeaderView.addSubview(sexImgView)
        bgHeaderView.addSubview(typeLab)
        bgHeaderView.addSubview(numberLab)
        bgHeaderView.addSubview(noteLab)
        bgHeaderView.addSubview(guanzhuBtn)
        bgHeaderView.addSubview(messageBtn)
        
        bgHeaderView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        userHeaderView.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgHeaderView)
            make.top.equalTo(kTitleAndStateHeight)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgHeaderView)
            make.width.equalTo(120)
            make.top.equalTo(userHeaderView.snp.bottom).offset(kMargin)
            make.height.equalTo(24)
        }
        sexImgView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab.snp.right).offset(3)
            make.centerY.equalTo(nameLab)
            make.size.equalTo(CGSize.init(width: 10, height: 10))
        }
        typeLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(nameLab.snp.bottom)
            make.height.equalTo(20)
        }
        numberLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(typeLab)
            make.top.equalTo(typeLab.snp.bottom)
        }
        noteLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(typeLab)
            make.top.equalTo(numberLab.snp.bottom)
            make.height.equalTo(kTitleHeight)
        }
        
        guanzhuBtn.snp.makeConstraints { (make) in
            make.right.equalTo(bgHeaderView.snp.centerX).offset(-kMargin)
            make.bottom.equalTo(-kMargin)
            make.size.equalTo(CGSize.init(width: 70, height: 30))
        }
        messageBtn.snp.makeConstraints { (make) in
            make.left.equalTo(bgHeaderView.snp.centerX).offset(kMargin)
            make.bottom.size.equalTo(guanzhuBtn)
        }
    }
    
    /// 背景 图片
    lazy var bgHeaderView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_friends_header_bg"))
    /// 用户头像 图片
    lazy var userHeaderView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kWhiteColor
        lab.textAlignment = .center
        lab.text = "小胖子"
        
        return lab
    }()
    // 性别 图片
    lazy var sexImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_sex_man"))
    /// 称号
    lazy var typeLab: UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kWhiteColor
        lab.textAlignment = .center
        lab.text = "青少年教育学家"
        
        return lab
    }()
    /// 关注、亲友数量
    lazy var numberLab: UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kWhiteColor
        lab.textAlignment = .center
        lab.text = "关注 666 | 亲友 888"
        
        return lab
    }()
    /// 备注
    lazy var noteLab: UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kWhiteColor
        lab.textAlignment = .center
        lab.numberOfLines = 2
        lab.text = "在纸上，画一条大江\n让月光化作汹涌的波浪"
        
        return lab
    }()
    /// 关注
    lazy var guanzhuBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("+ 关注", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kWhiteColor
        btn.borderWidth = klineDoubleWidth
        btn.cornerRadius = 15
        
        return btn
    }()
    
    /// 私信
    lazy var messageBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("私信", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kWhiteColor
        btn.borderWidth = klineDoubleWidth
        btn.cornerRadius = 15
        
        return btn
    }()
}
