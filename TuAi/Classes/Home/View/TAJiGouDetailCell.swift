//
//  TAJiGouDetailCell.swift
//  TuAi
//  机构详情cell
//  Created by gouyz on 2018/3/20.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAJiGouDetailCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(bgView)
        bgView.addSubview(iconView)
        bgView.addSubview(nameLab)
        bgView.addSubview(desLab)
        
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        iconView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(bgView)
            make.height.equalTo(100)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(iconView)
            make.top.equalTo(iconView.snp.bottom)
            make.height.equalTo(25)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(-5)
        }
    }
    
    ///
    lazy var bgView : UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        
        return view
    }()
    /// 图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kHeightGaryFontColor
        imgView.cornerRadius = kCornerRadius
        
        return imgView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "幼教课程"
        
        return lab
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        lab.numberOfLines = 3
        lab.text = "佩琪教你生活小知识，佩琪教你生活小知识，佩琪教你生活小知识"
        
        return lab
    }()
}
