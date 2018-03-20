//
//  TASearchVideoCell.swift
//  TuAi
//  搜索视频 cell 
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASearchVideoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(iconView)
        contentView.addSubview(nameLab)
        contentView.addSubview(playImgView)
        
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        iconView.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.bottom.equalTo(-kMargin)
        }
        playImgView.snp.makeConstraints { (make) in
            make.center.equalTo(iconView)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
    }
    
    /// 图片
    lazy var iconView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_home_header_bg")
        
        return imgView
    }()
    /// 播放图片
    lazy var playImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_video_play"))
    /// 名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "论美术高考的技巧"
        
        return lab
    }()
}
