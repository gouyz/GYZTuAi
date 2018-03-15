//
//  TAAboutFriendInfoCell.swift
//  TuAi
//  个人信息
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAboutFriendInfoCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(desLab)
        contentView.addSubview(contentLab)
        
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.width.equalTo(70)
            make.top.equalTo(contentView)
            make.height.greaterThanOrEqualTo(30)
            make.bottom.equalTo(contentView)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(desLab.snp.right)
            make.top.bottom.equalTo(desLab)
            make.right.equalTo(-kMargin)
        }
    }
    ///
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        
        return lab
    }()
    ///
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "未知"
        
        return lab
    }()
}
