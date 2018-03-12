//
//  TAModifyPhoneVC.swift
//  TuAi
//  修改手机号
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAModifyPhoneVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "修改手机号"
        view.backgroundColor = kWhiteColor
        
        view.addSubview(iconView)
        view.addSubview(phoneLab)
        view.addSubview(modifyBtn)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(100 + kTitleAndStateHeight)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize.init(width: 80, height: 140))
        }
        phoneLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(iconView.snp.bottom).offset(kMargin)
            make.height.equalTo(kTitleHeight)
        }
        modifyBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(phoneLab.snp.bottom).offset(20)
            make.height.equalTo(kTitleHeight)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 图标
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_modify_phone"))
    lazy var phoneLab : UILabel = {
        let lab = UILabel()
        lab.font = k18Font
        lab.textColor = kBlackFontColor
        lab.textAlignment = .center
        lab.text = "138****1111"
        
        return lab
    }()
    
    /// 按钮
    fileprivate lazy var modifyBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitle("修改手机号", for: .normal)
        btn.setTitleColor(kHeightGaryFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedModifyBtn), for: .touchUpInside)
        btn.borderColor = kHeightGaryFontColor
        btn.borderWidth = klineDoubleWidth
        
        return btn
    }()
    /// 修改手机号
    @objc func clickedModifyBtn(){
        let phoneVC = TAInputPhoneVC()
        self.navigationController?.pushViewController(phoneVC, animated: true)
    }
}
