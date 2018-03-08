//
//  TAMusicVC.swift
//  TuAi
//  音乐
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAMusicVC: TAFuDaoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "音乐"
        typeArr = ["乐器","歌唱"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
