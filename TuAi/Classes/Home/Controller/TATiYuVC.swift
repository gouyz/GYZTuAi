//
//  TATiYuVC.swift
//  TuAi
//  体育
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TATiYuVC: TAFuDaoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "体育"
        typeArr = ["跆拳道","搏击","武术","足球","篮球","网球","乒乓球","排球"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
