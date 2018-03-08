//
//  TACommentHeaderView.swift
//  TuAi
//  论坛 header
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACommentHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kBackgroundColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(bgView)
        bgView.backgroundColor = kWhiteColor
        bgView.addSubview(nameLab)
        bgView.addSubview(moreImgView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(kMargin)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(moreImgView.snp.left).offset(-kMargin)
            make.top.bottom.equalTo(bgView)
        }
        moreImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(bgView)
            make.size.equalTo(CGSize.init(width: 20, height: 5))
        }
    }
    
    lazy var bgView: UIView = UIView()
    /// 标题
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.text = "精选小组"
        
        return lab
    }()
    /// 更多
    lazy var moreImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_more_black"))
}
