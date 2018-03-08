//
//  TAWuDaoVC.swift
//  TuAi
//  舞蹈
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAWuDaoVC: TAFuDaoVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "舞蹈"
        typeArr = ["芭蕾","爵士","现代舞","民族舞"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
