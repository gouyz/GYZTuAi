//
//  GYZLoginVC.swift
//  baking
//  登录 控制器
//  Created by gouyz on 2016/12/1.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBProgressHUD

class GYZLoginVC: GYZBaseVC {
    
    /// 输入手机号码是否合法
    var validPhone : Bool = false
    /// 密码是否合法
    var validPwd : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kWhiteColor
        self.title = "登  录"
    
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 创建UI
    fileprivate func setupUI(){
        
        view.addSubview(phoneInputView)
        view.addSubview(lineView)
        view.addSubview(pwdInputView)
        view.addSubview(lineView1)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(forgetPwdBtn)
        
        phoneInputView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(30)
            make.left.right.equalTo(view)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(phoneInputView.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        pwdInputView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.equalTo(phoneInputView)
            make.height.equalTo(phoneInputView)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.top.equalTo(pwdInputView.snp.bottom)
            make.height.equalTo(lineView)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(lineView1.snp.bottom).offset(30)
            make.left.equalTo(view).offset(kStateHeight)
            make.right.equalTo(view).offset(-kStateHeight)
            make.height.equalTo(kUIButtonHeight)
        }
        registerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(kStateHeight)
            make.left.right.equalTo(loginBtn)
            make.height.equalTo(loginBtn)
        }
        forgetPwdBtn.snp.makeConstraints { (make) in
            make.top.equalTo(registerBtn.snp.bottom).offset(kMargin)
            make.right.equalTo(pwdInputView).offset(-kStateHeight)
            make.size.equalTo(CGSize(width:70,height:kStateHeight))
        }
//        GYZTool.setupButton(button: registerBtn)
    }
    /// 手机号
    fileprivate lazy var phoneInputView : GYZLoginInputView = GYZLoginInputView(iconName: "icon_login_phone", placeHolder: "请输入手机号码", isPhone: true)
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 密码
    fileprivate lazy var pwdInputView : GYZLoginInputView = GYZLoginInputView(iconName: "icon_login_pwd", placeHolder: "请输入密码", isPhone: false)
    
    /// 分割线2
    fileprivate lazy var lineView1 : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 忘记密码按钮
    fileprivate lazy var forgetPwdBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("忘记密码?", for: .normal)
        btn.setTitleColor(kYellowFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        btn.titleLabel?.textAlignment = .right
        btn.addTarget(self, action: #selector(clickedForgetPwdBtn(btn:)), for: .touchUpInside)
        return btn
    }()
    /// 登录按钮
    fileprivate lazy var loginBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("登  录", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedLoginBtn(btn:)), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    
    /// 注册
    fileprivate lazy var registerBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitle("立即注册", for: .normal)
        btn.setImage(UIImage.init(named: "icon_register_next"), for: .normal)
        btn.setTitleColor(kYellowFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedRegisterBtn(btn:)), for: .touchUpInside)
        btn.borderColor = kBtnClickBGColor
        btn.borderWidth = klineWidth
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    
    /// 注册
    @objc func clickedRegisterBtn(btn: UIButton){
        
    }
    /// 登录
    @objc func clickedLoginBtn(btn: UIButton) {
        KeyWindow.rootViewController = GYZMainTabBarVC()
    }
    /// 忘记密码
    @objc func clickedForgetPwdBtn(btn: UIButton) {
        
    }
    
    /// 请求服务器版本
    func requestVersion(){
        weak var weakSelf = self
        GYZNetWork.requestNetwork("version/checkVersion.do",isToken:false, parameters: ["type":"A2"], method: .post, success:{ (response) in
            
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                let data = response["data"]
                let content = data["content"].stringValue
                let version = data["code"].stringValue
                weakSelf?.checkVersion(newVersion: version, content: content)
            }
        }, failture: { (error) in
            GYZLog(error)
        })
    }
    /// 检测APP更新
    func checkVersion(newVersion: String,content: String){
        
        let type: UpdateVersionType = GYZUpdateVersionTool.compareVersion(newVersion: newVersion)
        switch type {
        case .update:
            updateVersion(version: newVersion, content: content)
        case .updateNeed:
            updateNeedVersion(version: newVersion, content: content)
        default:
            break
        }
    }
    /**
     * //不强制更新
     * @param version 版本名称
     * @param content 更新内容
     */
    func updateVersion(version: String,content: String){
       
        GYZAlertViewTools.alertViewTools.showAlert(title:"发现新版本\(version)", message: content, cancleTitle: "残忍拒绝", viewController: self, buttonTitles: "立即更新", alertActionBlock: { (index) in
            
            if index == 0{//立即更新
                GYZUpdateVersionTool.goAppStore()
            }
        })
    }
    /**
     * 强制更新
     * @param version 版本名称
     * @param content 更新内容
     */
    func updateNeedVersion(version: String,content: String){
        
        weak var weakSelf = self
        GYZAlertViewTools.alertViewTools.showAlert(title:"发现新版本\(version)", message: content, cancleTitle: nil, viewController: self, buttonTitles: "立即更新", alertActionBlock: { (index) in
            
            if index == 0{//立即更新
                GYZUpdateVersionTool.goAppStore()
                ///递归调用，重新设置弹出框
                weakSelf?.updateNeedVersion(version: version, content: content)
            }
        })
    }
}
