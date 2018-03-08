//
//  TAHomeVideoCell.swift
//  TuAi
//  视频 cell
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAHomeVideoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kBackgroundColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(bgView)
        bgView.backgroundColor = kWhiteColor
        
        bgView.addSubview(videoImgView)
        videoImgView.addSubview(userImgView)
        videoImgView.addSubview(nameLab)
        videoImgView.addSubview(categoryNameLab)
        
        bgView.addSubview(desLab)
        bgView.addSubview(zanView)
        bgView.addSubview(conmentView)
        bgView.addSubview(sharedView)
        
        contentView.addSubview(cancleImgView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(kMargin)
        }
        videoImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
            make.height.equalTo((kScreenWidth - 20) * 0.45)
        }
        
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(5)
            make.centerY.height.equalTo(userImgView)
            make.right.equalTo(categoryNameLab).offset(-kMargin)
        }
        categoryNameLab.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(userImgView)
            make.width.equalTo(kTitleHeight)
            make.height.equalTo(20)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(videoImgView)
            make.top.equalTo(videoImgView.snp.bottom).offset(kMargin)
            make.right.equalTo(zanView.snp.left).offset(-kMargin)
            make.bottom.equalTo(-kMargin)
        }
        zanView.snp.makeConstraints { (make) in
            make.centerY.width.height.equalTo(sharedView)
            make.right.equalTo(conmentView.snp.left).offset(-5)
        }
        conmentView.snp.makeConstraints { (make) in
            make.centerY.width.height.equalTo(sharedView)
            make.right.equalTo(sharedView.snp.left).offset(-5)
        }
        sharedView.snp.makeConstraints { (make) in
            make.right.equalTo(videoImgView)
            make.centerY.equalTo(desLab)
            make.height.equalTo(34)
            make.width.equalTo(30)
        }
        cancleImgView.snp.makeConstraints { (make) in
            make.right.equalTo(videoImgView)
            make.bottom.equalTo(-5)
            make.top.equalTo(sharedView.snp.bottom).offset(5)
            make.size.equalTo(CGSize.init(width: 20, height: 13))
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 图片
    lazy var videoImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = kCornerRadius
        
        return imgView
    }()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 12
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.text = "小胖子"
        
        return lab
    }()
    
    /// 分类名称
    lazy var categoryNameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kWhiteColor
        lab.font = k13Font
        lab.text = "音乐"
        lab.backgroundColor = kBlackFontColor
        lab.cornerRadius = 3
        lab.textAlignment = .center
        
        return lab
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k15Font
        lab.numberOfLines = 0
        lab.text = "佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识"
        
        return lab
    }()
    /// 赞
    lazy var zanView: TAImgAndTxtBtnView = {
       
        let view = TAImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_video_zan")
        view.menuTitle.text = "266"
        
        return view
        
    }()
    /// 评论
    lazy var conmentView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_video_conment")
        view.menuTitle.text = "789"
        
        return view
        
    }()
    /// 分享
    lazy var sharedView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_video_shared")
        view.menuTitle.text = "266"
        
        return view
        
    }()
    
    /// 取消按钮
    lazy var cancleImgView : UIImageView = UIImageView.init(image: UIImage.init(named: "icon_video_cancle"))
}
