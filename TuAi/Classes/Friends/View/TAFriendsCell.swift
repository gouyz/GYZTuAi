//
//  TAFriendsCell.swift
//  TuAi
//  朋友 cell
//  Created by gouyz on 2018/3/13.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFriendsCell: UITableViewCell {
    
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
        bgView.addSubview(userImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(typeLab)
        bgView.addSubview(timeLab)
        bgView.addSubview(titleLab)
        
        bgView.addSubview(contentBgView)
        contentBgView.addSubview(contentLab)
        contentBgView.addSubview(imgViews)
        
        bgView.addSubview(conmentView)
        bgView.addSubview(zanView)
        bgView.addSubview(sharedView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.centerY.height.equalTo(userImgView)
            make.width.greaterThanOrEqualTo(60)
        }
        typeLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab.snp.right).offset(kMargin)
            make.right.equalTo(-kMargin)
            make.height.centerY.equalTo(nameLab)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.height.equalTo(nameLab)
            make.right.equalTo(-kMargin)
            make.top.equalTo(nameLab.snp.bottom)
        }
        titleLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(timeLab)
            make.top.equalTo(timeLab.snp.bottom).offset(5)
        }
        contentBgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLab)
            make.top.equalTo(titleLab.snp.bottom).offset(5)
            make.bottom.equalTo(zanView.snp.top)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
        }
        imgViews.snp.makeConstraints { (make) in
            make.top.equalTo(contentLab.snp.bottom).offset(kMargin)
            make.left.right.equalTo(contentLab)
            make.height.equalTo(0)
            make.bottom.equalTo(-kMargin)
        }
        
        zanView.snp.makeConstraints { (make) in
            make.left.equalTo(contentBgView)
            make.width.equalTo(65)
            make.height.equalTo(kTitleHeight)
            make.bottom.equalTo(bgView)
        }
        conmentView.snp.makeConstraints { (make) in
            make.left.equalTo(zanView.snp.right).offset(5)
            make.width.height.bottom.equalTo(zanView)
        }
        sharedView.snp.makeConstraints { (make) in
            make.left.equalTo(conmentView.snp.right).offset(5)
            make.width.height.bottom.equalTo(zanView)
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 10
        
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
    /// 类别
    lazy var typeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "发布文章"
        
        return lab
    }()
    /// 类别
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "1小时前"
        
        return lab
    }()
    /// 标题
    lazy var titleLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.numberOfLines = 0
        lab.text = "写好作文50条全攻略，送给不会写、写不长的孩子"
        
        return lab
    }()
    lazy var contentBgView: UIView = {
        let view = UIView()
        view.backgroundColor = kBackgroundColor
        
        return view
    }()
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kBlackFontColor
        lab.numberOfLines = 0
        lab.text = "聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯"
        
        return lab
    }()
    
    /// 九宫格图片显示
    lazy var imgViews: GYZPhotoView = GYZPhotoView()
    
    /// 评论
    lazy var conmentView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_friends_conment")
        view.menuTitle.text = "2018"
        
        return view
        
    }()
    /// 赞
    lazy var zanView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_friends_zan")
        view.menuTitle.text = "2018"
        
        return view
        
    }()
    /// 分享
    lazy var sharedView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_friends_shared")
        view.menuTitle.text = "3333"
        
        return view
        
    }()
    
}
