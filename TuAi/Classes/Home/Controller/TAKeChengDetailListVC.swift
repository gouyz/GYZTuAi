//
//  TAKeChengDetailListVC.swift
//  TuAi
//  课程详情 目录
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let keChengDetailListCell = "keChengDetailListCell"
private let keChengDetailListHeader = "keChengDetailListHeader"

class TAKeChengDetailListVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(buyBtn)
        view.addSubview(tableView)
        buyBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(buyBtn.snp.top)
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
        
        table.register(TACommonLabCell.self, forCellReuseIdentifier: keChengDetailListCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: keChengDetailListHeader)
        
        return table
    }()
    /// 立即购买
    lazy var buyBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("立即购买", for: .normal)
        btn.addTarget(self, action: #selector(clickedBuyBtn), for: .touchUpInside)
        
        return btn
    }()
    
    /// 立即购买
    @objc func clickedBuyBtn(){
    }
}

extension TAKeChengDetailListVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: keChengDetailListCell) as! TACommonLabCell
        cell.contentLab.font = k15Font
        cell.contentLab.text = "第一节：高音和低音"
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: keChengDetailListHeader) as! TASampleTableHeaderView
        
        headerView.contentLab.text = "学习方式：线下"
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.000001
        
    }
}
