//
//  TAJiGouDetailVC.swift
//  TuAi
//  机构详情
//  Created by gouyz on 2018/3/20.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let jiGouDetailCell = "jiGouDetailCell"
private let jiGouDetailHeader = "jiGouDetailHeader"

class TAJiGouDetailVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarBgAlpha = 0
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(UIEdgeInsets.init(top: -kTitleAndStateHeight, left: 0, bottom: 0, right: 0))
            }else{
                make.edges.equalTo(0)
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
        ///设置cell的大小
        layout.itemSize = CGSize(width: itemW, height: 180)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        layout.sectionInset = UIEdgeInsets.init(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        /// header size
        layout.headerReferenceSize = CGSize.init(width: kScreenWidth, height: 360)
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        
        collView.register(TAJiGouDetailCell.self, forCellWithReuseIdentifier: jiGouDetailCell)
        collView.register(TAJiGouDetailHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: jiGouDetailHeader)
        
        return collView
    }()
}

extension TAJiGouDetailVC : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: jiGouDetailCell, for: indexPath) as! TAJiGouDetailCell
        
        return cell
    }
    
    // 返回自定义HeadView或者FootView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: jiGouDetailHeader, for: indexPath) as! TAJiGouDetailHeaderView
            
            let headerView = reusableview as! TAJiGouDetailHeaderView
            headerView.zongHeScoreView.scoreLab.text = "4.5"
            headerView.zongHeScoreView.processView.snp.updateConstraints({ (make) in
                make.width.equalTo(150/5.0*4.5)
            })
            headerView.teacherScoreView.scoreLab.text = "4.0"
            headerView.teacherScoreView.processView.snp.updateConstraints({ (make) in
                make.width.equalTo(150/5.0*4.0)
            })
            headerView.parentScoreView.scoreLab.text = "5.0"
            headerView.parentScoreView.processView.snp.updateConstraints({ (make) in
                make.width.equalTo(150/5.0*5.0)
            })
        }
        
        return reusableview
    }
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let keChengDetailVC = TAKeChengDetailVC()
        navigationController?.pushViewController(keChengDetailVC, animated: true)
    }
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        let showNavBarOffsetY = kTitleAndStateHeight - topLayoutGuide.length
        
        
        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {
            
            var navAlpha = (contentOffsetY - (showNavBarOffsetY)) / 100.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            self.navigationItem.title = "机构详情"
        }else{
            navBarBgAlpha = 0
            self.navigationItem.title = ""
        }
    }
}
