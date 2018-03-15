//
//  TACommonLabCell.swift
//  TuAi
//  单独多行lab cell
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACommonLabCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(contentLab)
        
        contentLab.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.left.equalTo(30)
            make.bottom.equalTo(-kMargin)
            make.right.equalTo(-kMargin)
        }
    }
    /// cell
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kHeightGaryFontColor
        lab.numberOfLines = 0
        
        return lab
    }()
}
