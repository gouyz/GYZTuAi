//
//  TAForgetPwdVC.swift
//  TuAi
//  忘记密码 、注册
//  Created by gouyz on 2018/3/9.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

class TAForgetPwdVC: GYZBaseWhiteNavVC {
    
    ///是否为注册
    var isRegister: Bool = true
    ///记录获取的验证码
    var codeStr: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        if isRegister {
            self.navigationItem.title = "注册"
            okBtn.setTitle("注 册", for: .normal)
        } else {
            self.navigationItem.title = "忘记密码"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 创建UI
    fileprivate func setupUI(){
        
        view.addSubview(phoneInputView)
        view.addSubview(lineView)
        view.addSubview(bgView)
        bgView.addSubview(codeInputView)
        bgView.addSubview(codeBtn)
        bgView.addSubview(lineView1)
        view.addSubview(pwdInputView)
        view.addSubview(lineView2)
        view.addSubview(okBtn)
        
        phoneInputView.snp.makeConstraints { (make) in
            make.top.equalTo(20 + kTitleAndStateHeight)
            make.left.right.equalTo(view)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(phoneInputView.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.equalTo(phoneInputView)
            make.height.equalTo(phoneInputView)
        }
        codeInputView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(codeBtn.snp.left).offset(-kMargin)
            make.bottom.equalTo(lineView1.snp.top)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.bottom.equalTo(bgView)
            make.height.equalTo(lineView)
        }
        codeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-kMargin)
            make.size.equalTo(CGSize.init(width: 100, height: 30))
        }
        pwdInputView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.bottom)
            make.left.right.equalTo(phoneInputView)
            make.height.equalTo(phoneInputView)
        }
        lineView2.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.top.equalTo(pwdInputView.snp.bottom)
            make.height.equalTo(lineView)
        }
        
        okBtn.snp.makeConstraints { (make) in
            make.top.equalTo(lineView2.snp.bottom).offset(30)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(kUIButtonHeight)
        }
        
    }
    /// 手机号
    fileprivate lazy var phoneInputView : GYZLoginInputView = GYZLoginInputView(iconName: "icon_login_phone", placeHolder: "请输入手机号码", isPhone: true)
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 验证码
    fileprivate lazy var codeInputView : GYZLoginInputView = GYZLoginInputView(iconName: "icon_login_code", placeHolder: "请输入验证码", isPhone: true)
    
    /// 分割线2
    fileprivate lazy var lineView1 : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    fileprivate lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 密码
    fileprivate lazy var pwdInputView : GYZLoginInputView = GYZLoginInputView(iconName: "icon_login_pwd", placeHolder: "请设置密码，6-20位数字、英文", isPhone: false)
    
    /// 分割线3
    fileprivate lazy var lineView2 : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 获取验证码按钮
    fileprivate lazy var codeBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("发送验证码", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k14Font
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = kBtnClickBGColor
        btn.addTarget(self, action: #selector(clickedCodeBtn(btn:)), for: .touchUpInside)
        
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    
    /// 确定按钮
    fileprivate lazy var okBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("确 定", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedOkBtn(btn:)), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    
    
    /// 忘记密码
    @objc func clickedOkBtn(btn: UIButton){
        hiddenKeyBoard()
        
        if !validPhoneNO() {
            return
        }
        if codeInputView.textFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入验证码")
            return
        }
        
//        if pwdInputView.textFiled.text!.isEmpty {
//            MBProgressHUD.showAutoDismissHUD(message: "请输入密码")
//            return
//        }else if (pwdInputView.textFiled.text?.count < 6 || pwdInputView.textFiled.text?.count > 15){
//            MBProgressHUD.showAutoDismissHUD(message: "请输入6-15位密码")
//            return
//        }
        
//        if isRegister {
//            requestRegister()
//        }else{
//            requestUpdatePwd()
//        }
        
    }
    /// 判断手机号是否有效
    ///
    /// - Returns:
    func validPhoneNO() -> Bool{
        
        if phoneInputView.textFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入手机号")
            return false
        }
        if phoneInputView.textFiled.text!.isMobileNumber(){
            return true
        }else{
            MBProgressHUD.showAutoDismissHUD(message: "请输入正确的手机号")
            return false
        }
        
    }
    /// 获取验证码
    @objc func clickedCodeBtn(btn: UIButton){
        hiddenKeyBoard()
        
        if validPhoneNO() {
            requestCode()
        }
    }
    
    /// 找回密码
//    func requestUpdatePwd(){
//
//        weak var weakSelf = self
//        createHUD(message: "加载中...")
//
//        GYZNetWork.requestNetwork("app/editPassword.do", parameters: ["phone":phoneInputView.textFiled.text!,"password": pwdInputView.textFiled.text!,"code":codeInputView.textFiled.text!],  success: { (response) in
//
//            weakSelf?.hud?.hide(animated: true)
//            GYZLog(response)
//            if response["code"].intValue == kQuestSuccessTag{//请求成功
//
//                _ = weakSelf?.navigationController?.popViewController(animated: true)
//            }else{
//                MBProgressHUD.showAutoDismissHUD(message: response["message"].stringValue)
//            }
//
//        }, failture: { (error) in
//            weakSelf?.hud?.hide(animated: true)
//            GYZLog(error)
//        })
//    }
    
    /// 隐藏键盘
    func hiddenKeyBoard(){
        phoneInputView.textFiled.resignFirstResponder()
        pwdInputView.textFiled.resignFirstResponder()
        codeInputView.textFiled.resignFirstResponder()
    }
    
    ///获取验证码
    func requestCode(){
        
        weak var weakSelf = self
        createHUD(message: "获取中...")
        
        GYZNetWork.requestNetwork("app/generateCode.do", parameters: ["phone":phoneInputView.textFiled.text!],  success: { (response) in
            
            weakSelf?.hud?.hide(animated: true)
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                weakSelf?.codeBtn.startSMSWithDuration(duration: 60)
                
            }else{
                MBProgressHUD.showAutoDismissHUD(message: response["message"].stringValue)
            }
            
        }, failture: { (error) in
            weakSelf?.hud?.hide(animated: true)
            GYZLog(error)
        })
    }
}
