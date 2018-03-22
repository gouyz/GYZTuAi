//
//  TAKeChengDetailConmentVC.swift
//  TuAi
//  课程详情 评论
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let keChengDetailConmentCell = "keChengDetailConmentCell"
private let keChengDetailConmentHeader = "keChengDetailConmentHeader"

class TAKeChengDetailConmentVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(bottomView)
        view.addSubview(tableView)
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(bottomView.snp.top)
            make.top.equalTo(klineWidth)
        }
        bottomView.sendBtn.addTarget(self, action: #selector(clickedSendBtn), for: .touchUpInside)
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
        // 设置大概高度
        table.estimatedRowHeight = 100
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(TAKeChengDetailConmentCell.self, forCellReuseIdentifier: keChengDetailConmentCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: keChengDetailConmentHeader)
        
        return table
    }()
    // 评论View
    lazy var bottomView: TABottomSendView = TABottomSendView()
    
    /// 发送
    @objc func clickedSendBtn(){
        bottomView.conmentField.resignFirstResponder()
    }
}
extension TAKeChengDetailConmentVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: keChengDetailConmentCell) as! TAKeChengDetailConmentCell
        
        if indexPath.row % 2 == 0 {
            cell.zanBtn.isSelected = false
            cell.bgView.isHidden = false
            cell.replayLab.text = "我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢"
        }else{
            cell.replayLab.text = ""
            cell.bgView.isHidden = true
            cell.zanBtn.isSelected = true
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: keChengDetailConmentHeader) as! TASampleTableHeaderView
        
        headerView.contentView.backgroundColor = kBackgroundColor
        headerView.contentLab.text = "最新评论"
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 34
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.000001
        
    }
}
