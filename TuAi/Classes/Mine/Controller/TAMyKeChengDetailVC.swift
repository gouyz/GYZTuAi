//
//  TAMyKeChengDetailVC.swift
//  TuAi
//  我的课程 详情
//  Created by gouyz on 2018/3/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMyKeChengDetailVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "课程详情"
        self.view.backgroundColor = kWhiteColor
        
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(kcImgView)
        contentView.addSubview(nameLab)
        contentView.addSubview(payLab)
        contentView.addSubview(desLab)
        contentView.addSubview(categoryLab)
        contentView.addSubview(applyLab)
        contentView.addSubview(lineView)
        
        contentView.addSubview(orderNoLab)
        contentView.addSubview(timeLab)
        contentView.addSubview(addressLab)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.left.width.equalTo(scrollView)
            make.top.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            // 这个很重要！！！！！！
            // 必须要比scroll的高度大一，这样才能在scroll没有填充满的时候，保持可以拖动
            make.height.greaterThanOrEqualTo(scrollView).offset(1)
        }
        
        kcImgView.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo((kScreenWidth - 20) * 0.45)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(kcImgView)
            make.top.equalTo(kcImgView.snp.bottom).offset(kMargin)
            make.right.equalTo(payLab.snp.left).offset(-kMargin)
            make.height.equalTo(30)
        }
        
        payLab.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.right.equalTo(-kMargin)
            make.top.height.equalTo(nameLab)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
        categoryLab.snp.makeConstraints { (make) in
            make.left.equalTo(desLab.snp.right).offset(kMargin)
            make.centerY.height.equalTo(desLab)
            make.right.equalTo(applyLab.snp.left).offset(-kMargin)
        }
        applyLab.snp.makeConstraints { (make) in
            make.right.width.equalTo(payLab)
            make.centerY.height.equalTo(desLab)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.top.equalTo(desLab.snp.bottom).offset(kMargin)
            make.height.equalTo(klineWidth)
        }
        
        orderNoLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(lineView.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(orderNoLab)
            make.top.equalTo(orderNoLab.snp.bottom)
        }
        addressLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(orderNoLab)
            make.top.equalTo(timeLab.snp.bottom)
            // 这个很重要，viewContainer中的最后一个控件一定要约束到bottom，并且要小于等于viewContainer的bottom
            // 否则的话，上面的控件会被强制拉伸变形
            // 最后的-10是边距，这个可以随意设置
            make.bottom.lessThanOrEqualTo(contentView).offset(-kMargin)
        }
    }
    
    /// scrollView
    var scrollView: UIScrollView = UIScrollView()
    /// 内容View
    var contentView: UIView = UIView()
    /// 课程图片
    lazy var kcImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 5
        
        return imgView
    }()
    /// 课程名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "我们的学校 第一季"
        
        return lab
    }()
    /// 已付款
    lazy var payLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k15Font
        lab.text = "已付款"
        lab.textAlignment = .center
        
        return lab
    }()
    /// 申请售后
    lazy var applyLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k13Font
        lab.text = "申请售后"
        lab.backgroundColor = kWhiteColor
        lab.cornerRadius = 10
        lab.borderColor = kGaryFontColor
        lab.borderWidth = klineWidth
        lab.textAlignment = .center
        
        return lab
    }()
    /// 课程进度
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlueFontColor
        lab.font = k12Font
        lab.text = "30"
        lab.backgroundColor = kWhiteColor
        lab.cornerRadius = 5
        lab.borderColor = kBlueFontColor
        lab.borderWidth = klineWidth
        lab.textAlignment = .center
        
        return lab
    }()
    /// 类别描述
    lazy var categoryLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "Apple"
        
        return lab
    }()
    /// 分割线
    var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 订单编号
    lazy var orderNoLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "订单编号:XXXXXXXXX"
        
        return lab
    }()
    /// 上课时间
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "上课时间：每周一、三、五 晚上18:00 "
        
        return lab
    }()
    /// 上课地址
    lazy var addressLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "上课地址：XXXXXXXXX"
        
        return lab
    }()
}
