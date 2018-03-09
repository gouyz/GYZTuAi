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

class GYZLoginVC: GYZBaseWhiteNavVC {
    
    /// 输入手机号码是否合法
    var validPhone : Bool = false
    /// 密码是否合法
    var validPwd : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登  录"
        
        let rightBtn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 60, height: kTitleHeight))
        rightBtn.setTitle("注册", for: .normal)
        rightBtn.setTitleColor(kBlueFontColor, for: .normal)
        rightBtn.titleLabel?.font = k14Font
        rightBtn.addTarget(self, action: #selector(onClickedRegister), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    
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
        view.addSubview(forgetPwdBtn)
        
        view.addSubview(desLab)
        view.addSubview(qqImgView)
        view.addSubview(weChatImgView)
        view.addSubview(sinaImgView)
        
        phoneInputView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(kTitleAndStateHeight * 2)
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
        forgetPwdBtn.snp.makeConstraints { (make) in
            make.top.equalTo(lineView1.snp.bottom).offset(kMargin)
            make.right.equalTo(pwdInputView).offset(-kStateHeight)
            make.size.equalTo(CGSize(width:70,height:kStateHeight))
        }
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(forgetPwdBtn.snp.bottom).offset(30)
            make.left.equalTo(view).offset(kStateHeight)
            make.right.equalTo(view).offset(-kStateHeight)
            make.height.equalTo(kUIButtonHeight)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(loginBtn)
            make.top.equalTo(loginBtn.snp.bottom).offset(kTitleHeight)
            make.height.equalTo(30)
        }
        qqImgView.snp.makeConstraints { (make) in
            make.right.equalTo(weChatImgView.snp.left).offset(-20)
            make.top.size.equalTo(weChatImgView)
        }
        weChatImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(desLab.snp.bottom).offset(30)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        sinaImgView.snp.makeConstraints { (make) in
            make.left.equalTo(weChatImgView.snp.right).offset(20)
            make.top.size.equalTo(weChatImgView)
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
        btn.setTitleColor(kBlueFontColor, for: .normal)
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
    
    ///
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "其他登录方式"
        lab.textAlignment = .center
        
        return lab
    }()
    /// QQ
    lazy var qqImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_qq"))
    /// 微信
    lazy var weChatImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_wechat"))
    /// 新浪
    lazy var sinaImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_sina"))
    
    /// 注册
    @objc func onClickedRegister(){
        let forgetPwdVC = TAForgetPwdVC()
        forgetPwdVC.isRegister = true
        navigationController?.pushViewController(forgetPwdVC, animated: true)
    }
    /// 登录
    @objc func clickedLoginBtn(btn: UIButton) {
        KeyWindow.rootViewController = GYZMainTabBarVC()
    }
    /// 忘记密码
    @objc func clickedForgetPwdBtn(btn: UIButton) {
        let forgetPwdVC = TAForgetPwdVC()
        forgetPwdVC.isRegister = false
        navigationController?.pushViewController(forgetPwdVC, animated: true)
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
