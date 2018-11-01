//
//  TASendBottomKeyBoardView.swift
//  TuAi
//  发图文、视频底部View
//  Created by gouyz on 2018/4/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TASendBottomKeyBoardView: UIView {

    // MARK: 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        
        addSubview(keyBoardView)
        addSubview(friendsView)
        addSubview(groupView)
        
        keyBoardView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize.init(width: 22, height: 20))
        }
        friendsView.snp.makeConstraints { (make) in
            make.right.equalTo(groupView.snp.left).offset(-20)
            make.centerY.equalTo(keyBoardView)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        groupView.snp.makeConstraints { (make) in
            make.centerY.equalTo(friendsView)
            make.right.equalTo(-20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    ///键盘
    lazy var keyBoardView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_keyboard_tag")
        
        return imgView
    }()
    /// @
    lazy var friendsView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_friend_tag")
        
        return imgView
    }()
    /// #
    lazy var groupView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_group_#_tag")
        
        return imgView
    }()
}
