//
//  TAMineVC.swift
//  TuAi
//  我的
//  Created by gouyz on 2018/2/26.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let mineMenuHeader = "mineMenuHeader"
private let mineMenuFooter = "mineMenuFooter"
private let mineMenuCell = "mineMenuCell"

class TAMineVC: GYZBaseVC {
    
    /// 功能menu
    var mFuncModels: [[TAHomeFuncModel]] = [[TAHomeFuncModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的"
        
        getMineMenu()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 读取功能文件
    func getMineMenu(){
        let plistPath : String = Bundle.main.path(forResource: "mineMenuData", ofType: "plist")!
        let menuArr : [[[String:String]]] = NSArray(contentsOfFile: plistPath) as! [[[String : String]]]
        
        for itemArr in menuArr {
            
            var modelArr : [TAHomeFuncModel] = [TAHomeFuncModel]()
            for item in itemArr{
                
                let model = TAHomeFuncModel.init(dict: item)
                modelArr.append(model)
            }
            
            mFuncModels.append(modelArr)
        }
        
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: kScreenWidth * 0.25, height: 90)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距
        layout.minimumLineSpacing = 0
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        
        collView.register(TAMineFuncCell.self, forCellWithReuseIdentifier: mineMenuCell)
        
        collView.register(TAMineUserHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: mineMenuHeader)
        
        collView.register(TACollectionBlankFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: mineMenuFooter)
        
        return collView
    }()
    
    ///控制跳转
    func goController(menu: TAHomeFuncModel){
        //1:动态获取命名空间
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            GYZLog("获取命名空间失败")
            return
        }
        
        let cls: AnyClass? = NSClassFromString(name + "." + menu.controller!) //VCName:表示试图控制器的类名
        
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typeClass = cls as? GYZBaseWhiteNavVC.Type else {
            GYZLog("cls不能当做UIViewController")
            return
        }
        
        let controller = typeClass.init()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    /// 登录
    @objc func goLoginClicked(){
        let loginVC = GYZLoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

extension TAMineVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mFuncModels.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mFuncModels[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mineMenuCell, for: indexPath) as! TAMineFuncCell
        
        cell.menuData = mFuncModels[indexPath.section][indexPath.row]
        
        return cell
    }
    
    // 返回自定义HeadView或者FootView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            
            if indexPath.section == 0{
                reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: mineMenuHeader, for: indexPath) as! TAMineUserHeaderView
                
                (reusableview as! TAMineUserHeaderView).bgView.addOnClickListener(target: self, action: #selector(goLoginClicked))
            }
        }else if kind == UICollectionElementKindSectionFooter{
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: mineMenuFooter, for: indexPath) as! TACollectionBlankFooterView
        }
        
        return reusableview
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        goController(menu: mFuncModels[indexPath.section][indexPath.row])
    }
    //MARK: UICollectionViewDelegateFlowLayout
    // 返回footview的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: kScreenWidth, height: kMargin)
        }
        return CGSize(width: kScreenWidth, height: 0)
    }
    // 返回HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: kScreenWidth, height: 90)
        }
        return CGSize(width: kScreenWidth, height: 0)
    }
}
