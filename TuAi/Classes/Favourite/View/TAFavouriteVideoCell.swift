//
//  TAFavouriteVideoCell.swift
//  TuAi
//  收藏cell
//  Created by gouyz on 2018/3/9.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let favouriteVideoCell = "favouriteVideoCell"

class TAFavouriteVideoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kBackgroundColor
        
        contentView.addSubview(bgView)
        bgView.addSubview(userImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(desLab)
        bgView.addSubview(collectionView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(5)
            make.centerY.height.equalTo(userImgView)
            make.right.equalTo(-kMargin)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(bgView)
            make.top.equalTo(desLab.snp.bottom).offset(5)
            make.height.equalTo(120)
        }
    }
    
    lazy var bgView: UIView = UIView()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = kGaryFontColor
        imgView.cornerRadius = 12
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "小胖子"
        
        return lab
    }()
    
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kGaryFontColor
        lab.font = k12Font
        lab.text = "儿童教育学专家"
        
        return lab
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //设置cell的大小
        layout.itemSize = CGSize(width: 150, height: 120)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = kMargin
        //每行之间最小的间距
        layout.minimumLineSpacing = kMargin
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        collView.showsHorizontalScrollIndicator = false
        
        collView.register(TAFavouriteVideoChildCell.self, forCellWithReuseIdentifier: favouriteVideoCell)
        
        return collView
    }()
}

extension TAFavouriteVideoCell : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteVideoCell, for: indexPath) as! TAFavouriteVideoChildCell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
