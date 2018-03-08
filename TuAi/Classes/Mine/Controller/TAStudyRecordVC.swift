//
//  TAStudyRecordVC.swift
//  TuAi
//  学习记录
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let studyRecordCell = "studyRecordCell"
private let studyRecordHeader = "studyRecordHeader"

class TAStudyRecordVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "学习记录"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        tableView.tableHeaderView = headerView
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
        
        table.register(TAStudyProcessingCell.self, forCellReuseIdentifier: studyRecordCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: studyRecordHeader)
        
        return table
    }()
    
    /// 头部
    lazy var headerView: TAStudyRecordHeaderView = TAStudyRecordHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 220))
}

extension TAStudyRecordVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: studyRecordCell) as! TAStudyProcessingCell
        
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: studyRecordHeader) as! TASampleTableHeaderView
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        goDetailVC()
    }
    ///MARK : UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
