//
//  TACommentGroupDetailCell.swift
//  TuAi
//  论坛 精选小组详情 cell
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACommentGroupDetailCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kBackgroundColor
        
        contentView.addSubview(bgView)
        bgView.backgroundColor = kWhiteColor
        bgView.addSubview(contentLab)
        bgView.addSubview(imgViews)
        bgView.addSubview(userImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(timeLab)
        bgView.addSubview(titleLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(kMargin)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.top.equalTo(userImgView)
            make.right.equalTo(-kMargin)
            make.height.equalTo(20)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
        }
        titleLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(timeLab.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLab)
            make.top.equalTo(titleLab.snp.bottom).offset(5)
        }
        
        imgViews.snp.makeConstraints { (make) in
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.left.right.equalTo(contentLab)
            make.height.equalTo(0)
            make.bottom.equalTo(-kMargin)
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 20
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "小胖子"
        
        return lab
    }()
    /// 时间
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "2018-03-16"
        
        return lab
    }()
    /// 标题
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k15Font
        lab.text = "寒假理科复习攻略，寒假理科复习攻略"
        
        return lab
    }()
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kHeightGaryFontColor
        lab.numberOfLines = 0
        lab.text = "聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯"
        
        return lab
    }()
    
    /// 九宫格图片显示
    lazy var imgViews: GYZPhotoView = GYZPhotoView()
}
