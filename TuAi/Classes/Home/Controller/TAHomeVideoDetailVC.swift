//
//  TAHomeVideoDetailVC.swift
//  TuAi
//  视频详情
//  Created by gouyz on 2018/3/22.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import BMPlayer
import NVActivityIndicatorView
import AVFoundation

private let homeVideoDetailConmentCell = "homeVideoDetailConmentCell"
private let homeVideoDetailInfoCell = "homeVideoDetailInfoCell"
private let homeVideoDetailConmentHeader = "homeVideoDetailConmentHeader"

class TAHomeVideoDetailVC: GYZBaseWhiteNavVC {
    
    var typeArr: [String] = ["幼教","儿童教育","普通话"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "视频详情"
        resetPlayerManager()
        
        view.addSubview(player)
        view.addSubview(userView)
        userView.addSubview(userImgView)
        userView.addSubview(nameLab)
        userView.addSubview(addBtn)
        userView.addSubview(lineView)
        view.addSubview(tableView)
        view.addSubview(bottomView)
        
        player.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.left.right.equalTo(view)
            // 注意此处，宽高比 16:9 优先级比 1000 低就行，在因为 iPhone 4S 宽高比不是 16：9
            make.height.equalTo(view.snp.width).multipliedBy(9.0/16.0).priority(500)
        }
        
        userView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(player.snp.bottom)
            make.height.equalTo(60)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(userView)
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.centerY.height.equalTo(userView)
            make.right.equalTo(addBtn.snp.left).offset(-kMargin)
        }
        addBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(userView)
            make.size.equalTo(CGSize.init(width: 60, height: 30))
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(userView)
            make.bottom.equalTo(userView)
            make.height.equalTo(klineWidth)
        }
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(userView.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        player.delegate = self
//        let asset = BMPlayerResource(url: URL(string: "http://baobab.wdjcdn.com/14525705791193.mp4")!, name: "风格互换：原来你我相爱")
        let asset = BMPlayerResource.init(url: URL(string: "http://yichong.0519app.com/uploads/8-10-31996/980c1e2037946.mp4")!, name: "风格互换：原来你我相爱", cover: URL(string: "http://yichong.0519app.com/uploads/8-10-31234/9785e2f91b982.png")!, subtitle: nil)
        player.setVideo(resource: asset)
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
        
        table.register(TAKeChengDetailConmentCell.self, forCellReuseIdentifier: homeVideoDetailConmentCell)
        table.register(TAHomeVideoDetailInfoCell.self, forCellReuseIdentifier: homeVideoDetailInfoCell)
        table.register(TASampleTableHeaderView.self, forHeaderFooterViewReuseIdentifier: homeVideoDetailConmentHeader)
        
        return table
    }()
    
    /// 播放器
    lazy var player: BMPlayer = BMPlayer(customControlView: BMPlayerControlView())
    
    lazy var userView: UIView = {
        let user = UIView()
        user.backgroundColor = kWhiteColor
        
        return user
    }()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 20
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "小胖子"
        
        return lab
    }()
    
    /// 加关注
    lazy var addBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitleColor(kRedFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kGrayLineColor
        btn.borderWidth = klineWidth
        btn.setTitle("+ 关注", for: .normal)
        btn.setTitle("已关注", for: .selected)
        btn.cornerRadius = kCornerRadius
        btn.addTarget(self, action: #selector(onClickedAddBtn), for: .touchUpInside)
        
        return btn
    }()
    lazy var lineView: UIView = {
        let user = UIView()
        user.backgroundColor = kGrayLineColor
        
        return user
    }()
    // 评论View
    lazy var bottomView: TABottomSendView = TABottomSendView()
    
    /// 发送
    @objc func clickedSendBtn(){
        bottomView.conmentField.resignFirstResponder()
    }
    /// 播放器自定义属性 创建播放器前设定
    func resetPlayerManager() {
        // 是否打印日志，默认false
        BMPlayerConf.allowLog = false
        // 是否自动播放，默认true
        BMPlayerConf.shouldAutoPlay = false
        // 主体颜色，默认白色
        BMPlayerConf.tintColor = kWhiteColor
        // 顶部返回和标题显示选项，默认.Always，可选.HorizantalOnly、.None
        BMPlayerConf.topBarShowInCase = .none
        // 加载效果，更多请见：https://github.com/ninjaprox/NVActivityIndicatorView
        BMPlayerConf.loaderType  = NVActivityIndicatorType.lineSpinFadeLoader
    }
    
    /// 关注
    @objc func onClickedAddBtn(){
        
    }
    
    /// 标签layout
    var tagsLayout: HXTagCollectionViewFlowLayout = {
        
        let layout = HXTagCollectionViewFlowLayout()
        /// 显示多行
        layout.scrollDirection = .vertical
        
        return layout
    }()
}
extension TAHomeVideoDetailVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: homeVideoDetailInfoCell) as! TAHomeVideoDetailInfoCell
            
            
            let typeHeight = HXTagsView.getHeightWithTags(typeArr, layout: tagsLayout, tagAttribute: nil, width: kScreenWidth - kMargin * 2)
            
            cell.tagsView.snp.updateConstraints({ (make) in
                make.height.equalTo(typeHeight)
            })
            cell.tagsView.tags = typeArr
            
            cell.tagsView.reloadData()
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: homeVideoDetailConmentCell) as! TAKeChengDetailConmentCell
            
            if indexPath.row % 2 == 0 {
                cell.zanBtn.isSelected = false
                cell.bgView.isHidden = false
                cell.replayLab.text = "回复：我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢，我也觉得从小培养孩子的兴趣很重要呢"
            }else{
                cell.replayLab.text = ""
                cell.bgView.isHidden = true
                cell.zanBtn.isSelected = true
            }
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: homeVideoDetailConmentHeader) as! TASampleTableHeaderView
        
        headerView.contentView.backgroundColor = kBackgroundColor
        headerView.contentLab.text = "最新评论"
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.000001
        }
        return 34
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.000001
        
    }
}

extension TAHomeVideoDetailVC: BMPlayerDelegate {
    
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState) {
        
    }
    
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
//        self.currentTime = currentTime
    }
    
    func bmPlayer(player: BMPlayer, playerIsPlaying playing: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerOrientChanged isFullscreen: Bool) {
        //        self.player.snp.remakeConstraints { (make) in
        //            make.top.left.right.equalTo(view)
        //            if isFullscreen {
        //                make.bottom.equalTo(view)
        //            } else {
        //                make.height.equalTo(view.snp.width).multipliedBy(9.0/16.0).priority(500)
        //            }
        //        }
    }
    
}
