//
//  TACollectionBlankFooterView.swift
//  TuAi
//  Collection 尾部间隔10
//  Created by gouyz on 2018/3/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TACollectionBlankFooterView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kBackgroundColor
        addSubview(blankView)
        blankView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var blankView: UIView = UIView()
}
