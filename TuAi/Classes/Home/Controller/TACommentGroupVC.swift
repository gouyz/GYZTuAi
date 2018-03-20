//
//  TACommentGroupVC.swift
//  TuAi
//  论坛 精选小组
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let commentGroupCell = "commentGroupCell"

class TACommentGroupVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "精选小组"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        tableView.tableHeaderView = adsImgView
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
        
        table.register(TACommentGroupDetailCell.self, forCellReuseIdentifier: commentGroupCell)
        
        return table
    }()
    /// 广告轮播图
    lazy var adsImgView: ZCycleView = {
        let adsView = ZCycleView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 160))
        adsView.setImagesGroup([#imageLiteral(resourceName: "icon_home_header_bg"),#imageLiteral(resourceName: "icon_home_header_bg"),#imageLiteral(resourceName: "icon_home_header_bg")])
        adsView.pageControlAlignment = .right
        adsView.pageControlIndictirColor = kWhiteColor
        adsView.pageControlCurrentIndictirColor = kNavBarColor
        adsView.scrollDirection = .horizontal
        
        return adsView
    }()
}

extension TACommentGroupVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: commentGroupCell) as! TACommentGroupDetailCell
        
        
        if indexPath.row == 0 {//一张图片
            cell.imgViews.isHidden = false
            cell.imgViews.imgWidth = kScreenWidth - 70
            cell.imgViews.imgHight = cell.imgViews.imgWidth * 0.6
            cell.imgViews.perRowItemCount = 1
            cell.imgViews.selectImgUrls = [""]
        }else{
            cell.imgViews.selectImgUrls = []
            cell.imgViews.isHidden = true
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
        
        if cell.imgViews.selectImgUrls?.count > 0 {
            cell.imgViews.snp.updateConstraints({ (make) in
                
                make.height.equalTo(cell.imgViews.imgHight * rowIndex + kMargin * (rowIndex - 1))
            })
        }else{
            cell.imgViews.snp.updateConstraints({ (make) in
                
                make.height.equalTo(0)
            })
        }
        
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

