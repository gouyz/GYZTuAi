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
    
    var typeArr: [String] = ["语文","数学","英语","物理","化学","生物","历史","地理"]
    /// 分类高度
    var typeHeight: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kWhiteColor
        self.navigationItem.title = "辅导"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named:"icon_home_comment"), style: .done, target: self, action: #selector(clickedMessagesBtn))
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if typeArr.count > 0 {
            typeHeight = HXTagsView.getHeightWithTags(typeArr, layout: tagsLayout, tagAttribute: nil, width: kScreenWidth)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 标签layout
    var tagsLayout: HXTagCollectionViewFlowLayout = {
       
        let layout = HXTagCollectionViewFlowLayout()
        /// 显示多行
        layout.scrollDirection = .vertical
        
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: (kScreenWidth - 3 * kMargin) * 0.5, height: 160)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        layout.sectionInset = UIEdgeInsets.init(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        collView.showsHorizontalScrollIndicator = false
        collView.showsVerticalScrollIndicator = false
        
        collView.register(TAFuDaoCell.self, forCellWithReuseIdentifier: fuDaoCell)
        
        collView.register(TAFuDaoHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: fuDaoHeader)
        
        return collView
    }()
    
    /// 消息
    @objc func clickedMessagesBtn(){
        
    }
}

extension TAFuDaoVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
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
    // 返回自定义HeadView或者FootView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: fuDaoHeader, for: indexPath) as! TAFuDaoHeaderView
            
            
            (reusableview as! TAFuDaoHeaderView).tagsView.snp.updateConstraints({ (make) in
                make.height.equalTo(typeHeight)
            })
            (reusableview as! TAFuDaoHeaderView).tagsView.tags = typeArr
            if typeArr.count > 0{
                (reusableview as! TAFuDaoHeaderView).tagsView.selectedTags = [typeArr[0]]
            }
            
            (reusableview as! TAFuDaoHeaderView).tagsView.completion = {[weak self] (selectedTags,selectedIndex) in
                
//                self?.mSelectedTypeIndex = selectedIndex
            }
            (reusableview as! TAFuDaoHeaderView).tagsView.reloadData()
        }
        
        return reusableview
    }
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    //MARK: UICollectionViewDelegateFlowLayout
    // 返回HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: kScreenWidth, height: 160 + typeHeight + 30)
    }
}
