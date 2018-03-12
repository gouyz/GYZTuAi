//
//  TABindAccountVC.swift
//  TuAi
//  社交账号绑定
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let bindAccountCell = "bindAccountCell"

class TABindAccountVC: GYZBaseWhiteNavVC {

    let titleArr: [String] = ["微信账号","QQ账号","微博账号"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "社交账号绑定"
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
        table.separatorColor = kGrayLineColor
        
        table.register(TASettingCell.self, forCellReuseIdentifier: bindAccountCell)
        
        
        return table
    }()
    
    /// 修改密码
    func goPwdVC(){
        let pwdConfirmVC = TAPwdConfirmCodeVC()
        self.navigationController?.pushViewController(pwdConfirmVC, animated: true)
    }
    /// 修改手机号
    func goModifyPhone(){
        let phoneVC = TAModifyPhoneVC()
        self.navigationController?.pushViewController(phoneVC, animated: true)
    }
    /// 修改邮箱
    func goModifyEmail(){
        let emailVC = TASettingEmailVC()
        self.navigationController?.pushViewController(emailVC, animated: true)
    }
}

extension TABindAccountVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: bindAccountCell) as! TASettingCell
        
        cell.rightIconView.isHidden = true
        cell.nameLab.text = titleArr[indexPath.row]
        if indexPath.row == 1 {//QQ
            cell.desLab.text = "已绑定"
            cell.switchView.isOn = true
        }else if indexPath.row == 2 { //邮箱
            cell.desLab.text = "未绑定"
            cell.switchView.isOn = false
        }else{
            cell.desLab.text = "未绑定"
            cell.switchView.isOn = false
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
