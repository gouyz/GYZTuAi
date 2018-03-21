//
//  TAFuDaoHeaderView.swift
//  TuAi
//  辅导等模块的header
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFuDaoHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(adsImgView)
        addSubview(tagsView)
        addSubview(cateIconView)
        
        adsImgView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(tagsView.snp.top)
        }
        tagsView.snp.makeConstraints { (make) in
            make.left.right.equalTo(adsImgView)
            make.height.equalTo(0)
            make.bottom.equalTo(cateIconView.snp.top).offset(-5)
        }
        cateIconView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.bottom.equalTo(-5)
            make.height.equalTo(18)
            make.width.equalTo(20)
        }
    }
    
    /// 广告轮播图
    lazy var adsImgView: ZCycleView = {
        let adsView = ZCycleView()
        adsView.setImagesGroup([#imageLiteral(resourceName: "icon_home_header_bg"),#imageLiteral(resourceName: "icon_home_header_bg"),#imageLiteral(resourceName: "icon_home_header_bg")])
        adsView.pageControlAlignment = .right
        adsView.pageControlIndictirColor = kWhiteColor
        adsView.pageControlCurrentIndictirColor = kNavBarColor
        adsView.scrollDirection = .horizontal
        
        return adsView
    }()
    /// 标签 类型
    var tagsView: HXTagsView = {
        
        let view = HXTagsView()
        view.tagAttribute.borderColor = kNavBarColor
        view.tagAttribute.normalBackgroundColor = kWhiteColor
        view.tagAttribute.selectedBackgroundColor = kNavBarColor
        view.tagAttribute.textColor = kBlueFontColor
        view.tagAttribute.selectedTextColor = kWhiteColor
        view.tagAttribute.cornerRadius = kCornerRadius
        /// 显示多行
        view.layout.scrollDirection = .vertical
        view.backgroundColor = kWhiteColor
        
        return view
    }()
    /// 筛选
    lazy var cateIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_category"))
}
