//
//  TAJingHuaCell.swift
//  TuAi
//  精华cell
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAJingHuaCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(leftItemView)
        contentView.addSubview(rightItemView)
        
        leftItemView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.bottom.equalTo(contentView)
            make.width.equalTo(rightItemView)
        }
        rightItemView.snp.makeConstraints { (make) in
            make.left.equalTo(leftItemView.snp.right).offset(kMargin)
            make.right.equalTo(-kMargin)
            make.top.bottom.width.equalTo(leftItemView)
        }
    }
    ///左边item
    lazy var leftItemView : TAJingHuaItemView = TAJingHuaItemView()
    ///右边item
    lazy var rightItemView : TAJingHuaItemView = TAJingHuaItemView()
}
