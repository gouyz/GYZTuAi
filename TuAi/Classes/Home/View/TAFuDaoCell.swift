//
//  TAFuDaoCell.swift
//  TuAi
//  辅导cell
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAFuDaoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(conmentImgView)
        addSubview(nameLab)
        addSubview(cateNameLab)
        addSubview(iconImgView)
        addSubview(numberLab)
        
        conmentImgView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalTo(self)
            make.height.equalTo(100)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(conmentImgView)
            make.top.equalTo(conmentImgView.snp.bottom)
            make.height.equalTo(30)
        }
        cateNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab)
            make.height.equalTo(20)
            make.top.equalTo(nameLab.snp.bottom)
            make.right.equalTo(iconImgView.snp.left)
        }
        iconImgView.snp.makeConstraints { (make) in
            make.centerY.equalTo(numberLab)
            make.right.equalTo(numberLab.snp.left)
            make.size.equalTo(CGSize.init(width: 17, height: 16))
        }
        numberLab.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.height.equalTo(cateNameLab)
            make.width.equalTo(60)
        }
    }
    
    /// 图片
    lazy var conmentImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kBackgroundColor
        imgView.cornerRadius = kCornerRadius
        
        return imgView
    }()
    /// 标题
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "知行教育"
        
        return lab
    }()
    /// 类别名称
    lazy var cateNameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "初中语文"
        
        return lab
    }()
    ///浏览次数图标
    lazy var iconImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_eyes"))
    /// 浏览次数
    lazy var numberLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.textAlignment = .center
        lab.text = "22.5万次"
        
        return lab
    }()
}
