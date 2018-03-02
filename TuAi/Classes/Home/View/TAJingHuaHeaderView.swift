//
//  TAJingHuaHeaderView.swift
//  TuAi
//  精华 headerView
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAJingHuaHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(nameLab)
        contentView.addSubview(desLab)
        
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
            make.height.equalTo(30)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(-kMargin)
        }
    }
    
    /// 标题
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.font = k18Font
        lab.textColor = kBlackFontColor
        lab.textAlignment = .center
        lab.text = "精选专栏"
        
        return lab
    }()
    /// 描述
    lazy var desLab: UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kGaryFontColor
        lab.text = "- 激发宝宝的学习兴趣 -"
        lab.textAlignment = .center
        
        return lab
    }()
}
