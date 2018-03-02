//
//  TAJingHuaItemView.swift
//  TuAi
//  首页 精华item view
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAJingHuaItemView: UIView {
    
    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(conmentImgView)
        addSubview(nameLab)
        addSubview(desLab)
        addSubview(teacherNameLab)
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
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.height.equalTo(20)
            make.top.equalTo(nameLab.snp.bottom)
        }
        teacherNameLab.snp.makeConstraints { (make) in
            make.left.height.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom)
            make.right.equalTo(iconImgView.snp.left)
        }
        iconImgView.snp.makeConstraints { (make) in
            make.centerY.equalTo(numberLab)
            make.right.equalTo(numberLab.snp.left)
            make.size.equalTo(CGSize.init(width: 17, height: 16))
        }
        numberLab.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.height.equalTo(teacherNameLab)
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
        lab.text = "小猪佩琪"
        
        return lab
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "佩琪教你生活小知识"
        
        return lab
    }()
    /// 老师名称
    lazy var teacherNameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "丽丽老师"
        
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
