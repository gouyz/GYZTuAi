//
//  TAHelpAndSuggestVC.swift
//  TuAi
//  帮助与反馈
//  Created by gouyz on 2018/3/22.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD
import DKImagePickerController

class TAHelpAndSuggestVC: GYZBaseWhiteNavVC {
    
    ///txtView 提示文字
    let placeHolder = "欢迎反馈任何意见和问题，您的反馈也是我们产品进步的动力哦！"
    /// 选择的图片
    var selectImgs: [UIImage] = []
    /// 最大选择图片数量
    var maxImgCount: Int = 6
    //// 最大字数
    let contentMaxCount: Int = 200
    // 反馈内容
    var suggestContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "帮助与反馈"
        
        setUpUI()
        contentTxtView.delegate = self
        contentTxtView.text = placeHolder
        
        fontCountLab.text =  "\(contentTxtView.text.count)/\(contentMaxCount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI(){
        
        bgView.backgroundColor = kWhiteColor
        view.addSubview(bgView)
        bgView.addSubview(contentTxtView)
        bgView.addSubview(fontCountLab)
        bgView.addSubview(addPhotosView)
        view.addSubview(submitBtn)
        
        addPhotosView.delegate = self
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.left.right.equalTo(view)
        }
        contentTxtView.snp.makeConstraints { (make) in
            make.left.top.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.height.equalTo(150)
        }
        fontCountLab.snp.makeConstraints { (make) in
            make.right.left.equalTo(contentTxtView)
            make.top.equalTo(contentTxtView.snp.bottom)
            make.height.equalTo(20)
        }
        addPhotosView.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentTxtView)
            make.top.equalTo(fontCountLab.snp.bottom).offset(kMargin)
            make.height.equalTo(kPhotosImgHeight)
            make.bottom.equalTo(-kMargin)
        }
        
        submitBtn.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.top.equalTo(bgView.snp.bottom).offset(30)
            make.height.equalTo(kBottomTabbarHeight)
        }
    }
    
    /// 背景View
    lazy var bgView: UIView = UIView()
    
    /// 反馈描述
    lazy var contentTxtView: UITextView = {
        
        let txtView = UITextView()
        txtView.font = k15Font
        txtView.textColor = kGaryFontColor
        
        return txtView
    }()
    /// 限制字数
    lazy var fontCountLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kGaryFontColor
        lab.textAlignment = .right
        
        return lab
    }()
    /// 添加照片View
    lazy var addPhotosView: TAAddPhotoView = TAAddPhotoView()
    
    /// 提交
    lazy var submitBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("提  交", for: .normal)
        btn.addTarget(self, action: #selector(clickedSubmitBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    /// 提交
    @objc func clickedSubmitBtn(){
        
    }
    
    ///打开相机
    func openCamera(){
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            MBProgressHUD.showAutoDismissHUD(message: "该设备无摄像头")
            return
        }
        
        GYZOpenCameraPhotosTool.shareTool.checkCameraPermission { (granted) in
            if granted{
                let photo = UIImagePickerController()
                photo.delegate = self
                photo.sourceType = .camera
                photo.allowsEditing = true
                self.present(photo, animated: true, completion: nil)
            }else{
                GYZOpenCameraPhotosTool.shareTool.showPermissionAlert(content: "请在iPhone的“设置-隐私”选项中，允许访问你的摄像头",controller : self)
            }
        }
        
    }
    
    ///打开相册
    func openPhotos(){
        
        let pickerController = DKImagePickerController()
        pickerController.maxSelectableCount = maxImgCount
        
        weak var weakSelf = self
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            
            var count = 0
            for item in assets {
                item.fetchFullScreenImageWithCompleteBlock({ (image, info) in
                    
                    weakSelf?.selectImgs.append(image!)
                    weakSelf?.maxImgCount = kMaxSelectCount - (weakSelf?.selectImgs.count)!
                    
                    count += 1
                    if count == assets.count{
                        weakSelf?.resetAddImgView()
                    }
                })
            }
        }
        
        self.present(pickerController, animated: true) {}
    }
}

extension TAHelpAndSuggestVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        guard let image = info[picker.allowsEditing ? UIImagePickerControllerEditedImage : UIImagePickerControllerOriginalImage] as? UIImage else { return }
        picker.dismiss(animated: true) { [weak self] in
            
            if self?.selectImgs.count == kMaxSelectCount{
                MBProgressHUD.showAutoDismissHUD(message: "最多只能上传\(kMaxSelectCount)张图片")
                return
            }
            self?.selectImgs.append(image)
            self?.maxImgCount -= 1
            self?.resetAddImgView()
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    /// 选择图片后重新设置图片显示
    func resetAddImgView(){
        var rowIndex = ceil(CGFloat.init(selectImgs.count) / 3.0)//向上取整
        /// 预留出增加按钮位置
        if selectImgs.count < kMaxSelectCount && selectImgs.count % 3 == 0 {
            rowIndex += 1
        }
        let height = kPhotosImgHeight * rowIndex + kMargin * (rowIndex - 1)
        
        addPhotosView.snp.updateConstraints({ (make) in
            make.height.equalTo(height)
        })
        addPhotosView.selectImgs = selectImgs
    }
}

extension TAHelpAndSuggestVC : UITextViewDelegate,TAAddPhotoViewDelegate
{
    ///MARK TAAddPhotoViewDelegate
    ///添加图片
    func didClickAddImage() {
        GYZAlertViewTools.alertViewTools.showSheet(title: "选择照片", message: nil, cancleTitle: "取消", titleArray: ["拍照","从相册选取"], viewController: self) { [weak self](index) in
            
            if index == 0{//拍照
                self?.openCamera()
            }else if index == 1 {//从相册选取
                self?.openPhotos()
            }
        }
    }
    ///删除 图片
    func didClickDeleteImage(index: Int) {
        selectImgs.remove(at: index)
        maxImgCount += 1
        resetAddImgView()
    }
    
    ///MARK UITextViewDelegate
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
        
        if textView.text.count > contentMaxCount - 20 {
            
            //获得已输出字数与正输入字母数
            let selectRange = textView.markedTextRange
            
            //获取高亮部分 － 如果有联想词则解包成功
            if let selectRange =   selectRange {
                let position =  textView.position(from: (selectRange.start), offset: 0)
                if (position != nil) {
                    return
                }
            }
            
            let textContent = textView.text
            let textNum = textContent?.count
            
            //截取200个字
            if textNum! > contentMaxCount {
                let index = textContent?.index((textContent?.startIndex)!, offsetBy: contentMaxCount)
                let str = textContent?.substring(to: index!)
                textView.text = str
            }
        }
        
        self.fontCountLab.text =  "\(textView.text.count)/\(contentMaxCount)"
        suggestContent = textView.text
    }
}
