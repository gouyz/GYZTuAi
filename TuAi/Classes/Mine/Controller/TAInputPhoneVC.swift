//
//  TAInputPhoneVC.swift
//  TuAi
//  请输入新手机号
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAInputPhoneVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "请输入新手机号"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(desLab)
        view.addSubview(phoneFiled)
        view.addSubview(lineView)
        view.addSubview(okBtn)
        
        desLab.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight + kMargin)
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        phoneFiled.snp.makeConstraints { (make) in
            make.left.right.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom).offset(30)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(phoneFiled)
            make.top.equalTo(phoneFiled.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        
        okBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(lineView.snp.bottom).offset(kTitleHeight)
            make.height.equalTo(kTitleHeight)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kGaryFontColor
        lab.numberOfLines = 2
        lab.text = "您的账号目前绑定的手机号是138111111111，请输入您希望绑定的手机号。"
        
        return lab
    }()
    /// 输入框
    lazy var phoneFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.keyboardType = .numberPad
        textFiled.placeholder = "输入新手机号"
        
        return textFiled
    }()
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    
    /// 确 定按钮
    fileprivate lazy var okBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("确 定", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedOKBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    /// 确 定
    @objc func clickedOKBtn(){
        
    }
}
