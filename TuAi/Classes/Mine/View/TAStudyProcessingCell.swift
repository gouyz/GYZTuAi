//
//  TAStudyProcessingCell.swift
//  TuAi
//  学习记录进度
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAStudyProcessingCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kWhiteColor
        
        contentView.addSubview(topLineView)
        contentView.addSubview(circleView)
        contentView.addSubview(bottomLineView)
        contentView.addSubview(contentLab)
        contentView.addSubview(dateLab)
        
        topLineView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.centerX.equalTo(circleView)
            make.width.equalTo(klineDoubleWidth)
            make.height.equalTo(kMargin)
        }
        circleView.snp.makeConstraints { (make) in
            make.top.equalTo(topLineView.snp.bottom)
            make.left.equalTo(20)
            make.size.equalTo(CGSize.init(width: 12, height: 12))
        }
        bottomLineView.snp.makeConstraints { (make) in
            make.top.equalTo(circleView.snp.bottom)
            make.centerX.width.equalTo(topLineView)
            make.bottom.equalTo(contentView)
        }
        dateLab.snp.makeConstraints { (make) in
            make.left.equalTo(circleView.snp.right).offset(kMargin)
            make.centerY.equalTo(circleView)
            make.width.equalTo(kTitleHeight)
            make.height.equalTo(20)
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(dateLab.snp.right).offset(5)
            make.top.equalTo(dateLab)
            make.right.equalTo(-kMargin)
            make.bottom.equalTo(-kMargin)
        }
    }
    
    /// 图标上半部分的时间线
    lazy var topLineView: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 时间轴线上的图标
    lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = kBlueFontColor
        view.cornerRadius = 6
        
        return view
    }()
    
    /// 图标下半部分的时间线
    lazy var bottomLineView: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
    
    /// 时间
    lazy var dateLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kGaryFontColor
        lab.text = "03-08"
        
        return lab
    }()
    
    /// 内容
    lazy var contentLab: UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.numberOfLines = 0
        lab.text = "学习了  我们的学校第一季\n学习了  我们的学校第二季\n学习了  我们的学校第三季\n学习了  我们的学校第四季"
        
        return lab
    }()
}
