//
//  TAAboutFriendConfirmCell.swift
//  TuAi
//  认证信息 cell
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAboutFriendConfirmCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(confirmBtn)
        contentView.addSubview(nameLab)
        
        confirmBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.centerY.equalTo(nameLab)
            make.width.equalTo(60)
            make.height.equalTo(24)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(confirmBtn.snp.right).offset(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(contentView)
            make.height.greaterThanOrEqualTo(34)
            make.bottom.equalTo(contentView)
        }
        
        confirmBtn.set(image: UIImage.init(named: "icon_about_friend_confirm"), title: "认证", titlePosition: .right, additionalSpacing: 5, state: .normal)
    }
    
    lazy var confirmBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k13Font
        
        btn.cornerRadius = 12
        return btn
    }()
    /// 名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k15Font
        lab.text = "青少年教育学家"
        
        return lab
    }()

}
