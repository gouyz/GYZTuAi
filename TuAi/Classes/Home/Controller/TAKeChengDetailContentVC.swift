//
//  TAKeChengDetailContentVC.swift
//  TuAi
//  课程详情 详情页面
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let keChengDetailContentBuyCell = "keChengDetailContentBuyCell"
private let keChengDetailContentSecondCell = "keChengDetailContentSecondCell"
private let keChengDetailContentThirdCell = "keChengDetailContentThirdCell"

private let keChengDetailContentSecondHeader = "keChengDetailContentSecondHeader"
private let keChengDetailContentThirdHeader = "keChengDetailContentThirdHeader"

class TAKeChengDetailContentVC: GYZBaseVC {
    
    var typeArr: [String] = ["幼教","儿童教育"]

    override func viewDidLoad() {
        super.viewDidLoad()

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
        table.separatorStyle = .none
        
        // 设置大概高度
        table.estimatedRowHeight = 100
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(TAKeChengDetailBuyCell.self, forCellReuseIdentifier: keChengDetailContentBuyCell)
        table.register(TAKeChengDetailBestCell.self, forCellReuseIdentifier: keChengDetailContentSecondCell)
        table.register(TAKeChengDetailDesCell.self, forCellReuseIdentifier: keChengDetailContentThirdCell)
        
        table.register(TAKeChengDetailBestHeaderView.self, forHeaderFooterViewReuseIdentifier: keChengDetailContentSecondHeader)
        
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: keChengDetailContentThirdHeader)
        
        return table
    }()
    
    /// 标签layout
    var tagsLayout: HXTagCollectionViewFlowLayout = {
        
        let layout = HXTagCollectionViewFlowLayout()
        /// 显示多行
        layout.scrollDirection = .vertical
        
        return layout
    }()
}
extension TAKeChengDetailContentVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: keChengDetailContentBuyCell) as! TAKeChengDetailBuyCell
            
            let typeHeight = HXTagsView.getHeightWithTags(typeArr, layout: tagsLayout, tagAttribute: nil, width: kScreenWidth - 120)
            
            cell.tagsView.snp.updateConstraints({ (make) in
                make.height.equalTo(typeHeight)
            })
            cell.tagsView.tags = typeArr
            
            cell.tagsView.reloadData()
            
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: keChengDetailContentSecondCell) as! TAKeChengDetailBestCell
            
            cell.selectionStyle = .none
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: keChengDetailContentThirdCell) as! TAKeChengDetailDesCell
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: keChengDetailContentSecondHeader) as! TAKeChengDetailBestHeaderView
            
            return headerView
        }else if section == 2 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: keChengDetailContentThirdHeader) as! TASampleTableHeaderView
            
            headerView.contentLab.text = "课程介绍"
            
            return headerView
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    ///MARK : UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return klineWidth
        }
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return kMargin
        
    }
}
