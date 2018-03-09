//
//  TAFavouriteVideoChildCell.swift
//  TuAi
//  收藏 child cell
//  Created by gouyz on 2018/3/9.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFavouriteVideoChildCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        addSubview(iconView)
        iconView.addSubview(playImgView)
        addSubview(desLab)
        
        iconView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(80)
        }
        playImgView.snp.makeConstraints { (make) in
            make.center.equalTo(iconView)
            make.size.equalTo(CGSize.init(width: kTitleHeight, height: kTitleHeight))
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(iconView)
            make.bottom.equalTo(-5)
            make.top.equalTo(iconView.snp.bottom).offset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// 图片
    lazy var iconView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        
        return imgView
    }()
    /// 播放图片
    lazy var playImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kHeightGaryFontColor
//        imgView.isHidden = true
        
        return imgView
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.numberOfLines = 2
        lab.text = "儿童教育学专家儿童教育学专家儿童教育学专家"
        
        return lab
    }()
}
