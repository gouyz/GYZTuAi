//
//  TAAboutFriendHeaderView.swift
//  TuAi
//  朋友 关于TA  header
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAboutFriendHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(iconView)
        contentView.addSubview(contentLab)
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 12, height: 12))
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(kMargin)
            make.right.equalTo(-kMargin)
            make.top.bottom.equalTo(contentView)
        }
    }
    
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_about_friend_tag"))
    /// 标题
    lazy var contentLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kHeightGaryFontColor
        lab.text = "个人信息"
        
        return lab
    }()
}
