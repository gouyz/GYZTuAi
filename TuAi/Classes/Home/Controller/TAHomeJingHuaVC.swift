//
//  TAHomeJingHuaVC.swift
//  TuAi
//  首页 精华
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit


private let homeFuncMenuCell = "homeFuncMenuCell"
private let homeJingHuaCell = "homeJingHuaCell"
private let homeJingHuaHeader = "homeJingHuaHeader"

class TAHomeJingHuaVC: GYZBaseVC {
    
    /// 功能menu
    var mFuncModels: [TAHomeFuncModel] = [TAHomeFuncModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let plistPath : String = Bundle.main.path(forResource: "menuData", ofType: "plist")!
        let menuArr : [[String:String]] = NSArray(contentsOfFile: plistPath) as! [[String : String]]
        
        for item in menuArr{
            
            let model = TAHomeFuncModel.init(dict: item)
            mFuncModels.append(model)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, kTabBarHeight, 0))
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
        
        table.register(TAHomeMenuCell.self, forCellReuseIdentifier: homeFuncMenuCell)
        table.register(TAJingHuaHeaderView.self, forHeaderFooterViewReuseIdentifier: homeJingHuaHeader)
        table.register(TAJingHuaCell.self, forCellReuseIdentifier: homeJingHuaCell)
        
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

extension TAHomeJingHuaVC : UITableViewDelegate,UITableViewDataSource,TAHomeMenuCellDelegate{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {//功能cell
            let cell = tableView.dequeueReusableCell(withIdentifier: homeFuncMenuCell) as! TAHomeMenuCell
            
            cell.delegate = self
            cell.menuDataArr = mFuncModels
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: homeJingHuaCell) as! TAJingHuaCell
            
            
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: homeJingHuaHeader) as! TAJingHuaHeaderView
            
            return headerView
        }else{
            
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 70
        }
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    
    /// MARK: TAHomeMenuCellDelegate
    func didSelectMenuIndex(index: Int) {
        goController(menu: mFuncModels[index])
    }
    ///控制跳转
    func goController(menu: TAHomeFuncModel){
        //1:动态获取命名空间
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            GYZLog("获取命名空间失败")
            return
        }
        
        let cls: AnyClass? = NSClassFromString(name + "." + menu.controller!) //VCName:表示试图控制器的类名
        
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typeClass = cls as? GYZBaseVC.Type else {
            GYZLog("cls不能当做UIViewController")
            return
        }
        
        let controller = typeClass.init()
        navigationController?.pushViewController(controller, animated: true)
    }
}
