//
//  TAChartNotificationVC.swift
//  TuAi
//  私信 通知
//  Created by gouyz on 2018/3/15.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let chartNotificationCell = "chartNotificationCell"
private let chartNotificationHeader = "chartNotificationHeader"

class TAChartNotificationVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(0)
                
            }else{
                make.edges.equalTo(UIEdgeInsets.init(top: kTitleAndStateHeight, left: 0, bottom: 0, right: 0))
            }
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
        
        table.register(TAChartNotificationCell.self, forCellReuseIdentifier: chartNotificationCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: chartNotificationHeader)
        
        return table
    }()
}

extension TAChartNotificationVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: chartNotificationCell) as! TAChartNotificationCell
        
        if indexPath.row % 2 == 0 {
            cell.iconView.snp.updateConstraints({ (make) in
                make.width.equalTo(80)
            })
        }else{
            cell.iconView.snp.updateConstraints({ (make) in
                make.width.equalTo(0)
            })
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: chartNotificationHeader) as! TASampleTableHeaderView
        
        if section == 0 {
            headerView.contentLab.text = "最新"
        }else{
            headerView.contentLab.text = "以往"
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return kMargin
        
    }
}
