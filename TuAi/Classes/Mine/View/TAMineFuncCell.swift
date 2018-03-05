//
//  TAMineFuncCell.swift
//  TuAi
//
//  Created by gouyz on 2018/3/3.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMineFuncCell: UICollectionViewCell {
    
    /// 填充数据
    var menuData : TAHomeFuncModel?{
        didSet{
            if let menu = menuData {
                menuView.menuImg.image = UIImage.init(named: menu.image!)
                menuView.menuTitle.text = menu.title!
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        addSubview(menuView)
        
        menuView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///
    lazy var menuView: TAFuncModelView = TAFuncModelView()

}
