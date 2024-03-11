//
//  SheetCell.swift
//  MyCloudMusic
//  歌单Cell
//  Created by 王士文啊帅比 on 2024/1/28.
//

import UIKit

class SheetCell: BaseCollectionViewCell {
    override func initViews() {
        super.initViews()
        container.tg_space = PADDING_SMALL
        
        container.addSubview(iconView)
        container.addSubview(titleView)
    }
    
    func bind(_ data:Sheet) {
        iconView.show(data.icon)
        titleView.text = data.title
    }
    
    lazy var iconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(.fill)
        r.tg_height.equal(r.tg_width)
        r.image = R.image.placeholder()
        
        //图片从中心等比向外面填充，控件没有黑边，但图片可能被裁剪
        r.contentMode = .scaleAspectFill
        //小圆角
        r.smallCorner()
        return r
    }()
    
    /// 标题
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.numberOfLines = 2
        r.font = UIFont.systemFont(ofSize:TEXT_MEDDLE)
        r.textColor = .colorOnSurface
        
        return r
    }()
}
