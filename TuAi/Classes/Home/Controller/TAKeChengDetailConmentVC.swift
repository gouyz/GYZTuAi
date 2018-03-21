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
        bottomView.addSubview(conmentField)
        bottomView.addSubview(sendBtn)
        view.addSubview(tableView)
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        sendBtn.snp.makeConstraints { (make) in
            make.right.bottom.top.equalTo(bottomView)
            make.width.equalTo(60)
        }
        conmentField.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.equalTo(sendBtn.snp.left).offset(-kMargin)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(bottomView.snp.top)
            make.top.equalTo(klineWidth)
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
        // 设置大概高度
        table.estimatedRowHeight = 100
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(TAKeChengDetailConmentCell.self, forCellReuseIdentifier: keChengDetailConmentCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: keChengDetailConmentHeader)
        
        return table
    }()
    
    lazy var bottomView: UIView = {
        let bView = UIView()
        bView.backgroundColor = kBackgroundColor
        
        return bView
    }()
    lazy var conmentField: UITextField = {
        let txtField = UITextField()
        txtField.textColor = kBlackFontColor
        txtField.font = k15Font
        txtField.placeholder = "写评论"
        txtField.backgroundColor = kWhiteColor
        
        return txtField
    }()
    /// 发送
    lazy var sendBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.setTitle("发送", for: .normal)
        btn.addTarget(self, action: #selector(clickedSendBtn), for: .touchUpInside)
        
        return btn
    }()
    
    /// 发送
    @objc func clickedSendBtn(){
        conmentField.resignFirstResponder()
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
