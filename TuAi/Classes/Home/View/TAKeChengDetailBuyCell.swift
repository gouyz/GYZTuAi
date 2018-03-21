//
//  TAKeChengDetailBuyCell.swift
//  TuAi
//  课程详情 购买cell
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAKeChengDetailBuyCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kWhiteColor
        
        contentView.addSubview(tagsView)
        contentView.addSubview(priceLab)
        contentView.addSubview(buyBtn)
        
        tagsView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.left.equalTo(kMargin)
            make.right.equalTo(buyBtn.snp.left).offset(-kMargin)
            make.height.equalTo(0)
            make.bottom.equalTo(priceLab.snp.top)
        }
        priceLab.snp.makeConstraints { (make) in
            make.right.equalTo(buyBtn.snp.left).offset(-kMargin)
            make.left.equalTo(tagsView)
            make.bottom.equalTo(-5)
            make.height.equalTo(30)
        }
        buyBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(contentView)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
        
        let str = "￥688.00" + "  ￥998.00"
        let price : NSMutableAttributedString = NSMutableAttributedString(string: str)
        price.addAttribute(NSAttributedStringKey.foregroundColor, value: kRedFontColor, range: NSMakeRange(0, 7))
        price.addAttribute(NSAttributedStringKey.font, value: k18Font, range: NSMakeRange(0, 7))
        
        price.addAttribute(NSAttributedStringKey.baselineOffset, value: 0, range: NSMakeRange(9, 7))
        price.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(9, 7))
        priceLab.attributedText = price
    }
    /// 标签 类型
    var tagsView: HXTagsView = {
        
        let view = HXTagsView()
        view.tagAttribute.borderColor = kGrayLineColor
        view.tagAttribute.normalBackgroundColor = kWhiteColor
        view.tagAttribute.selectedBackgroundColor = kWhiteColor
        view.tagAttribute.textColor = kGaryFontColor
        view.tagAttribute.selectedTextColor = kGaryFontColor
        view.tagAttribute.cornerRadius = 8
        view.backgroundColor = kWhiteColor
        /// 显示多行
        view.layout.scrollDirection = .vertical
        
        return view
    }()
    /// 原价
    lazy var priceLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "￥998.00"
        
        return lab
    }()
    /// 立即购买
    lazy var buyBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("立即购买", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.cornerRadius = 15
        return btn
    }()
}
