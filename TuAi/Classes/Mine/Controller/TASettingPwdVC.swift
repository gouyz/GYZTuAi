//
//  TASettingPwdVC.swift
//  TuAi
//  设置密码
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASettingPwdVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "设置密码"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(desLab)
        view.addSubview(pwdFiled)
        view.addSubview(lineView)
        view.addSubview(confirmPwdFiled)
        view.addSubview(lineView1)
        view.addSubview(okBtn)
        
        desLab.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight + kMargin)
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        pwdFiled.snp.makeConstraints { (make) in
            make.left.right.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom).offset(30)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(pwdFiled)
            make.top.equalTo(pwdFiled.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        confirmPwdFiled.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(pwdFiled)
            make.top.equalTo(lineView.snp.bottom).offset(5)
            
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(lineView)
            make.top.equalTo(confirmPwdFiled.snp.bottom)
        }
        
        okBtn.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(lineView1.snp.bottom).offset(kTitleHeight)
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
        lab.text = "设置密码后，可使用（手机号+密码）或（昵称+密码）的方式登录"
        
        return lab
    }()
    /// 输入框
    lazy var pwdFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.keyboardType = .default
        textFiled.isSecureTextEntry = true
        textFiled.placeholder = "输入新密码，6-20位数字、英文"
        
        return textFiled
    }()
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 输入框
    lazy var confirmPwdFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.keyboardType = .default
        textFiled.isSecureTextEntry = true
        textFiled.placeholder = "再次输入新密码，6-20位数字、英文"
        
        return textFiled
    }()
    /// 分割线
    fileprivate lazy var lineView1 : UIView = {
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
