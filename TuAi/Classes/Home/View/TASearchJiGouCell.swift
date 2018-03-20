//
//  TASearchJiGouCell.swift
//  TuAi
//  搜索机构 cell
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASearchJiGouCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(iconView)
        contentView.addSubview(nameLab)
        contentView.addSubview(categoryLab)
        contentView.addSubview(desLab)
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 120, height: 80))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(kMargin)
            make.top.equalTo(iconView)
            make.right.equalTo(-kMargin)
            make.height.equalTo(20)
        }
        categoryLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(categoryLab.snp.bottom)
            make.bottom.equalTo(iconView)
        }
    }
    
    /// 图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        
        return imgView
    }()
    /// 名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "新意新象美术培训"
        
        return lab
    }()
    
    /// 分类
    lazy var categoryLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "高考美术"
        
        return lab
    }()
    /// 最近活跃
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k10Font
        lab.numberOfLines = 3
        lab.text = "简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介"
        
        return lab
    }()
}
