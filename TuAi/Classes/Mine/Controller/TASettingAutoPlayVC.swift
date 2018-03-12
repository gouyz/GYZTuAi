//
//  TASettingAutoPlayVC.swift
//  TuAi
//  视频自动播放
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let mySettingAuToPlayCell = "mySettingAuToPlayCell"

class TASettingAutoPlayVC: GYZBaseWhiteNavVC {

    /// 选择索引
    var mSelectedIndex: Int = 0
    
    let titleArr: [String] = ["移动流量和WI-FI","仅WI-FI","仅移动流量"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "视频自动播放"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
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
        table.separatorColor = kGrayLineColor
        
        table.register(TASettingAuToPlayCell.self, forCellReuseIdentifier: mySettingAuToPlayCell)
        
        
        return table
    }()
}

extension TASettingAutoPlayVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: mySettingAuToPlayCell) as! TASettingAuToPlayCell
    
        cell.nameLab.text = titleArr[indexPath.row]
        if indexPath.row == mSelectedIndex {
            cell.selectedIconView.isHidden = false
        }else {
            cell.selectedIconView.isHidden = true
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mSelectedIndex = indexPath.row
        self.tableView.reloadData()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}

