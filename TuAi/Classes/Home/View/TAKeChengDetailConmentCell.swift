//
//  TAKeChengDetailConmentCell.swift
//  TuAi
//  课程详情 评论cell
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAKeChengDetailConmentCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kWhiteColor
        
        contentView.addSubview(userImgView)
        contentView.addSubview(nameLab)
        contentView.addSubview(zanLab)
        contentView.addSubview(timeLab)
        contentView.addSubview(zanBtn)
        contentView.addSubview(contentLab)
        contentView.addSubview(bgView)
        bgView.addSubview(replayLab)
        
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.top.equalTo(userImgView)
            make.height.equalTo(20)
            make.right.equalTo(zanLab.snp.left).offset(-5)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
        }
        zanLab.snp.makeConstraints { (make) in
            make.right.equalTo(zanBtn.snp.left).offset(-5)
            make.centerY.height.equalTo(zanBtn)
            make.width.equalTo(60)
        }
        zanBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.top.equalTo(nameLab)
            make.size.equalTo(CGSize.init(width: 24, height: 20))
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab)
            make.right.equalTo(-30)
            make.top.equalTo(timeLab.snp.bottom).offset(kMargin)
        }
        bgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentLab)
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.bottom.equalTo(-kMargin)
        }
        replayLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
    }
    
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 15
        
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
        lab.text = "2018年01月25日"
        
        return lab
    }()
    /// 评论内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        lab.text = "我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢"
        
        return lab
    }()
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.borderColor = kGrayLineColor
        view.borderWidth = klineDoubleWidth
        
        return view
    }()
    /// 回复内容
    lazy var replayLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        
        return lab
    }()
    /// 点赞数量
    lazy var zanLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "588"
        lab.textAlignment = .right
        
        return lab
    }()
    /// zan
    lazy var zanBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setBackgroundImage(UIImage.init(named: "icon_video_zan"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "icon_video_zan_selected"), for: .selected)
        
        return btn
    }()
}
