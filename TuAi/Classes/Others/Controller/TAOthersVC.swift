//
//  TAOthersVC.swift
//  TuAi
//  其他 中间加号
//  Created by gouyz on 2018/2/26.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAOthersVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.delegate = self
        
        view.addSubview(bgImgView)
        bgImgView.isUserInteractionEnabled = true
        bgImgView.addSubview(tuWenView)
        bgImgView.addSubview(videoView)
        bgImgView.addSubview(lineView)
        bgImgView.addSubview(cancleImgView)
        
        bgImgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        tuWenView.snp.makeConstraints { (make) in
            make.right.equalTo(bgImgView.snp.centerX)
            make.bottom.equalTo(lineView.snp.top).offset(-kTitleHeight)
            make.size.equalTo(CGSize.init(width: 130, height: 130))
        }
        videoView.snp.makeConstraints { (make) in
            make.left.equalTo(bgImgView.snp.centerX)
            make.bottom.size.equalTo(tuWenView)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgImgView)
            make.bottom.equalTo(cancleImgView.snp.top).offset(-kMargin)
            make.height.equalTo(klineWidth)
        }
        cancleImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImgView)
            make.bottom.equalTo(-kMargin - kSafeAreaBottomHeight)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        
        cancleImgView.addOnClickListener(target: self, action: #selector(clickedCancle))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 毛玻璃背景
    lazy var bgImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_adatricle_bg"))
    /// 发图文
    lazy var tuWenView: TAFuncModelView = {
        let sendView = TAFuncModelView()
        sendView.imgSize = CGSize.init(width: 60, height: 60)
        sendView.menuImg.image = UIImage.init(named: "icon_send_tuwen")
        sendView.menuTitle.text = "发图文"
        
        return sendView
    }()
    /// 发视频
    lazy var videoView: TAFuncModelView = {
        let sendView = TAFuncModelView()
        sendView.imgSize = CGSize.init(width: 60, height: 60)
        sendView.menuImg.image = UIImage.init(named: "icon_send_video")
        sendView.menuTitle.text = "发视频"
        
        return sendView
    }()
    
    /// 分割线
    fileprivate var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    
    /// 取消
    lazy var cancleImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_others_cancle"))
    
    //// 取消事件
    @objc func clickedCancle(){
        self.dismiss(animated: true, completion: nil)
    }
}

/// mark - UINavigationControllerDelegate
extension TAOthersVC : UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        /// 隐藏导航栏
        let isShow = viewController.isKind(of: TAOthersVC.self)
        self.navigationController?.setNavigationBarHidden(isShow, animated: true)
    }
}
