//
//  TAFriendsVC.swift
//  TuAi
//  朋友
//  Created by gouyz on 2018/2/26.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let friendsCell = "friendsCell"

class TAFriendsVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        navBarBgAlpha = 0
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            
            if #available(iOS 11.0, *) {
                make.edges.equalTo(UIEdgeInsets.init(top: -kTitleAndStateHeight, left: 0, bottom: 0, right: 0))
            }else{
                make.edges.equalTo(0)
            }
            
        }
        
        tableView.tableHeaderView = friendsHeaderView
        
        friendsHeaderView.friendsGroupView.addOnClickListener(target: self, action: #selector(clickedFriendGroup))
        friendsHeaderView.ablumView.addOnClickListener(target: self, action: #selector(clickedAblum))
        friendsHeaderView.userHeaderView.addOnClickListener(target: self, action: #selector(onClickedMyDynamic))
        friendsHeaderView.bgHeaderView.isUserInteractionEnabled = true
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
        
        table.register(TAFriendsCell.self, forCellReuseIdentifier: friendsCell)
        
        return table
    }()
    
    lazy var friendsHeaderView: TAFriendsHeaderView = TAFriendsHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 280))
    
    /// 点击头像，进入朋友主页
    @objc func clickedUserHeader(sender: UITapGestureRecognizer){
        let homeVC = TAFriendHomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    /// 亲友团
    @objc func clickedFriendGroup(){
        let groupVC = TAFriendsGroupVC()
        self.navigationController?.pushViewController(groupVC, animated: true)
    }
    
    /// 亲友团
    @objc func clickedAblum(){
        let ablumVC = TAAblumVC()
        self.navigationController?.pushViewController(ablumVC, animated: true)
    }
    /// 我发布的
    @objc func onClickedMyDynamic(){
        let myDynamicVC = TAMyDynamicVC()
        self.navigationController?.pushViewController(myDynamicVC, animated: true)
    }
}

extension TAFriendsVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsCell) as! TAFriendsCell
        
        cell.deleteBtn.isHidden = true
        
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
        
        cell.userImgView.addOnClickListener(target: self, action: #selector(clickedUserHeader(sender:)))
        cell.userImgView.tag = indexPath.row
        
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
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        let showNavBarOffsetY = kTitleAndStateHeight - topLayoutGuide.length
        
        
        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {
            
            var navAlpha = (contentOffsetY - (showNavBarOffsetY)) / 100.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            self.navigationItem.title = "朋友"
        }else{
            navBarBgAlpha = 0
            self.navigationItem.title = ""
        }
    }
}
