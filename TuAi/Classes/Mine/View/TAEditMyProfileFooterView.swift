//
//  TAEditMyProfileFooterView.swift
//  TuAi
//  编辑个人资料 footerView
//  Created by gouyz on 2018/3/16.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAEditMyProfileFooterView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(noteTxtView)
        contentView.addSubview(desLab)
        
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(contentView)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        noteTxtView.snp.makeConstraints { (make) in
            make.left.right.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom)
            make.bottom.equalTo(-kMargin)
        }
    }
    ///
    lazy var desLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kGaryFontColor
        lab.text = "对宝宝的寄语"
        
        return lab
    }()
    /// 备注
    lazy var noteTxtView: UITextView = {
        
        let txtView = UITextView()
        txtView.font = k15Font
        txtView.textColor = kGaryFontColor
        txtView.borderColor = kGaryFontColor
        txtView.borderWidth = klineWidth
        
        return txtView
    }()
}
