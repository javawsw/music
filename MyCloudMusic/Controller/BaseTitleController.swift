//
//  BaseTitleController.swift
//  MyCloudMusic
//  通用标题控制器
//  Created by 王士文啊帅比 on 2023/11/20.
//

import UIKit

class BaseTitleController: BaseLogicController {
    override func initLinearLayoutSafeArea() {
        super.initLinearLayoutSafeArea()
        if isAddToolBar() {
            initToolbar()
        }
    }
    
    
    override var title: String?{
        didSet {
            toolbarView.titleView.text = title
        }
    }
    
    
    func isAddToolBar() -> Bool {
        return true
    }
    

    func initToolbar() {
        superHeaderContentContainer.addSubview(toolbarView)
    }
    
    
    lazy var toolbarView: SuperToolbarView = {
        let r = SuperToolbarView()
        return r
    }()
}
