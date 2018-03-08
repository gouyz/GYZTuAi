//
//  TAFuDaoVC.swift
//  TuAi
//  辅导
//  Created by gouyz on 2018/3/8.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let fuDaoCell = "fuDaoCell"
private let fuDaoHeader = "fuDaoHeader"

class TAFuDaoVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kWhiteColor
        self.navigationItem.title = "辅导"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: kMargin, bottom: 0, right: kMargin))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: (kScreenWidth-kMargin * 3) * 0.5, height: 160)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        
        collView.register(TAFuDaoCell.self, forCellWithReuseIdentifier: fuDaoCell)
        
//        collView.register(TAMineUserHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: fuDaoHeader)
        
        return collView
    }()
}

extension TAFuDaoVC : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fuDaoCell, for: indexPath) as! TAFuDaoCell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
