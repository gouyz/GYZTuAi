//
//  TASelectedGroupVC.swift
//  TuAi
//  选择小组
//  Created by gouyz on 2018/4/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

private let selectedGroupCell = "selectedGroupCell"
private let selectedGroupHeader = "selectedGroupHeader"

class TASelectedGroupVC: GYZBaseWhiteNavVC {
    
    var searchContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "选择小组"
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(kTitleAndStateHeight)
            make.height.equalTo(kTitleHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalTo(view)
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
        
        table.register(TASelectedGroupCell.self, forCellReuseIdentifier: selectedGroupCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: selectedGroupHeader)
        
        return table
    }()
    
    /// 搜索框
    lazy var searchBar : UISearchBar = {
        let search = UISearchBar()
        
//        search.backgroundImage = UIImage.init(named: "icon_search_clearbg")
        search.placeholder = "请输入您要加入的小组"
        search.delegate = self
        //显示输入光标
        search.tintColor = kBlackFontColor
        //弹出键盘
//        search.becomeFirstResponder()
        
        return search
    }()
}

extension TASelectedGroupVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: selectedGroupCell) as! TASelectedGroupCell
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: selectedGroupHeader) as! TASampleTableHeaderView
        
        headerView.contentView.backgroundColor = kBackgroundColor
        headerView.contentLab.text = "热门小组"
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
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return kMargin
        
    }
}
extension TASelectedGroupVC: UISearchBarDelegate{
    ///mark - UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        searchContent = searchBar.text!
        if searchContent.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入搜索内容")
            return
        }
//        currPage = 1
//        baoShiModels.removeAll()
//        requestOrderDatas()
    }
}
