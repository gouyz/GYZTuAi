//
//  TAInputEmailVC.swift
//  TuAi
//  输入邮箱账号
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAInputEmailVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "输入邮箱账号"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(emailFiled)
        view.addSubview(lineView)
        view.addSubview(okBtn)
        
        emailFiled.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight + kTitleHeight)
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(emailFiled)
            make.top.equalTo(emailFiled.snp.bottom)
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
    /// 输入框
    lazy var emailFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.keyboardType = .default
        textFiled.placeholder = "输入邮箱账号"
        
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
        btn.setTitle("发送验证码", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedOKBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    /// 确 定
    @objc func clickedOKBtn(){
        let emailVC = TAPwdConfirmCodeVC()
        emailVC.isPwdCode = false
        self.navigationController?.pushViewController(emailVC, animated: true)
    }
}
