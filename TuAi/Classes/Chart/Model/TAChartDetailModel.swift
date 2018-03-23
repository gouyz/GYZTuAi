//
//  TAChartDetailModel.swift
//  TuAi
//  聊天详情model
//  Created by gouyz on 2018/3/23.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

// 聊天消息来源
enum TAChartMsgUserType: Int {
    case me
    case friend
}

@objcMembers
class TAChartDetailModel: TABaseModel {

    // 会话来源
    var userType: TAChartMsgUserType? = .me
    var cellHeight: CGFloat = 0
}
