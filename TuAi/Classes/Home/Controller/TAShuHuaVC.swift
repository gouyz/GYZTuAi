//
//  TAShuHuaVC.swift
//  TuAi
//  书画
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAShuHuaVC: TAFuDaoVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "书画"
        typeArr = ["书法","绘画"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
