//
//  TAFriendsHeaderView.swift
//  TuAi
//  朋友header
//  Created by gouyz on 2018/3/13.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFriendsHeaderView: UIView {

    // MARK: 生命周期方法
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.addSubview(bgView)
        bgView.addSubview(bgHeaderView)
        bgView.addSubview(userHeaderView)
        bgView.addSubview(nameLab)
        bgView.addSubview(dongTaiView)
        bgView.addSubview(friendsGroupView)
        bgView.addSubview(ablumView)
        bgView.addSubview(lineView)
        
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        bgHeaderView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(bgView)
            make.bottom.equalTo(-80)
        }
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(bgHeaderView.snp.bottom).offset(-20)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(userHeaderView.snp.bottom)
            make.right.equalTo(userHeaderView)
            make.height.equalTo(30)
        }
        dongTaiView.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(30)
            make.top.equalTo(bgHeaderView.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        
        friendsGroupView.snp.makeConstraints { (make) in
            make.top.size.equalTo(dongTaiView)
            make.left.equalTo(dongTaiView.snp.right).offset(kMargin)
        }
        ablumView.snp.makeConstraints { (make) in
            make.top.size.equalTo(dongTaiView)
            make.left.equalTo(friendsGroupView.snp.right).offset(kMargin)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(bgView)
            make.height.equalTo(klineWidth)
        }
    }
    
    /// 背景
    fileprivate lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        
        return view
    }()
    
    /// 背景 图片
    lazy var bgHeaderView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_friends_header_bg"))
    /// 用户头像 图片
    lazy var userHeaderView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.textAlignment = .center
        lab.text = "小胖子"
        
        return lab
    }()
    /// 动态
    lazy var dongTaiView: TAImgAndTxtBtnView = {
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 40, height: 40)
        view.menuImg.image = UIImage.init(named: "icon_friends_dynamic")
        view.menuTitle.text = "动态"
        
        return view
    }()
    /// 亲友团
    lazy var friendsGroupView: TAImgAndTxtBtnView = {
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 40, height: 40)
        view.menuImg.image = UIImage.init(named: "icon_friends_group")
        view.menuTitle.text = "亲友团"
        
        return view
    }()
    /// 相册
    lazy var ablumView: TAImgAndTxtBtnView = {
        let view = TAImgAndTxtBtnView()
        view.imgSize = CGSize.init(width: 40, height: 40)
        view.menuImg.image = UIImage.init(named: "icon_friends_ablum")
        view.menuTitle.text = "相册"
        
        return view
    }()
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
}
