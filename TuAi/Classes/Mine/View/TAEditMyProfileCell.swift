//
//  TAEditMyProfileCell.swift
//  TuAi
//  编辑个人资料 cell
//  Created by gouyz on 2018/3/16.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAEditMyProfileCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(nameLab)
        contentView.addSubview(textFiled)
        contentView.addSubview(rightIconView)
        
        nameLab.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.left.equalTo(kMargin)
            make.width.equalTo(80)
            make.bottom.equalTo(contentView)
        }
        textFiled.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(nameLab)
            make.left.equalTo(nameLab.snp.right)
            make.right.equalTo(rightIconView.snp.left)
        }
        rightIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-kMargin)
            make.size.equalTo(CGSize.init(width: 8, height: 13))
        }
    }
    /// cell title
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kGaryFontColor
        
        return lab
    }()
    /// 输入框
    lazy var textFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        
        return textFiled
    }()
    /// 右侧箭头图标
    lazy var rightIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_right_gray"))
}
