//
//  TAOtherVC.swift
//  TuAi
//  其他
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAOtherVC: TAFuDaoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "其他"
        typeArr = ["陶艺","围棋","象棋","插花","剪纸","烹饪","礼仪"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
