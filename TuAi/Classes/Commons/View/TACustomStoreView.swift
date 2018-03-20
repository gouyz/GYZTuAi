//
//  TACustomStoreView.swift
//  TuAi
//  自定义显示评分View
//  Created by gouyz on 2018/3/20.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACustomStoreView: UIView {

    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        addSubview(titleLab)
        addSubview(processBgView)
        addSubview(processView)
        addSubview(scoreLab)
        
        titleLab.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(70)
        }
        processBgView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(titleLab.snp.right)
            make.width.equalTo(150)
        }
        processView.snp.makeConstraints { (make) in
            make.top.bottom.left.equalTo(processBgView)
            make.width.equalTo(150)
        }
        scoreLab.snp.makeConstraints { (make) in
            make.left.equalTo(processBgView.snp.right)
            make.top.bottom.equalTo(titleLab)
            make.width.equalTo(40)
        }
    }
    /// 标题
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        
        return lab
    }()
    /// 进度条 背景
    lazy var processBgView: UIView = {
        let view = UIView()
        view.backgroundColor = kBackgroundColor
        view.cornerRadius = 8
        
        return view
    }()
    /// 进度条
    lazy var processView: UIView = {
        let view = UIView()
        view.backgroundColor = kBlueFontColor
        view.cornerRadius = 8
        
        return view
    }()
    
    /// 评分
    lazy var scoreLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        lab.textAlignment = .center
        
        return lab
    }()
}
