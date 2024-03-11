//
//  GuideController.swift
//  MyCloudMusic
//  引导界面
//  Created by 王士文啊帅比 on 2023/11/20.
//

import UIKit
import TangramKit
import Moya
import RxSwift
import NSObject_Rx
class GuideController: BaseLogicController {
    var bannerView:YJBannerView!
    
    override func initViews() {
        super.initViews()
        initLinearLayoutSafeArea()
        
        
        bannerView = YJBannerView()
        bannerView.backgroundColor = .clear
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.tg_width.equal(.fill)
        bannerView.tg_height.equal(.fill)
        bannerView.emptyImage = R.image.placeholderError()
        //图片没下载完之前，显示的图片
        bannerView.placeholderImage = R.image.placeholder()
        bannerView.bannerViewSelectorString = "sd_sertImageWithURL:placeholderImage:"
        bannerView.pageControlNormalColor = .black80
        bannerView.pageControlHighlightColor = .colorPrimary
        bannerView.reloadData()
        container.addSubview(bannerView)
        
        
        //按钮容器
        let controlContainer = TGLinearLayout(.horz)
        controlContainer.tg_bottom.equal(PADDING_MIN)
        controlContainer.tg_width.equal(.fill)
        controlContainer.tg_height.equal(.wrap)
        
        //水平拉伸，左中右间距一样
        controlContainer.tg_gravity = TGGravity.horz.among
        container.addSubview(controlContainer)
        
        //登录注册按钮
        let primaryButton = ViewFactoryUtil.primaryButton()
        primaryButton.setTitle(R.string.localizable.loginOrRegister(), for: .normal)
        primaryButton.addTarget(self, action: #selector(primaryClick(_:)), for: .touchUpInside)
        primaryButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(primaryButton)
        
        
        //立即体验按钮
        let enterButton = ViewFactoryUtil.primaryOutlineButton()
        enterButton.setTitle(R.string.localizable.experienceNow(), for: .normal)
        enterButton.addTarget(self, action: #selector(enterClick(_:)), for: .touchUpInside)
        enterButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(enterButton)
    }
    
    /// 登录按钮点击
    /// - Parameter sender:
    @objc func primaryClick(_ sender:QMUIButton) {
        AppDelegate.shared.toLogin()
    }
    /// 立即体验按钮点击
    /// - Parameter sender:
    @objc func enterClick(_ sender:QMUIButton) {
        AppDelegate.shared.toMain()
    }

}

//MARK: - YJBannerViewDataSource
//添加协议，直接在上面写一样，不过这样好管理
extension GuideController:YJBannerViewDataSource {
    /// banner数据源
    ///
    /// - Parameter bannerView: <#bannerView description#>
    /// - Returns: <#return value description#>
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["guide1","guide2","guide3","guide4","guide5"]
    }
    /// 自定义Cell
    /// 复写该方法的目的是
    /// 设置图片的缩放模式
    ///
    /// - Parameters:
    ///   - bannerView: <#bannerView description#>
    ///   - customCell: <#customCell description#>
    ///   - index: <#index description#>
    /// - Returns: <#return value description#>
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        //将cell类型转为YJBannerViewCell
        let cell = customCell as! YJBannerViewCell

        //设置图片的缩放模式为
        //从中心填充
        //多余的裁剪掉
        cell.showImageViewContentMode = .scaleAspectFit

        return cell
    }
}
extension GuideController:YJBannerViewDelegate {
    
    
    
}
