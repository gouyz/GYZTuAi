//
//  TAStudyRecordHeaderView.swift
//  TuAi
//  学习记录 header
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAStudyRecordHeaderView: UIView {
    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(userImgView)
        addSubview(nameLab)
        addSubview(bgView)
        bgView.addSubview(keChengNumberLab)
        bgView.addSubview(keChengLab)
        bgView.addSubview(dayNumberLab)
        bgView.addSubview(dayLab)
        
        addSubview(lineView)
        
        userImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(20)
            make.size.equalTo(CGSize.init(width: 80, height: 80))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(userImgView.snp.bottom)
            make.height.equalTo(kTitleHeight)
        }
        bgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(userImgView)
            make.top.equalTo(nameLab.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize.init(width: 160, height: 40))
        }
        keChengNumberLab.snp.makeConstraints { (make) in
            make.left.top.equalTo(bgView)
            make.height.equalTo(20)
            make.width.equalTo(dayNumberLab)
        }
        keChengLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(keChengNumberLab)
            make.top.equalTo(keChengNumberLab.snp.bottom)
            make.bottom.equalTo(bgView)
        }
        dayNumberLab.snp.makeConstraints { (make) in
            make.right.top.equalTo(bgView)
            make.left.equalTo(keChengNumberLab.snp.right)
            make.height.width.equalTo(keChengNumberLab)
        }
        dayLab.snp.makeConstraints { (make) in
            make.right.left.equalTo(dayNumberLab)
            make.top.equalTo(dayNumberLab.snp.bottom)
            make.bottom.equalTo(bgView)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kMargin)
        }
    }
    
    /// 图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "小猪佩琪"
        
        return lab
    }()
    lazy var bgView: UIView = UIView()
    /// 课程数量
    lazy var keChengNumberLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "15门"
        
        return lab
    }()
    ///
    lazy var keChengLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.textAlignment = .center
        lab.text = "学习课程"
        
        return lab
    }()
    /// 学习天数
    lazy var dayNumberLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "21天"
        
        return lab
    }()
    ///
    lazy var dayLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.textAlignment = .center
        lab.text = "已经学习"
        
        return lab
    }()
    
    lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = kBackgroundColor
        
        return line
    }()
}
