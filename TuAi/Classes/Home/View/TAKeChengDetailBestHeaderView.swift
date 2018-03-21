//
//  TAKeChengDetailBestHeaderView.swift
//  TuAi
//  课程亮点 header
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAKeChengDetailBestHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(tagImgView)
        contentView.addSubview(titleImgView)
        titleImgView.addSubview(titleLab)
        
        tagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        titleImgView.snp.makeConstraints { (make) in
            make.left.equalTo(tagImgView.snp.right).offset(3)
            make.centerY.height.equalTo(tagImgView)
            make.width.equalTo(80)
        }
        titleLab.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    /// 图标
    var tagImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_kecheng_detail_tag"))
    /// 标题背景
    var titleImgView: UIImageView = UIImageView.init(image: UIImage.init(named: ""))
    
    // 标题
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "课程亮点"
        
        return lab
    }()
}
