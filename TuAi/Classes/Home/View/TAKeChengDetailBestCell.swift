//
//  TAKeChengDetailBestCell.swift
//  TuAi
//  课程亮点 cell
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAKeChengDetailBestCell: UITableViewCell {

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
        
        tagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalTo(desLab)
            make.size.equalTo(CGSize.init(width: 12, height: 12))
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(tagImgView.snp.right).offset(kMargin)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.equalTo(-kMargin)
        }
    }
    /// 图标
    var tagImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_check_circle_blue"))
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.text = "培训孩子音乐、艺术等多方面的能力，寓教于乐"
        
        return lab
    }()
}
