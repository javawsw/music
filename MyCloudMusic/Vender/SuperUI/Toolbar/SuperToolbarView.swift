//
//  SuperToolbarView.swift
//  MyCloudMusic
//  使用View自定义标题栏
//  Created by 王士文啊帅比 on 2024/3/8.
//

import UIKit
import TangramKit


class SuperToolbarView: TGRelativeLayout {
    init() {
        super.init(frame: CGRect.zero)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    func initViews() {
        tg_width.equal(.fill)
        tg_height.equal(50)
        
        addSubview(centerContainer)
        centerContainer.addSubview(titleView)
    }
    
    lazy var centerContainer: TGLinearLayout = {
        let r = TGLinearLayout(.horz)
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.fill)
        r.tg_gravity = TGGravity.vert.center
        r.tg_centerX.equal(0)
        r.tg_centerY.equal(0)
        return r
    }()
    
    lazy var titleView: UILabel = {
        let result=UILabel()
        result.tg_width.equal(.wrap)
        result.tg_height.equal(.wrap)
        result.numberOfLines=1
        result.font = UIFont.systemFont(ofSize: TEXT_LARGE3)
        result.textColor = .colorOnSurface
        return result
    }()
    
}
