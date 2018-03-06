//
//  TAMyYouHuiCell.swift
//  TuAi
//  我的优惠 cell
//  Created by gouyz on 2018/3/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMyYouHuiCell: UITableViewCell {

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
        bgView.addSubview(dateLab)
        bgView.addSubview(moneyLab)
        bgView.addSubview(desLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 90, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(kMargin)
            make.top.equalTo(iconView)
            make.right.equalTo(moneyLab.snp.left).offset(-kMargin)
            make.height.equalTo(30)
        }
        dateLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(iconView)
        }
        moneyLab.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.top.equalTo(nameLab)
            make.height.equalTo(34)
            make.width.equalTo(80)
        }
        desLab.snp.makeConstraints { (make) in
            make.right.width.equalTo(moneyLab)
            make.top.equalTo(moneyLab.snp.bottom)
            make.height.equalTo(20)
        }
        
        let money = "￥200"
        let moneyAttr : NSMutableAttributedString = NSMutableAttributedString(string: money)
        moneyAttr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 28.0), range: NSMakeRange(1, money.count - 1))
        moneyLab.attributedText = moneyAttr
    }
    
    lazy var bgView : UIView = UIView()
    /// 图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 5
        
        return imgView
    }()
    /// 名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "人之初教育"
        
        return lab
    }()
    
    /// 有效期
    lazy var dateLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "2018.03.06 - 2018.03.30"
        
        return lab
    }()
    
    /// 金额
    lazy var moneyLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kRedFontColor
        lab.font = k15Font
        lab.text = "￥20"
        
        return lab
    }()
    
    /// 使用限制
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kRedFontColor
        lab.font = k12Font
        lab.text = "满￥5000可用"
        
        return lab
    }()
}
