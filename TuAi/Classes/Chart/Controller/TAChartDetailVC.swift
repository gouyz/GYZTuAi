//
//  TAChartDetailVC.swift
//  TuAi
//  聊天详情
//  Created by gouyz on 2018/3/22.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let chartMessageDetailCell = "chartMessageDetailCell"

class TAChartDetailVC: GYZBaseVC {
    
    var messageList: [TAChartDetailModel] = [TAChartDetailModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "小胖子"
        
        for i in 0 ..< 10 {
            let model: TAChartDetailModel = TAChartDetailModel()
            if i % 2 == 0{
                model.userType = .friend
            }else{
                model.userType = .me
            }
            
            messageList.append(model)
        }
        
        view.addSubview(bottomView)
        view.addSubview(tableView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view)
                
            }else{
                make.top.equalTo(kTitleAndStateHeight)
            }
            make.bottom.equalTo(bottomView.snp.top)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollToBottom(animated: true)
    }
    
    /// 懒加载UITableView
    lazy var tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        
        table.register(TAChartDetailCell.self, forCellReuseIdentifier: chartMessageDetailCell)
        
        
        return table
    }()
    // 评论View
    lazy var bottomView: TABottomSendView = TABottomSendView()
    
    /// 发送
    @objc func clickedSendBtn(){
        bottomView.conmentField.resignFirstResponder()
    }
    
    // MARK: 滚到底部
    func scrollToBottom(animated: Bool = false) {
        self.view.layoutIfNeeded()
        if messageList.count > 0 {
            tableView.scrollToRow(at: IndexPath(row: messageList.count - 1, section: 0), at: .top, animated: animated)
        }
    }
}

extension TAChartDetailVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: chartMessageDetailCell) as! TAChartDetailCell
        
        cell.model = messageList[indexPath.row]
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
        
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = messageList[indexPath.row]
        return model.cellHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
