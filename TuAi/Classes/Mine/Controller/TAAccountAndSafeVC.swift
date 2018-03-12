//
//  TAAccountAndSafeVC.swift
//  TuAi
//  账号和安全
//  Created by gouyz on 2018/3/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let accountAndSafeCell = "accountAndSafeCell"

class TAAccountAndSafeVC: GYZBaseWhiteNavVC {
    
    let titleArr: [String] = ["修改账号密码","手机号","邮箱","社交账号绑定"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "账号和安全"
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
        
        table.register(TACommonCell.self, forCellReuseIdentifier: accountAndSafeCell)
        
        
        return table
    }()
    
    /// 修改密码
    func goPwdVC(){
        let pwdConfirmVC = TAPwdConfirmCodeVC()
        self.navigationController?.pushViewController(pwdConfirmVC, animated: true)
    }
}

extension TAAccountAndSafeVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: accountAndSafeCell) as! TACommonCell
        
        cell.nameLab.text = titleArr[indexPath.row]
        if indexPath.row == 1 {//手机号
            cell.desLab.text = "138****1111"
        }else if indexPath.row == 2 { //邮箱
            cell.desLab.text = "123456789qq.com"
        }else{
            cell.desLab.text = ""
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
        
        if indexPath.row == 0 {// 修改密码
            goPwdVC()
        }
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
