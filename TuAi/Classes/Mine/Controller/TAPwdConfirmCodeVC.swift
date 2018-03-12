//
//  TAPwdConfirmCodeVC.swift
//  TuAi
//  修改密码输入验证码
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import HcdSpecialField

class TAPwdConfirmCodeVC: GYZBaseWhiteNavVC {
    
    /// 是否是修改密码
    var isPwdCode: Bool = true
    /// 描述内容
    var mDesContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        if isPwdCode {
            mDesContent = "短信验证码已发送至138****1111请注意查收"
            self.navigationItem.title = "请输入验证码"
        }else{
            mDesContent = "邮箱验证码已发送至138****1111@qq.com请注意查收"
            self.navigationItem.title = "请输入邮箱验证码"
        }
        
        view.addSubview(desLab)
        view.addSubview(specialField)
        view.addSubview(okBtn)
        view.addSubview(codeBtn)
        
        desLab.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight + kMargin)
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        specialField.snp.makeConstraints { (make) in
            make.top.equalTo(desLab.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.height.equalTo(kTitleHeight)
            make.width.equalTo(CGFloat(specialField.numberOfDigits) * (kTitleHeight + specialField.spaceBetweenDigits))
        }
        okBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(specialField)
            make.top.equalTo(specialField.snp.bottom).offset(kTitleHeight)
            make.height.equalTo(kTitleHeight)
        }
        codeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(okBtn.snp.bottom).offset(kMargin)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        specialField.addTarget(self, action: #selector(specialFieldDidChangeValue), for: .valueChanged)
        desLab.text = mDesContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kGaryFontColor
        lab.textAlignment = .center
        lab.numberOfLines = 2
        
        return lab
    }()
    ///验证码
    lazy var specialField: HcdSpecialField = {
        
        let field = HcdSpecialField()
        field.backColor = kWhiteColor
        field.dashBackColor = kWhiteColor
        field.textColor = kBlackFontColor
//        field.spaceBetweenDigits = 5
        
        return field
    }()

    /// 获取验证码按钮
    fileprivate lazy var codeBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("60s后可重新获取", for: .normal)
        btn.setTitleColor(kHeightGaryFontColor, for: .normal)
        btn.titleLabel?.font = k14Font
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(clickedCodeBtn), for: .touchUpInside)
        
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    
    /// 完成按钮
    fileprivate lazy var okBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("完 成", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedFinishedBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    /// 完成
    @objc func clickedFinishedBtn(){
        if isPwdCode {
            let pwdVC = TASettingPwdVC()
            self.navigationController?.pushViewController(pwdVC, animated: true)
        }
    }
    
    /// 重新获取验证码
    @objc func clickedCodeBtn(){
        
    }
    
    /// 验证码输入监听事件
    @objc func specialFieldDidChangeValue() {
        if self.specialField.passcode.count == self.specialField.numberOfDigits {
            
            specialField.resignFirstResponder()
            
        }
    }

}
