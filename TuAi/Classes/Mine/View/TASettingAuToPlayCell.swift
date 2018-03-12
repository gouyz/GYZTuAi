//
//  TASettingAuToPlayCell.swift
//  TuAi
//  视频自动播放 cell
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASettingAuToPlayCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(nameLab)
        contentView.addSubview(selectedIconView)
        
        nameLab.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.left.equalTo(kMargin)
            make.right.equalTo(selectedIconView.snp.left).offset(-kMargin)
        }
        selectedIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
            make.size.equalTo(CGSize.init(width: 16, height: 16))
        }
    }
    /// cell title
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        
        return lab
    }()
    /// 选择图标
    lazy var selectedIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_selected_blue"))
}
