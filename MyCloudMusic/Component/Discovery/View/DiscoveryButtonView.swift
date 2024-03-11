//
//  DiscoveryButtonView.swift
//  MyCloudMusic
//  发现界面按钮View
//  Created by 王士文啊帅比 on 2024/1/25.
//

import UIKit
import TangramKit

class DiscoveryButtonView: TGLinearLayout {

    init() {
        //必须要调用public init构造方法
        //convenience申明的构造函数不用必须调用
        super.init(frame: CGRect.zero, orientation: .vert)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    
    func initView() {
        //设置约束
        tg_width.equal(.wrap)
        tg_height.equal(.wrap)
        
        //控件之间间距
        tg_space = PADDING_MEDDLE
        
        //内容水平居中
        tg_gravity = TGGravity.horz.center
        
        //添加其他控件
        let iconContainer = TGRelativeLayout()
        iconContainer.tg_width.equal(50)
        iconContainer.tg_height.equal(50)
        
        addSubview(iconContainer)
        iconContainer.addSubview(iconView)
        iconContainer.addSubview(tipView)
        addSubview(titleView)
    }
    
    func bind(_ title:String!,_ icon:UIImage!) {
        titleView.text = title
        iconView.image = icon
    }
    
    
    /// 图标控件
    lazy var iconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.fill)
        r.image = R.image.dayRecommend()
        return r
    }()
    
    
    /// 只有没有推荐按钮，才显示日期，其他按钮没有使用
    lazy var tipView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.textColor = .colorLightWhite
        r.font = UIFont.systemFont(ofSize: 13)
        
        r.tg_centerX.equal(0)
        r.tg_centerY.equal(3)
        return r
    }()
    
    /// 标题控件
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.textColor = .colorOnSurface
        r.font = UIFont.systemFont(ofSize: 13)
        r.text = "6"
        return r
    }()
}
