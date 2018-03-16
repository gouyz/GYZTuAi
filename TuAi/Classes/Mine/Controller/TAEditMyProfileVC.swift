//
//  TAEditMyProfileVC.swift
//  TuAi
//  编辑个人资料
//  Created by gouyz on 2018/3/16.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let editMyProfileCell = "editMyProfileCell"
private let editMyProfileFooter = "editMyProfileFooter"

class TAEditMyProfileVC: GYZBaseWhiteNavVC {
    
    /// 性别
    var isMan: Bool = true
    
    let titleArr: [String] = ["昵称","职业","个性签名","宝宝乳名","宝宝年龄"]
    let contentArr: [String] = ["大丸子","","","",""]
    let placeholderArr: [String] = ["请输入昵称","请输入职业","编辑个性签名","请输入宝宝乳名","请选择宝宝年龄"]
    
    ///txtView 提示文字
    let placeHolder = "(添加对宝宝的祝福)"
    // 宝宝寄语
    var noteContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "编辑个人资料"
        
        let rightBtn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 60, height: kTitleHeight))
        rightBtn.setTitle("完成", for: .normal)
        rightBtn.setTitleColor(kBlueFontColor, for: .normal)
        rightBtn.titleLabel?.font = k15Font
        rightBtn.addTarget(self, action: #selector(onClickedFinished), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        tableView.tableHeaderView = headerView
        
        headerView.manBtn.addTarget(self, action: #selector(clickedManBtn), for: .touchUpInside)
        headerView.womanBtn.addTarget(self, action: #selector(clickedWoManBtn), for: .touchUpInside)
        
        checkSex()
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
        
        table.register(TAEditMyProfileCell.self, forCellReuseIdentifier: editMyProfileCell)
        table.register(TAEditMyProfileFooterView.self, forHeaderFooterViewReuseIdentifier: editMyProfileFooter)
        
        return table
    }()
    
    lazy var headerView: TAEditMyProfileHeaderView = TAEditMyProfileHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 190))
    
    /// 完成编辑
    @objc func onClickedFinished(){
        
    }
    
    /// 性别女
    @objc func clickedWoManBtn(){
        isMan = false
        checkSex()
    }
    /// 性别男
    @objc func clickedManBtn(){
        isMan = true
        checkSex()
    }
    ///判断性别
    func checkSex(){
        if isMan {
            headerView.womanBtn.isSelected = false
            headerView.womanBtn.borderColor = kGaryFontColor
            headerView.womanBtn.backgroundColor = kWhiteColor
            headerView.manBtn.isSelected = true
            headerView.manBtn.borderColor = kBtnClickBGColor
            headerView.manBtn.backgroundColor = kBtnClickBGColor
        }else{
            headerView.manBtn.isSelected = false
            headerView.manBtn.borderColor = kGaryFontColor
            headerView.manBtn.backgroundColor = kWhiteColor
            headerView.womanBtn.isSelected = true
            headerView.womanBtn.borderColor = kBtnClickBGColor
            headerView.womanBtn.backgroundColor = kBtnClickBGColor
        }
    }
}

extension TAEditMyProfileVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: editMyProfileCell) as! TAEditMyProfileCell
        
        cell.nameLab.text = titleArr[indexPath.row]
        cell.textFiled.placeholder = placeholderArr[indexPath.row]
        cell.textFiled.text = contentArr[indexPath.row]
        
        if indexPath.row == titleArr.count - 1 {
            cell.textFiled.isEnabled = false
            cell.rightIconView.isHidden = false
        }else{
            cell.textFiled.isEnabled = true
            cell.rightIconView.isHidden = true
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: editMyProfileFooter) as! TAEditMyProfileFooterView
        
        footerView.noteTxtView.text = placeHolder
        footerView.noteTxtView.delegate = self
        
        return footerView
    }
    
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 160
        
    }
}

extension TAEditMyProfileVC : UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        let text = textView.text
        if text == placeHolder {
            textView.text = ""
            textView.textColor = kBlackFontColor
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = kGaryFontColor
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        
        let text : String = textView.text
        
        noteContent = text
    }
}
