//
//  TAKeChengDetailDesCell.swift
//  TuAi
//  课程介绍 cell
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAKeChengDetailDesCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kWhiteColor
        
        contentView.addSubview(tagImgView)
        contentView.addSubview(desLab)
        contentView.addSubview(titleLab)
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.centerX.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 120, height: 30))
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(titleLab.snp.bottom).offset(kMargin)
            make.right.equalTo(-kMargin)
        }
        
        tagImgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom).offset(5)
            make.bottom.equalTo(-kMargin)
        }
    }
    ///
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kWhiteColor
        lab.font = k15Font
        lab.text = "课程内容简介"
        lab.textAlignment = .center
        lab.backgroundColor = kBlackFontColor
        lab.cornerRadius = kCornerRadius
        
        
        return lab
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        lab.text = "培训孩子音乐、艺术等多方面的能力，寓教于乐,培训孩子音乐、艺术等多方面的能力，寓教于乐,培训孩子音乐、艺术等多方面的能力，寓教于乐"
        
        return lab
    }()
    
    // 图片
    var tagImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_home_header_bg"))
}
