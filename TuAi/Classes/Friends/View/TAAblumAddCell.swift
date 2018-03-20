//
//  TAAblumAddCell.swift
//  TuAi
//  创建相册 新增cell
//  Created by gouyz on 2018/3/20.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAAblumAddCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(bgView)
        bgView.addSubview(addImgView)
        bgView.addSubview(nameLab)
        
        bgView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(-30)
        }
        addImgView.snp.makeConstraints { (make) in
            
            make.center.equalTo(bgView)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgView)
            make.top.equalTo(addImgView.snp.bottom)
            make.height.equalTo(30)
        }
    }
    
    ///
    lazy var bgView : UIView = {
        let view = UIView()
        view.cornerRadius = kCornerRadius
        view.borderColor = kBlueFontColor
        view.borderWidth = klineDoubleWidth
        
        return view
    }()
    /// 图片
    lazy var addImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_ablum_add")
        
        return imgView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k14Font
        lab.textAlignment = .center
        lab.text = "创建相册"
        
        return lab
    }()
}
