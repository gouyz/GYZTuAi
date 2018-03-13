//
//  TAModifyFontVC.swift
//  TuAi
//  修改字体大小
//  Created by gouyz on 2018/3/13.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAModifyFontVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "字体大小"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(desLab)
        view.addSubview(lineView)
        view.addSubview(circleView1)
        view.addSubview(circleView2)
        view.addSubview(circleView3)
        view.addSubview(circleView4)
        view.addSubview(iconView)
        view.addSubview(minFontLab)
        view.addSubview(maxFontLab)
        
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kTitleAndStateHeight * 2)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize.init(width: 240, height: klineDoubleWidth))
            make.top.equalTo(desLab.snp.bottom).offset(kTitleHeight)
        }
        circleView1.snp.makeConstraints { (make) in
            make.centerY.equalTo(lineView)
            make.left.equalTo(lineView)
            make.size.equalTo(CGSize.init(width: 10, height: 10))
        }
        circleView2.snp.makeConstraints { (make) in
            make.left.equalTo(lineView).offset(80)
            make.centerY.size.equalTo(circleView1)
        }
        circleView3.snp.makeConstraints { (make) in
            make.left.equalTo(lineView).offset(160)
            make.centerY.size.equalTo(circleView1)
        }
        circleView4.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp.right)
            make.centerY.size.equalTo(circleView1)
        }
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(lineView).offset(0)
            make.centerY.equalTo(lineView)
            make.size.equalTo(CGSize.init(width: 16, height: 16))
        }
        minFontLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(circleView1)
            make.top.equalTo(circleView1.snp.bottom).offset(kMargin)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        maxFontLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(circleView4)
            make.top.width.height.equalTo(minFontLab)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.font = k12Font
        lab.textColor = kHeightGaryFontColor
        lab.text = "字体大小预览"
        lab.textAlignment = .center
        
        return lab
    }()
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    
    ///
    lazy var circleView1 : UIView = {
        let circle = UIView()
        circle.backgroundColor = kGrayLineColor
        circle.cornerRadius = kCornerRadius
        circle.tag = 101
        circle.addOnClickListener(target: self, action: #selector(onClickFont(sender:)))
        
        return circle
    }()
    /// 小
    lazy var minFontLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kHeightGaryFontColor
        lab.text = "小"
        lab.textAlignment = .center
        
        return lab
    }()
    ///
    lazy var circleView2 : UIView = {
        let circle = UIView()
        circle.backgroundColor = kGrayLineColor
        circle.cornerRadius = kCornerRadius
        circle.tag = 102
        circle.addOnClickListener(target: self, action: #selector(onClickFont(sender:)))
        
        return circle
    }()
    ///
    lazy var circleView3 : UIView = {
        let circle = UIView()
        circle.backgroundColor = kGrayLineColor
        circle.cornerRadius = kCornerRadius
        circle.tag = 103
        circle.addOnClickListener(target: self, action: #selector(onClickFont(sender:)))
        
        return circle
    }()
    ///
    lazy var circleView4 : UIView = {
        let circle = UIView()
        circle.backgroundColor = kGrayLineColor
        circle.cornerRadius = kCornerRadius
        circle.tag = 104
        circle.addOnClickListener(target: self, action: #selector(onClickFont(sender:)))
        
        return circle
    }()
    /// 大
    lazy var maxFontLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kHeightGaryFontColor
        lab.text = "大"
        lab.textAlignment = .center
        
        return lab
    }()
    
    /// 图标
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_font_selected"))
    
    @objc func onClickFont(sender: UITapGestureRecognizer){
        let tag = sender.view?.tag
        
        var offsetX = 0
        
        switch tag! {
        case 102:
            offsetX = 80
        case 103:
            offsetX = 160
        case 104:
            offsetX = 240
            
        default:
            offsetX = 0
        }
        
        iconView.snp.updateConstraints { (make) in
            make.left.equalTo(lineView).offset(offsetX)
        }
        kModifyFontSize = CGFloat(tag! - 100)
        desLab.font = setFontSize(defaultSize: 12)
    }
}
