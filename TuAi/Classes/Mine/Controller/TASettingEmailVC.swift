//
//  TASettingEmailVC.swift
//  TuAi
//  设置邮箱
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASettingEmailVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "设置邮箱"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(iconView)
        view.addSubview(desLab)
        view.addSubview(modifyBtn)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(100 + kTitleAndStateHeight)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize.init(width: 100, height: 130))
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(iconView.snp.bottom).offset(kMargin)
            make.height.equalTo(kTitleHeight)
        }
        modifyBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(desLab.snp.bottom).offset(20)
            make.height.equalTo(kTitleHeight)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 图标
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_setting_email"))
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kBlackFontColor
        lab.numberOfLines = 2
        lab.text = "设置邮箱与密码后，你可以使用（邮箱+密码）直接登录，也可以用邮箱找回密码"
        
        return lab
    }()
    
    /// 按钮
    fileprivate lazy var modifyBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("设置邮箱", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedModifyBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    /// 设置邮箱
    @objc func clickedModifyBtn(){
        let emailVC = TAInputEmailVC()
        self.navigationController?.pushViewController(emailVC, animated: true)
    }
}
