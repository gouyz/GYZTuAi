//
//  GYZBaseWhiteNavVC.swift
//  TuAi
//  白色导航栏
//  Created by gouyz on 2018/3/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class GYZBaseWhiteNavVC: GYZBaseVC {

    override func viewDidLoad() {
        
        isWhiteBack = false
        
        super.viewDidLoad()
        
        setStatusBarStyle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
