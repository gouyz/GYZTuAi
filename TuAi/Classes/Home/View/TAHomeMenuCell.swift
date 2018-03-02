//
//  TAHomeMenuCell.swift
//  TuAi
//  精华 menu cell
//  Created by gouyz on 2018/3/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class TAHomeMenuCell: UITableViewCell {
    /// 代理变量
    weak var delegate : TAHomeMenuCellDelegate?
    
    /// 填充数据
    var menuDataArr : [TAHomeFuncModel]?{
        didSet{
            if let menuArr = menuDataArr {
                for index in 0 ..< 8{
                    
                    let btnView: TAFuncModelView = contentView.viewWithTag(100 + index) as! TAFuncModelView
                    
                    let model  = menuArr[index]
                    
                    btnView.menuImg.image = UIImage.init(named: model.image!)
                    btnView.menuTitle.text = model.title!
                    
                }
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        
        return view
    }()
    
    func setupUI(){
        
        contentView.addSubview(bgView)
        
        let width : CGFloat = kScreenWidth * 0.25
        
        for index in 0 ..< 8 {
            
            /// 行数,向下取整
            let rows : Int = Int(floor(Double(index/4)))
            /// 列数
            let colums : Int = index % 4
            
            let menuView = TAFuncModelView(frame:CGRect(x: CGFloat(colums) * width, y:CGFloat( rows * 90), width: width, height: 90.0), iconName: "", title: "")
            menuView.tag = 100 + index
            bgView.addSubview(menuView)
            menuView.addOnClickListener(target: self, action: #selector(menuViewClick(sender : )))
            
        }
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(contentView)
            make.height.equalTo(180)
        }
    }
    ///点击事件
    @objc func menuViewClick(sender : UITapGestureRecognizer){
        let tag = sender.view?.tag
        delegate?.didSelectMenuIndex(index: tag! - 100)
        GYZLog(tag)
    }
}

protocol TAHomeMenuCellDelegate : NSObjectProtocol {
    func didSelectMenuIndex(index : Int)
}
