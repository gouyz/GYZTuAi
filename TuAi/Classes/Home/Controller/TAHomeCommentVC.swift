//
//  TAHomeCommentVC.swift
//  TuAi
//  首页 论坛
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit


private let homeCommentCell = "homeCommentCell"
private let homeCommentGroupCell = "homeCommentGroupCell"
private let homeCommentHeader = "homeCommentHeader"

class TAHomeCommentVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, kTabBarHeight, 0))
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
        
        table.register(TACommentCell.self, forCellReuseIdentifier: homeCommentCell)
        table.register(TACommentGroupCell.self, forCellReuseIdentifier: homeCommentGroupCell)
        
        table.register(TACommentHeaderView.self, forHeaderFooterViewReuseIdentifier: homeCommentHeader)
        
        return table
    }()
}

extension TAHomeCommentVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: homeCommentGroupCell) as! TACommentGroupCell
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: homeCommentCell) as! TACommentCell
            
            if indexPath.row % 2 == 0 {//一张图片
                cell.imgViews.imgWidth = kScreenWidth - kMargin * 2
                cell.imgViews.imgHight = cell.imgViews.imgWidth * 0.5
                cell.imgViews.perRowItemCount = 1
                
                cell.imgViews.selectImgUrls = [""]
            }else {
                cell.imgViews.imgWidth = kPhotosImgHeight
                cell.imgViews.imgHight = kPhotosImgHeight
                cell.imgViews.perRowItemCount = 3
                
                cell.imgViews.selectImgUrls = ["","",""]
            }
            
            ///查看大图
            cell.imgViews.onClickedImgDetailsBlock = {[weak self] (index,urls) in
                
                //            let browser = SKPhotoBrowser(photos: GYZTool.createWebPhotos(urls: urls))
                //            browser.initializePageIndex(index)
                //            //        browser.delegate = self
                //
                //            self?.present(browser, animated: true, completion: nil)
            }
            
            /// 如果图片张数超出最大限制数，只取最大限制数的图片
            //        var imgCount : Int = imgUrls.count
            //        if imgCount > kMaxSelectCount {
            //            imgCount = kMaxSelectCount
            //        }
            //        let rowIndex = ceil(CGFloat.init(imgCount) / 3.0)//向上取整
            
            //        cell.imgViews.isHidden = false
            cell.imgViews.snp.updateConstraints({ (make) in
                //            make.height.equalTo(kPhotosImgHeight * rowIndex + kMargin * (rowIndex - 1))
                make.height.equalTo(cell.imgViews.imgHight)
            })
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: homeCommentHeader) as! TACommentHeaderView
            
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
            return kTitleHeight
        }
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
