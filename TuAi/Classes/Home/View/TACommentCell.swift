//
//  TACommentCell.swift
//  TuAi
//  论坛cell
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACommentCell: UITableViewCell {

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
        bgView.addSubview(userView)
        bgView.addSubview(conmentView)
        bgView.addSubview(favoriteView)
        bgView.addSubview(timeView)
        bgView.addSubview(cancleImgView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(kMargin)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
        }
        imgViews.snp.makeConstraints { (make) in
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.left.right.equalTo(contentLab)
            make.height.equalTo(0)
        }
        
        userView.snp.makeConstraints { (make) in
            make.left.equalTo(contentLab)
            make.top.equalTo(imgViews.snp.bottom)
            make.width.equalTo(65)
            make.height.equalTo(kTitleHeight)
            make.bottom.equalTo(bgView)
        }
        conmentView.snp.makeConstraints { (make) in
            make.left.equalTo(userView.snp.right).offset(5)
            make.width.height.top.equalTo(userView)
        }
        timeView.snp.makeConstraints { (make) in
            make.left.equalTo(conmentView.snp.right).offset(5)
            make.width.height.top.equalTo(userView)
        }
        
        favoriteView.snp.makeConstraints { (make) in
            make.left.equalTo(timeView.snp.right).offset(5)
            make.width.height.top.equalTo(userView)
        }
        
        cancleImgView.snp.makeConstraints { (make) in
            make.right.equalTo(contentLab)
            make.centerY.equalTo(userView)
            make.size.equalTo(CGSize.init(width: 20, height: 13))
        }
    }
    
    lazy var bgView : UIView = UIView()
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.numberOfLines = 0
        lab.text = "聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯，聊聊什么是让孩子受益终身的行为习惯"
        
        return lab
    }()
    
    /// 九宫格图片显示
    lazy var imgViews: GYZPhotoView = GYZPhotoView()
    
    lazy var userView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.backgroundColor = kBackgroundColor
        view.menuImg.cornerRadius = 10
//        view.menuImg.image = UIImage.init(named: "icon_video_zan")
        view.menuTitle.text = "小胖子"
        
        return view
        
    }()
    /// 评论
    lazy var conmentView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_conment_gray")
        view.menuTitle.text = "2018"
        
        return view
        
    }()
    /// 时间
    lazy var timeView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_conment_time")
        view.menuTitle.text = "15分钟前"
        
        return view
        
    }()
    /// 收藏
    lazy var favoriteView: GYZImgLeftAndTxtRightView = {
        
        let view = GYZImgLeftAndTxtRightView()
        view.menuImg.image = UIImage.init(named: "icon_conment_favourite")
        view.menuTitle.text = "3333"
        
        return view
        
    }()
    
    /// 取消按钮
    lazy var cancleImgView : UIImageView = UIImageView.init(image: UIImage.init(named: "icon_video_cancle"))
}
