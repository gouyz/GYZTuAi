//
//  TAMyGroupCell.swift
//  TuAi
//  我的群组 cell
//  Created by gouyz on 2018/3/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMyGroupCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kBackgroundColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(bgView)
        bgView.backgroundColor = kWhiteColor
        
        bgView.addSubview(iconView)
        bgView.addSubview(nameLab)
        bgView.addSubview(desLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 120, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(kMargin)
            make.top.equalTo(iconView)
            make.right.equalTo(-kMargin)
            make.height.equalTo(30)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(iconView)
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 群组图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 5
        
        return imgView
    }()
    /// 群组名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "超能辣妈"
        
        return lab
    }()
    
    /// 最近活跃
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "最近活跃：2018-03-06"
        
        return lab
    }()
}
