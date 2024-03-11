//
//  BaseLogicController.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/20.
//

import UIKit
import TangramKit
class BaseLogicController: BaseCommonController {
    ///根容器
    var rootContainer:TGBaseLayout!
    ///头部容器
    var superHeaderContainer:TGBaseLayout!
    ///头部内容容器
    var superHeaderContentContainer:TGBaseLayout!
    ///内容容器
    var container:TGBaseLayout!
    
    var tableView:UITableView!
    ///底部容器
    var superFooterContainer:TGBaseLayout!
    ///底部内容容器
    var superFooterContentContainer:TGBaseLayout!
    
    lazy var datum: [Any] = {
        var result: [Any] = []
        return result
    }()
    ///初始化RelativeLayout容器，四边都在安全区
    func initRelativeLayoutSafeArea() {
        initLinearLayout()
        //header
        initHeaderContainer()
        container = TGRelativeLayout()
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        
        //底部
        initFooterContainer()
    }
    /// 初始化TableView，四边都在安全区内
    func initTableViewSafeArea() {
        //外面添加一层容器，是方便在真实内容控件前后添加内容
        initLinearLayoutSafeArea()
        //tableView
        createTableView()
        container.addSubview(tableView)
    }
    
    
    
    /// 创建TableView，不会添加到任何布局
    func createTableView() {
        tableView = ViewFactoryUtil.tableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    ///使用默认分割线
    func initDefaultTableViewDivider() {
        tableView.separatorStyle = .singleLine
    }
    ///初始化垂直方向LinearLayout容器，四边都在安全区内
    func initLinearLayoutSafeArea() {
        initLinearLayout()
        
        
        //header
        initHeaderContainer()
        
        container = TGLinearLayout(.vert)
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        initFooterContainer()
    }
    ///初始化垂直方向LinearLayout
    func initLinearLayout() {
        rootContainer = TGLinearLayout(.vert)
        rootContainer.tg_width.equal(.fill)
        rootContainer.tg_height.equal(.fill)
        rootContainer.backgroundColor = .clear
        view.addSubview(rootContainer)
    }
    
    ///头部容器，安全区外，一般来设置头部到安全区外的背景颜色
    func initHeaderContainer() {
        superHeaderContainer = TGLinearLayout(.vert)
        superHeaderContainer.tg_width.equal(.fill)
        superHeaderContainer.tg_height.equal(.wrap)
        superHeaderContainer.backgroundColor = .clear

        
        ///头部内容容器，安全区内
        superHeaderContentContainer = TGLinearLayout(.vert)
        superHeaderContentContainer.tg_height.equal(.wrap)
        superHeaderContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.backgroundColor = .clear

        superHeaderContainer.addSubview(superHeaderContentContainer)
        rootContainer.addSubview(superHeaderContainer)
        
    }
    
    ///底部内容容器，安全区内
    func initFooterContainer() {
        superFooterContainer = TGLinearLayout(.vert)
        superFooterContainer.tg_width.equal(.fill)
        superFooterContainer.tg_height.equal(.wrap)
        superFooterContainer.backgroundColor = .clear
        superFooterContentContainer = TGLinearLayout(.vert)
        superFooterContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.backgroundColor = .clear
        superFooterContainer.addSubview(superFooterContentContainer)
        rootContainer.addSubview(superFooterContainer)
        
    }
    override func initViews() {
        super.initViews()
        //默认颜色
        setBackgroundColor(.colorBackground)
        
        //隐藏导航栏
        navigationController?.navigationBar.isHidden = true
    }
}


//TableView数据源和代理
extension BaseLogicController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
