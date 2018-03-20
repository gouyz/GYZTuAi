//
//  TAJiGouDetailHeaderView.swift
//  TuAi
//  机构详情 header
//  Created by gouyz on 2018/3/20.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAJiGouDetailHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(adsImgView)
        addSubview(nameLab)
        addSubview(addressLab)
        addSubview(desLab)
        addSubview(zongHeScoreView)
        addSubview(teacherScoreView)
        addSubview(parentScoreView)
        addSubview(titleLab)
        
        adsImgView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(160)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(adsImgView.snp.bottom)
            make.height.equalTo(30)
        }
        addressLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.height.equalTo(20)
            make.top.equalTo(nameLab.snp.bottom)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(addressLab)
            make.top.equalTo(addressLab.snp.bottom)
        }
        zongHeScoreView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(desLab.snp.bottom).offset(kMargin)
            make.width.equalTo(260)
            make.height.equalTo(16)
        }
        teacherScoreView.snp.makeConstraints { (make) in
            make.centerX.width.height.equalTo(zongHeScoreView)
            make.top.equalTo(zongHeScoreView.snp.bottom).offset(kMargin)
        }
        parentScoreView.snp.makeConstraints { (make) in
            make.centerX.width.height.equalTo(zongHeScoreView)
            make.top.equalTo(teacherScoreView.snp.bottom).offset(kMargin)
        }
        titleLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLab)
            make.top.equalTo(parentScoreView.snp.bottom).offset(20)
        }
    }
    /// 广告轮播图
    lazy var adsImgView: ZCycleView = {
        let adsView = ZCycleView()
        adsView.setImagesGroup([#imageLiteral(resourceName: "icon_home_header_bg")])
        adsView.pageControlAlignment = .right
        adsView.pageControlIndictirColor = kWhiteColor
        adsView.pageControlCurrentIndictirColor = kNavBarColor
        adsView.scrollDirection = .horizontal
        
        return adsView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "瑞美达少儿英语"
        
        return lab
    }()
    /// 地址
    lazy var addressLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.textAlignment = .center
        lab.text = "地址：瑞美达少儿英语"
        
        return lab
    }()
    /// 简介
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.textAlignment = .center
        lab.text = "简介：扬州环球雅思旗下少儿英语学习中心,扬州环球雅思旗下少儿英语学习中心"
        
        return lab
    }()
    /// 综合评分
    lazy var zongHeScoreView: TACustomStoreView = {
        let scoreView = TACustomStoreView()
        scoreView.titleLab.text = "综合评分："
        
        return scoreView
    }()
    /// 师资力量
    lazy var teacherScoreView: TACustomStoreView = {
        let scoreView = TACustomStoreView()
        scoreView.titleLab.text = "师资力量："
        
        return scoreView
    }()
    /// 家长评分
    lazy var parentScoreView: TACustomStoreView = {
        let scoreView = TACustomStoreView()
        scoreView.titleLab.text = "家长评分："
        
        return scoreView
    }()
    ///
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "开设课程"
        
        return lab
    }()
}
