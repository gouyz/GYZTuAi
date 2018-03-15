//
//  TAFriendHomeDynamicVC.swift
//  TuAi
//  朋友主页动态
//  Created by gouyz on 2018/3/14.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let friendsHomeDynamicCell = "friendsHomeDynamicCell"

class TAFriendHomeDynamicVC: TAScrollPageBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: kTitleAndStateHeight, right: 0))
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
        table.estimatedRowHeight = 200
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(TAFriendsCell.self, forCellReuseIdentifier: friendsHomeDynamicCell)
        
        return table
    }()
}

extension TAFriendHomeDynamicVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsHomeDynamicCell) as! TAFriendsCell
        
        if indexPath.row == 0 {//一张图片
            cell.imgViews.imgWidth = imgWOne
            cell.imgViews.imgHight = cell.imgViews.imgWidth * 0.6
            cell.imgViews.perRowItemCount = 1
            cell.imgViews.selectImgUrls = [""]
        }else if indexPath.row == 1 {//2张图片
            cell.imgViews.imgWidth = imgWTwo
            cell.imgViews.imgHight = cell.imgViews.imgWidth
            cell.imgViews.perRowItemCount = 2
            cell.imgViews.selectImgUrls = ["",""]
        }else if indexPath.row == 2 {//3张图片
            cell.imgViews.imgWidth = imgWMore
            cell.imgViews.imgHight = cell.imgViews.imgWidth
            cell.imgViews.perRowItemCount = 3
            cell.imgViews.selectImgUrls = ["","",""]
        }else if indexPath.row == 3 {//4张图片
            cell.imgViews.imgWidth = imgWTwo
            cell.imgViews.imgHight = cell.imgViews.imgWidth
            cell.imgViews.perRowItemCount = 2
            cell.imgViews.selectImgUrls = ["","","",""]
        }else {
            cell.imgViews.imgWidth = imgWMore
            cell.imgViews.imgHight = cell.imgViews.imgWidth
            cell.imgViews.perRowItemCount = 3
            cell.imgViews.selectImgUrls = ["","","","","","",""]
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
        let rowIndex = ceil(CGFloat.init((cell.imgViews.selectImgUrls?.count)!) / CGFloat.init(cell.imgViews.perRowItemCount))//向上取整
        
        //        cell.imgViews.isHidden = false
        cell.imgViews.snp.updateConstraints({ (make) in
            
            make.height.equalTo(cell.imgViews.imgHight * rowIndex + kMargin * (rowIndex - 1))
        })

        
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }

}
