//
//  TASendVideoVC.swift
//  TuAi
//  发视频
//  Created by gouyz on 2018/4/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASendVideoVC: GYZBaseWhiteNavVC {

    let typeArr: [String] = ["辅导","舞蹈","书画","体育","音乐","留学","早教","其他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = kWhiteColor
        self.navigationItem.title = "发视频"
        let rightBtn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 60, height: kTitleHeight))
        rightBtn.setTitle("发布", for: .normal)
        rightBtn.setTitleColor(kBlackFontColor, for: .normal)
        rightBtn.titleLabel?.font = k15Font
        rightBtn.addTarget(self, action: #selector(onClickedSend), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpUI(){
        
        view.addSubview(contentView)
        contentView.addSubview(nameTxtFiled)
        contentView.addSubview(lineView)
        contentView.addSubview(videoBgView)
        videoBgView.addSubview(addView)
        contentView.addSubview(categoryLab)
        contentView.addSubview(tagsView)
        
        view.addSubview(keyBoardView)
        
        keyBoardView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        contentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(keyBoardView.snp.top)
            make.top.equalTo(kTitleAndStateHeight)
        }
        nameTxtFiled.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameTxtFiled)
            make.top.equalTo(nameTxtFiled.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        videoBgView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.left.right.equalTo(nameTxtFiled)
            //宽高比 16:9
            make.height.equalTo(videoBgView.snp.width).multipliedBy(9.0/16.0)
        }
        addView.snp.makeConstraints { (make) in
            make.center.equalTo(videoBgView)
            make.width.equalTo(100)
            make.height.equalTo(70)
        }
        
        categoryLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameTxtFiled)
            make.top.equalTo(videoBgView.snp.bottom).offset(20)
        }
        
        let height = HXTagsView.getHeightWithTags(typeArr, layout: tagsView.layout, tagAttribute: tagsView.tagAttribute, width: kScreenWidth - 40)
        
        tagsView.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(categoryLab.snp.bottom)
            make.height.equalTo(height)
        }
        
        tagsView.tags = typeArr
        tagsView.selectedTags = ["辅导"]
        tagsView.completion = {[weak self] (selectedTags,selectedIndex) in
            
//            self?.mSelectedTypeIndex = selectedIndex
        }
        tagsView.reloadData()
    }
    /// 内容View
    var contentView: UIView = UIView()
    /// 标题输入框
    lazy var nameTxtFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.placeholder = "填写标题"
        
        return textFiled
    }()
    lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
    lazy var videoBgView: UIView = {
        let line = UIView()
        line.backgroundColor = kBackgroundColor
        
        return line
    }()
    /// 上传视频
    lazy var addView: TAImgAndTxtBtnView = {
        
        let view = TAImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_video_zan")
        view.imgSize = CGSize.init(width: kTitleHeight, height: kTitleHeight)
        view.menuTitle.text = "上传视频"
        view.menuTitle.font = k15Font
        view.menuTitle.textColor = kHeightGaryFontColor
        
        return view
        
    }()
    lazy var categoryLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.text = "分类"
        lab.textColor = kGaryFontColor
        
        return lab
    }()
    /// 标签 类型
    lazy var tagsView: HXTagsView = {
        
        let view = HXTagsView()
        view.tagAttribute.borderColor = kGrayLineColor
        view.tagAttribute.normalBackgroundColor = kWhiteColor
        view.tagAttribute.selectedBackgroundColor = kNavBarColor
        view.tagAttribute.textColor = kGaryFontColor
        view.tagAttribute.selectedTextColor = kWhiteColor
        view.tagAttribute.cornerRadius = 8
        view.backgroundColor = kWhiteColor
        /// 显示多行
        view.layout.scrollDirection = .vertical
        
        return view
    }()
    /// 底部键盘
    lazy var keyBoardView: TASendBottomKeyBoardView = {
        let keyView = TASendBottomKeyBoardView()
        keyView.backgroundColor = kBackgroundColor
        keyView.groupView.isHidden = true
        keyView.groupView.snp.updateConstraints({ (make) in
            make.width.equalTo(0)
        })
        
        return keyView
    }()
    
    /// 发布
    @objc func onClickedSend(){
        
    }
}
