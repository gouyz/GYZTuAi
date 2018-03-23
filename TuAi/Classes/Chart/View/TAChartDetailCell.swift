//
//  TAChartDetailCell.swift
//  TuAi
//  聊天详情 cell
//  Created by gouyz on 2018/3/23.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAChartDetailCell: UITableViewCell {
    
    // MARK:- 模型
    var model: TAChartDetailModel? { didSet { setModel() } }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(userHeaderView)
        self.addSubview(bubbleView)
        bubbleView.addSubview(contentLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 20
        
        return imgView
    }()
    lazy var bubbleView: UIImageView = {
        return UIImageView()
    }()
    // MARK:- 懒加载
    lazy var contentLab: UILabel = {
        let contentL = UILabel()
        contentL.numberOfLines = 0
        contentL.textAlignment = .left
        contentL.font = k15Font
        
        return contentL
    }()
    
    fileprivate func setModel() {
        
        if self.model?.userType == .me {
            contentLab.text = "首先想到的是转移孩子注意力，用各种方式，不管是物品，还是语言，首先想到的是转移孩子注意力，用各种方式，不管是物品，还是语言"
        }else{
            contentLab.text = "嗯嗯，好的，我去试试~~"
        }
        // 设置泡泡
        let img = self.model?.userType == .me ? #imageLiteral(resourceName: "message_sender_background_normal") : #imageLiteral(resourceName: "message_receiver_background_normal")
        let normalImg = img.resizableImage(withCapInsets: UIEdgeInsetsMake(30, 28, 85, 28), resizingMode: .stretch)
        bubbleView.image = normalImg
        
        let contentSize = contentLab.sizeThatFits(CGSize(width: 220.0, height: CGFloat(FLT_MAX)))
        
        // 重新布局
        userHeaderView.snp.remakeConstraints { (make) in
            make.width.height.equalTo(40)
            make.top.equalTo(self)
        }
        bubbleView.snp.remakeConstraints { (make) in
            make.top.equalTo(-2)
            make.bottom.equalTo(contentLab.snp.bottom).offset(kMargin)
        }
        contentLab.snp.remakeConstraints { (make) in
            make.height.equalTo(contentSize.height)
            make.width.equalTo(contentSize.width)
        }
        
        if model?.userType == .me {
            userHeaderView.snp.makeConstraints { (make) in
                make.right.equalTo(-kMargin)
            }
            bubbleView.snp.makeConstraints { (make) in
                make.right.equalTo(userHeaderView.snp.left).offset(-2)
                make.left.equalTo(contentLab.snp.left).offset(-20)
            }
            contentLab.snp.makeConstraints { (make) in
                make.top.equalTo(kMargin)
                make.right.equalTo(-17)
            }
            
        } else {
            userHeaderView.snp.makeConstraints { (make) in
                make.left.equalTo(kMargin)
            }
            
            bubbleView.snp.makeConstraints { (make) in
                make.left.equalTo(userHeaderView.snp.right).offset(2)
                make.right.equalTo(contentLab.snp.right).offset(20)
            }
            contentLab.snp.makeConstraints { (make) in
                make.top.equalTo(kMargin)
                make.left.equalTo(17)
            }
        }
        
        model?.cellHeight = getCellHeight()
    }
    
    // MARK:- 获取cell的高度
    func getCellHeight() -> CGFloat {
        self.layoutSubviews()
        
        if userHeaderView.height > bubbleView.height {
            return userHeaderView.height + kMargin
        } else {
            return bubbleView.height + kMargin
        }
    }
}
