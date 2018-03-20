//
//  TAAblumDetailCell.swift
//  TuAi
//  相册详情 cell
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAblumDetailCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(ablumImgView)
        ablumImgView.addSubview(checkBtn)
        
        ablumImgView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(0)
        }
        checkBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
    }
    
    /// 图片
    lazy var ablumImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = kCornerRadius
        
        return imgView
    }()
    
    /// 选择框
    lazy var checkBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "icon_check_circle"), for: .normal)
        btn.setImage(UIImage.init(named: "icon_check_circle_selected"), for: .selected)
        
        return btn
    }()
}
