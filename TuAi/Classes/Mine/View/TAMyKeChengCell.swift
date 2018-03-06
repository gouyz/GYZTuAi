//
//  TAMyKeChengCell.swift
//  TuAi
//  我的课程 cell
//  Created by gouyz on 2018/3/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMyKeChengCell: UITableViewCell {

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
        
        bgView.addSubview(kcImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(payLab)
        bgView.addSubview(applyLab)
        bgView.addSubview(categoryLab)
        bgView.addSubview(lineView)
        bgView.addSubview(desLab)
        bgView.addSubview(desNameLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        kcImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 80, height: 80))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kcImgView.snp.right).offset(kMargin)
            make.top.equalTo(kcImgView)
            make.right.equalTo(-kMargin)
            make.height.equalTo(20)
        }
        categoryLab.snp.makeConstraints { (make) in
            make.left.height.equalTo(nameLab)
            make.bottom.equalTo(kcImgView)
            make.right.equalTo(applyLab.snp.left).offset(-kMargin)
        }
        applyLab.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.bottom.height.equalTo(categoryLab)
            make.width.equalTo(60)
        }
        payLab.snp.makeConstraints { (make) in
            make.right.height.width.equalTo(applyLab)
            make.bottom.equalTo(applyLab.snp.top).offset(-5)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgView)
            make.top.equalTo(kcImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(klineWidth)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kcImgView)
            make.top.equalTo(lineView.snp.bottom).offset(8)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
        desNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(desLab.snp.right).offset(kMargin)
            make.centerY.equalTo(desLab)
            make.right.equalTo(-kMargin)
            make.height.equalTo(30)
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 课程图片
    lazy var kcImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 3
        
        return imgView
    }()
    /// 课程名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "我们的学校 第一季"
        
        return lab
    }()
    /// 已付款
    lazy var payLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k15Font
        lab.text = "已付款"
        lab.textAlignment = .center
        
        return lab
    }()
    /// 申请售后
    lazy var applyLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "申请售后"
        lab.backgroundColor = kWhiteColor
        lab.cornerRadius = 10
        lab.borderColor = kGaryFontColor
        lab.borderWidth = klineWidth
        lab.textAlignment = .center
        
        return lab
    }()
    /// 类别描述
    lazy var categoryLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "Apple"
        
        return lab
    }()
    /// 分割线
    fileprivate var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    
    /// 课程进度
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k12Font
        lab.text = "30"
        lab.backgroundColor = kWhiteColor
        lab.cornerRadius = 5
        lab.borderColor = kBlueFontColor
        lab.borderWidth = klineWidth
        lab.textAlignment = .center
        
        return lab
    }()
    /// 进度描述
    lazy var desNameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k13Font
        lab.text = "开始学习：小学毕业和中学入学"
        
        return lab
    }()
}
