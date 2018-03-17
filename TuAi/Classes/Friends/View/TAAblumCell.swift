//
//  TAAblumCell.swift
//  TuAi
//  相册cell
//  Created by gouyz on 2018/3/17.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAblumCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(ablumImgView)
        addSubview(nameLab)
        
        ablumImgView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(nameLab.snp.top)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(ablumImgView)
            make.bottom.equalTo(self)
            make.height.equalTo(30)
        }
    }
    
    /// 图片
    lazy var ablumImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = kCornerRadius
        
        return imgView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "宝宝成长记"
        
        return lab
    }()
}
