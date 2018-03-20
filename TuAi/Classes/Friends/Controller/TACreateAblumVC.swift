//
//  TACreateAblumVC.swift
//  TuAi
//  创建相册
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACreateAblumVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "新建相册"
        
        view.addSubview(bgView)
        bgView.addSubview(nameTxtFiled)
        bgView.addSubview(lineView1)
        bgView.addSubview(desLab)
        bgView.addSubview(rightIconView)
        bgView.addSubview(lineView2)
        bgView.addSubview(finishedBtn)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(kMargin + kTitleAndStateHeight)
        }
        nameTxtFiled.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kMargin)
            make.height.equalTo(kTitleHeight)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgView)
            make.top.equalTo(nameTxtFiled.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        desLab.snp.makeConstraints { (make) in
            make.top.equalTo(lineView1.snp.bottom)
            make.right.equalTo(rightIconView.snp.left)
            make.left.height.equalTo(nameTxtFiled)
        }
        rightIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(desLab)
            make.right.equalTo(-kMargin)
            make.size.equalTo(CGSize.init(width: 8, height: 13))
        }
        lineView2.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(lineView1)
            make.top.equalTo(desLab.snp.bottom)
        }
        
        finishedBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameTxtFiled)
            make.top.equalTo(lineView2.snp.bottom).offset(kTitleHeight)
            make.height.equalTo(kTitleHeight)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = kWhiteColor
        
        return bgView
    }()
    /// 名称输入框
    lazy var nameTxtFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.placeholder = "填写相册名称"
        
        return textFiled
    }()
    lazy var lineView1: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
    
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.text = "权限"
        lab.addOnClickListener(target: self, action: #selector(onClickedPower))
        
        return lab
    }()
    /// 右侧箭头图标
    lazy var rightIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_right_gray"))
    
    lazy var lineView2: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
    
    /// 完成
    lazy var finishedBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("完 成", for: .normal)
        btn.addTarget(self, action: #selector(clickedFinishedBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    
    /// 完成
    @objc func clickedFinishedBtn(){
    }
    
    /// 权限选择
    @objc func onClickedPower(){
        GYZAlertViewTools.alertViewTools.showSheet(title: "选择权限", message: nil, cancleTitle: "取消", titleArray: ["公开","仅自己可见","仅朋友可见"], viewController: self) { [weak self](index) in
            
//            if index == 0{//拍照
//                self?.openCamera()
//            }else if index == 1 {//从相册选取
//                self?.openPhotos()
//            }
        }
    }
}
