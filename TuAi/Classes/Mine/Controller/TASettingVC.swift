//
//  TASettingVC.swift
//  TuAi
//
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

private let mySettingCellOne = "mySettingCellOne"
private let mySettingCellTwo = "mySettingCellTwo"


class TASettingVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "设置"
        view.addSubview(loginOutBtn)
        
        loginOutBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(kTitleAndStateHeight)
            make.bottom.equalTo(loginOutBtn.snp.top)
        }    }

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
        
        table.register(TACommonCell.self, forCellReuseIdentifier: mySettingCellOne)
        table.register(TASettingCell.self, forCellReuseIdentifier: mySettingCellTwo)
        
        
        return table
    }()
    
    /// 退出我的账号
    lazy var loginOutBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kRedFontColor, for: .normal)
        btn.setTitle("退出我的账号", for: .normal)
        btn.addTarget(self, action: #selector(clickedLoginOutBtn), for: .touchUpInside)
        
        return btn
    }()
    /// 退出我的账号
    @objc func clickedLoginOutBtn(){
        
    }
    /// 视频播放网络选择
    func goAuToPlayVC(){
        let auToPlayVC = TASettingAutoPlayVC()
        self.navigationController?.pushViewController(auToPlayVC, animated: true)
    }
    /// 字体大小
    func goModifyFont(){
        let fontVC = TAModifyFontVC()
        self.navigationController?.pushViewController(fontVC, animated: true)
    }
    /// 账号和安全
    func goAccountVC(){
        let accountVC = TAAccountAndSafeVC()
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
}

extension TASettingVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: mySettingCellTwo) as! TASettingCell
            
            cell.rightIconView.isHidden = false
            cell.switchView.isHidden = true
            if indexPath.row == 0{
                cell.nameLab.text = "无图模式"
                cell.desLab.text = "使用非WI-FI网络时不下载图片"
                cell.rightIconView.isHidden = true
                cell.switchView.isHidden = false
            }else if indexPath.row == 1{
                cell.nameLab.text = "视频自动播放"
                cell.desLab.text = "仅WI-FI"
            }else if indexPath.row == 2{
                cell.nameLab.text = "字体大小"
                cell.desLab.text = "小"
            }
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: mySettingCellOne) as! TACommonCell
            
            if indexPath.row == 0{
                cell.nameLab.text = "账号和安全"
                cell.desLab.isHidden = true
            }else if indexPath.row == 1{
                cell.nameLab.text = "清除缓存"
                cell.desLab.text = "264MB"
                cell.desLab.isHidden = false
            }
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1{/// 视频播放网络选择
                goAuToPlayVC()
            }else if indexPath.row == 2{// 字体大小
                goModifyFont()
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0{///账号和安全
                goAccountVC()
            }else{/// 清理缓存
                MBProgressHUD.showAutoDismissHUD(message: "清理完成")
            }
        }
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.00001
        }
        return kMargin
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
