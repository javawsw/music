//
//  TermServiceDialogController.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/20.
//

import UIKit
import TangramKit

class TermServiceDialogController: BaseController, QMUIModalPresentationContentViewControllerProtocol {
    var contentContainer:TGBaseLayout!
    var modalController:QMUIModalPresentationViewController!
    var textView:UITextView!
    var disagreeButton:QMUIButton!
    override func initViews() {
        super.initViews()
        //设置圆角
        view.layer.cornerRadius = MEDDLE_RADIUS
        //设置圆角打开
        view.clipsToBounds = true
        view.backgroundColor = .colorDivider
        view.tg_height.equal(.wrap)
        view.tg_width.equal(.fill)
        
        //内容容器
        contentContainer = TGLinearLayout(.vert)
        contentContainer.tg_height.equal(.wrap)
        contentContainer.tg_width.equal(.fill)
        contentContainer.tg_space = 25
        contentContainer.backgroundColor = .colorBackground
        contentContainer.tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        view.addSubview(contentContainer)
        //标题
        contentContainer.addSubview(titleView)
        textView = UITextView()
        textView.tg_width.equal(.fill)
        textView.tg_height.equal(230)
        textView.text = "请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。请注意，这只是一个简单的示例，你可能需要根据具体情况进行修改和完善。建议在起草协议时咨询法律专业人士，以确保协议符合当地法规和你的具体需求。"
        textView.backgroundColor = .clear
        
        //禁用编辑
        textView.isEditable = false
        contentContainer.addSubview(textView)
        contentContainer.addSubview(primaryButton)
        
        //不同意按钮
        disagreeButton = ViewFactoryUtil.linkButton()
        disagreeButton.setTitle(R.string.localizable.disagree(), for: .normal)
        disagreeButton.setTitleColor(.black80, for: .normal)
        disagreeButton.addTarget(self, action: #selector(disagreeClick(_:)), for: .touchUpInside)
        disagreeButton.sizeToFit()
        disagreeButton.tg_centerX.equal(0)
        contentContainer.addSubview(disagreeButton)

    }
    @objc func disagreeClick(_ sender:QMUIButton) {
        hide()
        
        //退出应用
        exit(0)
    }


    func show() {
        modalController = QMUIModalPresentationViewController()
        //弹窗时渐变
        modalController.animationStyle = .fade
        //边距
        modalController.contentViewMargins = UIEdgeInsets(top: PADDING_LARGE2, left: PADDING_LARGE2, bottom: PADDING_LARGE2, right: PADDING_LARGE2)
        //点击外部不隐藏
        modalController.isModal = true
        //设置要现实的内容控件
        modalController.contentViewController = self
        modalController.showWith(animated: true)
    }
    func hide() {
        modalController.hideWith(animated: true)
    }
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.text = "标题"
        r.textColor = .colorOnSurface
        r.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE2)
        r.textAlignment = .center

        return r
    }()
    lazy var primaryButton: QMUIButton = {
        let r = ViewFactoryUtil.primaryHalfFilletButton()
        r.setTitle(R.string.localizable.agree(), for: .normal)
        return r
    }()

}
