//
//  TAKeChengDetailVC.swift
//  TuAi
//  课程详情
//  Created by gouyz on 2018/3/21.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import BMPlayer
import NVActivityIndicatorView
import AVFoundation

class TAKeChengDetailVC: GYZBaseWhiteNavVC {
    
    var titleArr : [String] = ["详情","目录","评论"]
    
    var stateValue : [String] = ["1","2","3"]
    var scrollPageView: ScrollPageView?
    /// 当前播放的时间
    var currentTime: TimeInterval = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        resetPlayerManager()
        
        view.addSubview(player)
        player.snp.makeConstraints { (make) in
            make.top.equalTo(kStateHeight)
            make.left.right.equalTo(view)
           // 注意此处，宽高比 16:9 优先级比 1000 低就行，在因为 iPhone 4S 宽高比不是 16：9
            make.height.equalTo(view.snp.width).multipliedBy(9.0/16.0).priority(500)
        }
        
        player.delegate = self
        player.backBlock = { [unowned self] (isFullScreen) in
            if isFullScreen {
                return
            } else {
                let _ = self.navigationController?.popViewController(animated: true)
            }
        }
        let asset = self.preparePlayerItem()
        player.setVideo(resource: asset)
        
        setScrollView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        // 使用手势返回的时候，调用下面方法
        player.autoPlay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        // 使用手势返回的时候，调用下面方法
        player.pause(allowAutoPlay: true)
    }
    
    deinit {
        // 使用手势返回的时候，调用下面方法手动销毁
        player.prepareToDealloc()
    }
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let detailVC = TAKeChengDetailContentVC()
        
        let listVC = TAKeChengDetailListVC()
        
        let commentVC = TAKeChengDetailConmentVC()
        
        return [detailVC,listVC,commentVC]
    }
    
    /// 设置scrollView
    func setScrollView(){
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
        var style = SegmentStyle()
        // 滚动条
        style.showLine = true
        style.scrollTitle = false
        // 颜色渐变
        style.gradualChangeTitleColor = true
        // 滚动条颜色
        style.scrollLineColor = kBlueFontColor
        style.normalTitleColor = kBlackFontColor
        style.selectedTitleColor = kBlueFontColor
        /// 显示角标
        style.showBadge = false
        
        
        scrollPageView = ScrollPageView.init(frame: CGRect.init(x: 0, y: kScreenWidth * (9.0/16.0) + kMargin, width: kScreenWidth, height: kScreenHeight - kScreenWidth * (9.0/16.0) - kMargin), segmentStyle: style, titles: titleArr, childVcs: setChildVcs(), parentViewController: self)
        view.addSubview(scrollPageView!)
    }
    
    /// 播放器
    lazy var player: BMPlayer = BMPlayer(customControlView: BMPlayerControlView())
    /// 播放器自定义属性 创建播放器前设定
    func resetPlayerManager() {
        // 是否打印日志，默认false
        BMPlayerConf.allowLog = false
        // 是否自动播放，默认true
        BMPlayerConf.shouldAutoPlay = true
        // 主体颜色，默认白色
        BMPlayerConf.tintColor = kWhiteColor
        // 顶部返回和标题显示选项，默认.Always，可选.HorizantalOnly、.None
        BMPlayerConf.topBarShowInCase = .always
        // 加载效果，更多请见：https://github.com/ninjaprox/NVActivityIndicatorView
        BMPlayerConf.loaderType  = NVActivityIndicatorType.lineSpinFadeLoader
    }
    
    /**
     准备播放器资源model
     */
    func preparePlayerItem() -> BMPlayerResource {
        let res0 = BMPlayerResourceDefinition(url: URL(string: "http://baobab.wdjcdn.com/1457162012752491010143.mp4")!,
                                              definition: "高清")
        let res1 = BMPlayerResourceDefinition(url: URL(string: "http://baobab.wdjcdn.com/1457162012752491010143.mp4")!,
                                              definition: "标清")
        
        let asset = BMPlayerResource(name: "周末号外丨中国第一高楼",
                                     definitions: [res0, res1],
                                     cover: URL(string: "http://img.wdjimg.com/image/video/447f973848167ee5e44b67c8d4df9839_0_0.jpeg"))
        return asset
    }
}

extension TAKeChengDetailVC: BMPlayerDelegate {
    
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState) {
        
    }
    
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        self.currentTime = currentTime
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
