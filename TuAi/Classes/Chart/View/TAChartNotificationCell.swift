//
//  TAChartNotificationCell.swift
//  TuAi
//  私信 通知 cell 
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAChartNotificationCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(userHeaderView)
        contentView.addSubview(nameLab)
        contentView.addSubview(contentLab)
        contentView.addSubview(timeLab)
        contentView.addSubview(iconView)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(5)
            make.top.equalTo(userHeaderView)
            make.right.equalTo(iconView.snp.left).offset(-kMargin)
            make.height.equalTo(20)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(timeLab.snp.top)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.bottom.equalTo(-kMargin)
            make.height.equalTo(20)
        }
        iconView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(contentView)
            make.height.equalTo(80)
            make.width.equalTo(0)
        }
        
    }
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 20
        
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
    
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.numberOfLines = 2
        lab.text = "不忘初心，无畏西东 不忘初心，无畏西东 不忘初心，无畏西东 不忘初心，无畏西东 不忘初心，无畏西东"
        
        return lab
    }()
    /// 时间
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        lab.text = "15分钟前"
        
        return lab
    }()
    /// 图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        
        return imgView
    }()
}
