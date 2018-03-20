//
//  TAAblumDetailVC.swift
//  TuAi
//  相册详情/编辑相册
//  Created by gouyz on 2018/3/19.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let ablumDetailCell = "ablumDetailCell"
private let ablumDetailHeader = "ablumDetailHeader"

class TAAblumDetailVC: GYZBaseWhiteNavVC {
    
    ///是否是编辑
    var isEdit: Bool = false
    /// 修改/保存按钮
    var rightBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "宝宝成长记"
        
        rightBtn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 60, height: kTitleHeight))
        rightBtn?.setTitle("编辑", for: .normal)
        rightBtn?.setTitleColor(kBlueFontColor, for: .normal)
        rightBtn?.titleLabel?.font = k14Font
        rightBtn?.addTarget(self, action: #selector(onClickedEditAblum), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn!)
        
        view.addSubview(upLoadBtn)
        view.addSubview(collectionView)
        upLoadBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(upLoadBtn.snp.top)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view)
            }else{
                make.top.equalTo(kTitleAndStateHeight)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let itemW: CGFloat = (kScreenWidth - 3 * kMargin) * 0.5
        //设置cell的大小
        layout.itemSize = CGSize(width: itemW, height: itemW)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        layout.sectionInset = UIEdgeInsets.init(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        
        layout.headerReferenceSize = CGSize.init(width: kScreenWidth, height: kTitleHeight)
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        
        collView.register(TAAblumDetailCell.self, forCellWithReuseIdentifier: ablumDetailCell)
        
        collView.register(TAAblumDetailHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ablumDetailHeader)
        
        return collView
    }()
    
    /// 上传照片
    lazy var upLoadBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("上传照片", for: .normal)
        btn.addTarget(self, action: #selector(clickedUpLoadBtn), for: .touchUpInside)
        
        return btn
    }()
    
    /// 上传照片
    @objc func clickedUpLoadBtn(){
    }
    
    /// 编辑相册
    @objc func onClickedEditAblum(){
        isEdit = !isEdit
        if isEdit {
            upLoadBtn.setTitle("删除照片", for: .normal)
            rightBtn?.setTitle("完成", for: .normal)
        }else{
            upLoadBtn.setTitle("上传照片", for: .normal)
            rightBtn?.setTitle("编辑", for: .normal)
        }
        
        collectionView.reloadData()
    }
}

extension TAAblumDetailVC : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ablumDetailCell, for: indexPath) as! TAAblumDetailCell
        
        if isEdit {
            cell.checkBtn.isHidden = false
        }else{
            cell.checkBtn.isHidden = true
        }
        return cell
    }
    
    // 返回自定义HeadView或者FootView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ablumDetailHeader, for: indexPath) as! TAAblumDetailHeaderView
            
            
//            (reusableview as! TAAblumDetailHeaderView).nameLab.text = ""
        }
        
        return reusableview
    }
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
