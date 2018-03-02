//
//  TAHomeNavigationView.swift
//  TuAi
//  首页导航View
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAHomeNavigationView: UIView {
    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(cityBtn)
        addSubview(searchBtn)
        addSubview(commentImgView)
        
        cityBtn.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(80)
        }
        searchBtn.snp.makeConstraints { (make) in
            make.left.equalTo(cityBtn.snp.right).offset(kMargin)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
            make.right.equalTo(commentImgView.snp.left).offset(-15)
        }
        commentImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize.init(width: 18, height: 16))
        }
        
        cityBtn.set(image: UIImage.init(named: "icon_home_arrow_down"), title: "常州市", titlePosition: .left, additionalSpacing: 5, state: .normal)
        
        searchBtn.set(image: UIImage.init(named: "icon_home_search"), title: "请输入您搜索的内容", titlePosition: .right, additionalSpacing: 5, state: .normal)
    }
    /// 城市
    lazy var cityBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.titleLabel?.font = k13Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.tag = 101
        btn.addTarget(self, action: #selector(clickedOperateBtn(btn:)), for: .touchUpInside)
        return btn
    }()
    /// 搜索
    lazy var searchBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.titleLabel?.font = k13Font
        btn.setTitleColor(kBlueFontColor, for: .normal)
        btn.backgroundColor = kWhiteColor
        btn.cornerRadius = 8
        btn.tag = 101
        btn.addTarget(self, action: #selector(clickedOperateBtn(btn:)), for: .touchUpInside)
        return btn
    }()
    /// 消息
    lazy var commentImgView : UIImageView = UIImageView.init(image: UIImage.init(named: "icon_home_comment"))
    
    ///操作
    @objc func clickedOperateBtn(btn : UIButton){
        
        
    }
}
