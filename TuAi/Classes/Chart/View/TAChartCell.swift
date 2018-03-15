//
//  TAChartCell.swift
//  TuAi
//  私信 cell
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAChartCell: UITableViewCell {

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
        
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(5)
            make.top.equalTo(userHeaderView)
            make.right.equalTo(timeLab.snp.left).offset(-kMargin)
            make.height.equalTo(30)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab)
            make.right.equalTo(-kMargin)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(userHeaderView)
        }
        timeLab.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(nameLab)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
    }
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 30
        
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
        lab.text = "不忘初心，无畏西东 不忘初心，无畏西东"
        
        return lab
    }()
    /// 时间
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        lab.textAlignment = .right
        lab.text = "15分钟前"
        
        return lab
    }()
}
