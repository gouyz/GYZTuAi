//
//  TAHomeVideoDetailInfoCell.swift
//  TuAi
//  视频详情 信息cell
//  Created by gouyz on 2018/3/22.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAHomeVideoDetailInfoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(contentLab)
        contentView.addSubview(dateLab)
        contentView.addSubview(playNumberLab)
        contentView.addSubview(tagsView)
        contentView.addSubview(zanView)
        contentView.addSubview(favouriteView)
        contentView.addSubview(conmentView)
        contentView.addSubview(sharedView)
        
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
        }
        dateLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentLab)
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        
        playNumberLab.snp.makeConstraints { (make) in
            make.left.equalTo(dateLab.snp.right).offset(kMargin)
            make.top.height.equalTo(dateLab)
            make.right.equalTo(contentLab)
        }
        tagsView.snp.makeConstraints { (make) in
            make.top.equalTo(dateLab.snp.bottom)
            make.left.right.equalTo(contentLab)
            make.height.equalTo(0)
            make.bottom.equalTo(zanView.snp.top).offset(-kMargin)
        }
        zanView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-kMargin)
            make.width.equalTo(favouriteView)
            make.left.equalTo(20)
            make.height.equalTo(kTitleHeight)
        }
        favouriteView.snp.makeConstraints { (make) in
            make.bottom.height.equalTo(zanView)
            make.left.equalTo(zanView.snp.right).offset(20)
            make.width.equalTo(conmentView)
        }
        conmentView.snp.makeConstraints { (make) in
            make.bottom.height.equalTo(zanView)
            make.left.equalTo(favouriteView.snp.right).offset(20)
            make.width.equalTo(sharedView)
        }
        sharedView.snp.makeConstraints { (make) in
            
            make.bottom.height.equalTo(zanView)
            make.left.equalTo(conmentView.snp.right).offset(20)
            make.right.equalTo(-20)
            make.width.equalTo(zanView)
        }
    }
    
    /// 日期
    lazy var dateLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "发布：2018-03-20"
        
        return lab
    }()
    
    /// 播放次数
    lazy var playNumberLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "播放：6666666"
        
        return lab
    }()
    /// 描述
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k14Font
        lab.numberOfLines = 0
        lab.text = "佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识佩琪教你生活小知识"
        
        return lab
    }()
    /// 标签 类型
    var tagsView: HXTagsView = {
        
        let view = HXTagsView()
        view.tagAttribute.borderColor = kGrayLineColor
        view.tagAttribute.normalBackgroundColor = kWhiteColor
        view.tagAttribute.selectedBackgroundColor = kWhiteColor
        view.tagAttribute.textColor = kGaryFontColor
        view.tagAttribute.selectedTextColor = kGaryFontColor
        view.tagAttribute.cornerRadius = 8
        view.backgroundColor = kWhiteColor
        /// 显示多行
        view.layout.scrollDirection = .vertical
        
        return view
    }()
    /// 赞
    lazy var zanView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_video_zan")
        view.imgSize = CGSize.init(width: 30, height: 27)
        view.menuTitle.text = "266"
        
        return view
        
    }()
    /// 收藏
    lazy var favouriteView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 30, height: 27)
        view.menuImg.image = UIImage.init(named: "icon_video_favourite")
        view.menuTitle.text = "989"
        
        return view
        
    }()
    /// 评论
    lazy var conmentView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 30, height: 27)
        view.menuImg.image = UIImage.init(named: "icon_video_conment")
        view.menuTitle.text = "789"
        
        return view
        
    }()
    /// 分享
    lazy var sharedView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 30, height: 27)
        view.menuImg.image = UIImage.init(named: "icon_video_shared")
        view.menuTitle.text = "266"
        
        return view
        
    }()
}
