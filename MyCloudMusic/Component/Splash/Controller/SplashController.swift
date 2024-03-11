//
//  SplashController.swift
//  MyCloudMusic
//  启动界面
//  Created by 王士文啊帅比 on 2023/11/15.
//

import UIKit
import TangramKit
class SplashController: BaseLogicController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRelativeLayoutSafeArea()
        //banner
        let bannerView = UIImageView()
        bannerView.tg_width.equal(75)
        bannerView.tg_height.equal(309)
        bannerView.tg_top.equal(120)
        bannerView.tg_centerX.equal(0)
        bannerView.image = R.image.splashBanner()
        container.addSubview(bannerView)
        
        ///
        //版权
        let copyrightView = UILabel()
        copyrightView.tg_width.equal(.wrap)
        copyrightView.tg_height.equal(.wrap)
        copyrightView.tg_bottom.equal(16)
        copyrightView.tg_centerX.equal(0)
        copyrightView.font = UIFont.systemFont(ofSize: 12)
        copyrightView.textColor = .gray
        let year = SuperDateUtil.currentYear()
        copyrightView.text = String(format: "Copyright © %d Ixuea. All Rights Reserved", year)
        container.addSubview(copyrightView)
        
        //logo
        let logoView = UIImageView(image: R.image.splashLogo())
        logoView.tg_width.equal(188)
        logoView.tg_height.equal(31)
        logoView.tg_bottom.equal(copyrightView.tg_top).offset(16)
        logoView.tg_centerX.equal(0)
        //设置缩放模式
        logoView.contentMode = .scaleAspectFit
        container.addSubview(logoView)
    }
    
    override func initDatum() {
        super.initDatum()
        if DefaultPreferenceUtil.isAcceptTermsServiceAgreement() {
            //表示已经同意了用户协议
            prepareNext()
        } else {
            showTermsServiceAgreementDialog()
        }

        
    }
    func prepareNext() {
        next()
    }
    @objc func next() {
        AppDelegate.shared.toMain()
    }
    func showTermsServiceAgreementDialog() {
        dialogController.show()
        
    }
    
    @objc func primaryClick() {
        dialogController.hide()
        DefaultPreferenceUtil.setAcceptTermsServiceAgreement(true)
        AppDelegate.shared.toGuide()
    }
    lazy var dialogController: TermServiceDialogController = {
        let r = TermServiceDialogController()
        r.titleView.text = R.string.localizable.termServicePrivacy()
        r.primaryButton.addTarget(self, action: #selector(primaryClick), for: .touchUpInside)
        return r
    }()
    
}
