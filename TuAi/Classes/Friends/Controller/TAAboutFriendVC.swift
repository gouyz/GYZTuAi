//
//  TAAboutFriendVC.swift
//  TuAi
//  朋友 关于TA
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let aboutFriendCell = "aboutFriendCell"
private let aboutFriendConfirmCell = "aboutFriendConfirmCell"
private let aboutFriendJieShaoCell = "aboutFriendJieShaoCell"
private let aboutFriendHeader = "aboutFriendHeader"

class TAAboutFriendVC: TAScrollPageBaseVC {
    
    var titleArr : [String] = ["认证信息","个人信息","个人简介"]
    var personInfoArr : [String] = ["等级：","性别：","年龄：","地区：","社交账号："]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: kTitleAndStateHeight, right: 0))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 懒加载UITableView
    lazy var tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        
        // 设置大概高度
        table.estimatedRowHeight = kTitleHeight
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(TAAboutFriendConfirmCell.self, forCellReuseIdentifier: aboutFriendConfirmCell)
        
        table.register(TAAboutFriendInfoCell.self, forCellReuseIdentifier: aboutFriendCell)
        table.register(TACommonLabCell.self, forCellReuseIdentifier: aboutFriendJieShaoCell)
        
        table.register(TAAboutFriendHeaderView.self, forHeaderFooterViewReuseIdentifier: aboutFriendHeader)
        
        return table
    }()
}

extension TAAboutFriendVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return personInfoArr.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {// 认证信息
            let cell = tableView.dequeueReusableCell(withIdentifier: aboutFriendConfirmCell) as! TAAboutFriendConfirmCell
            
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1 {// 个人信息
            let cell = tableView.dequeueReusableCell(withIdentifier: aboutFriendCell) as! TAAboutFriendInfoCell
            
            cell.desLab.text = personInfoArr[indexPath.row]
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: aboutFriendJieShaoCell) as! TACommonLabCell
            cell.contentLab.text = "青少年是国家的未来和希望，青少年是国家的未来和希望，青少年是国家的未来和希望，青少年是国家的未来和希望，青少年是国家的未来和希望，青少年是国家的未来和希望，青少年是国家的未来和希望"
            
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: aboutFriendHeader) as! TAAboutFriendHeaderView
        
        headerView.contentLab.text = titleArr[section]
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
    
}
