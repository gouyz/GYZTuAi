//
//  TAMineUserInfoCell.swift
//  TuAi
//  个人资料 cell
//  Created by gouyz on 2018/3/3.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMineUserInfoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(userImgView)
        contentView.addSubview(nameLab)
        contentView.addSubview(confirmLab)
        contentView.addSubview(desLab)
        contentView.addSubview(rightIconView)
        
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.top.equalTo(userImgView)
            make.width.lessThanOrEqualTo(kScreenWidth * 0.4)
            make.height.equalTo(30)
        }
        confirmLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab.snp.right).offset(kMargin)
            make.centerY.equalTo(nameLab)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.height.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.right.equalTo(rightIconView.snp.left).offset(-kMargin)
        }
        rightIconView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 8, height: 10))
        }
    }
    
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "小胖子小胖子小胖子小胖子小胖子小胖子"
        
        return lab
    }()
    
    /// 申请认证
    lazy var confirmLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k13Font
        lab.text = "申请认证"
        lab.backgroundColor = kWhiteColor
        lab.cornerRadius = 5
        lab.borderColor = kBlueFontColor
        lab.borderWidth = klineWidth
        lab.textAlignment = .center
        
        return lab
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k15Font
        lab.numberOfLines = 0
        lab.text = "查看个人主页或编辑资料"
        
        return lab
    }()
    /// 右侧箭头
    lazy var rightIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_right_black"))
}
