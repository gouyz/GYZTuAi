//
//  TAAblumVC.swift
//  TuAi
//  相册
//  Created by gouyz on 2018/3/17.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let ablumCell = "ablumCell"

class TAAblumVC: GYZBaseWhiteNavVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "相册"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
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
        layout.itemSize = CGSize(width: itemW, height: itemW + 30)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        layout.sectionInset = UIEdgeInsets.init(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        
        collView.register(TAAblumCell.self, forCellWithReuseIdentifier: ablumCell)
        
        return collView
    }()
}

extension TAAblumVC : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ablumCell, for: indexPath) as! TAAblumCell
        
        if indexPath.row == 11 {
            cell.ablumImgView.image = UIImage.init(named: "icon_ablum_add")
            cell.nameLab.text = "创建相册"
        }else{
            cell.ablumImgView.image = UIImage.init(named: "")
            cell.nameLab.text = "宝宝成长记"
        }
        return cell
    }
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
