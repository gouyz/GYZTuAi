//
//  TAMyBusinessVC.swift
//  TuAi
//  商家入驻
//  Created by gouyz on 2018/3/7.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMyBusinessVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "商家入驻"
        
        view.addSubview(noteLab)
        view.addSubview(bgView)
        bgView.addSubview(nameView)
        bgView.addSubview(addressView)
        bgView.addSubview(phoneView)
        view.addSubview(submitBtn)
        
        noteLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(kTitleAndStateHeight + kMargin)
            make.height.equalTo(kTitleHeight)
        }
        bgView.snp.makeConstraints { (make) in
            make.center.width.equalTo(view)
            make.height.equalTo(kTitleHeight * 3 + kMargin * 2)
        }
        nameView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(kTitleHeight)
            make.top.equalTo(bgView)
        }
        addressView.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameView)
            make.top.equalTo(nameView.snp.bottom).offset(kMargin)
        }
        phoneView.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameView)
            make.top.equalTo(addressView.snp.bottom).offset(kMargin)
        }
        
        submitBtn.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(bgView.snp.bottom).offset(30)
            make.height.equalTo(kUIButtonHeight)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 备注
    lazy var noteLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        lab.text = "请如实填写以下信息，我们工作人员会尽快与您取得联系，谢谢您的配合"
        
        return lab
    }()
    
    lazy var bgView : UIView = UIView()
    /// 商家名称
    lazy var nameView : GYZLabAndFieldView = {
        let lab = GYZLabAndFieldView.init(desName: "商家名称：", placeHolder: "请输入商家名称", isPhone: false)
        lab.cornerRadius = kCornerRadius
        
        return lab
    }()
    /// 具体地址
    lazy var addressView : GYZLabAndFieldView = {
        let lab = GYZLabAndFieldView.init(desName: "具体地址：", placeHolder: "请输入具体地址", isPhone: false)
        lab.cornerRadius = kCornerRadius
        
        return lab
    }()
    /// 联系方式
    lazy var phoneView : GYZLabAndFieldView = {
        let lab = GYZLabAndFieldView.init(desName: "联系方式：", placeHolder: "请输入联系方式", isPhone: true)
        lab.cornerRadius = kCornerRadius
        
        return lab
    }()
    
    /// 立即提交
    lazy var submitBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("立即提交", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedSubmitBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    
    @objc func clickedSubmitBtn(){
        
    }
}
