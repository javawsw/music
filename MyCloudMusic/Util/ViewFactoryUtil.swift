//
//  ViewFactoryUtil.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/20.
//

import Foundation
import TangramKit
class ViewFactoryUtil {
    
    /// 主色调，小圆角按钮
    /// - Returns: <#description#>
    static func primaryButton() -> QMUIButton {
        let r = QMUIButton()
        //当用户按下时候根据用户设置的color自动变色
        r.adjustsTitleTintColorAutomatically = false
        //当用户点击按钮时高亮颜色是否自动调整
        r.adjustsButtonWhenHighlighted = true
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_LARGE)
        r.tg_width.equal(.fill)
        r.tg_height.equal(BUTTON_MEDDLE)
        r.backgroundColor = .colorPrimary
        r.layer.cornerRadius = SMALL_RADIUS
        r.tintColor = .colorLightWhite
        r.setTitleColor(.colorLightWhite, for: .normal)
        return r
    }
    
    /// 主色调，半圆角按钮
    /// - Returns: <#description#>
    static func primaryHalfFilletButton() -> QMUIButton {
        let r = primaryButton()
        r.layer.cornerRadius = BUTTON_MEDDLE_RADIUS
        return r
    }
    
    
    /// 主色调文本，小圆角，灰色边框
    /// - Returns:
    static func primaryOutlineButton() -> QMUIButton {
        let r = primaryButton()
        r.layer.cornerRadius = SMALL_RADIUS
        r.tintColor = .black130
        r.layer.borderWidth = 1
        r.layer.borderColor = UIColor.black130.cgColor
        r.backgroundColor = .clear
        r.setTitleColor(.colorPrimary, for: .normal)
        return r
    }
    
    ///创建只有标题按钮（类似网页链接）
    static func linkButton() -> QMUIButton {
        let r = QMUIButton()
        r.adjustsTitleTintColorAutomatically = false
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        return r
    }
    /// 创建次要，半圆角，小按钮
    /// - Returns: <#description#>
    static func secondHalfFilletSmallButton() -> QMUIButton {
        let r = QMUIButton()
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_SMALL)
        r.tg_width.equal(90)
        r.tg_height.equal(BUTTON_SMALL)
        r.tintColor = .black80
        r.border(.black80)
        r.corner(BUTTON_SMALL_RADIUS)
        r.setTitleColor(.black80, for: .normal)
        return r
    }
    
    static func tableView() -> UITableView{
        let r = UITableView()
        r.backgroundColor = .clear
        
        //去掉没有数据cell的分割线
        r.tableFooterView = UIView()
        
        //去掉默认分割线
        r.separatorStyle = .none
        
        //修复默认分割线，向右偏移问题
        r.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        r.tg_width.equal(.fill)
        r.tg_height.equal(.fill)
        //设置所有cell的高度为高度自适应，如果cell高度是动态的请这么设置。 如果不同的cell有差异那么可以通过实现协议方法-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
        //如果您最低要支持到iOS7那么请您实现-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath方法来代替这个属性的设置。
        r.rowHeight = UITableView.automaticDimension
        r.estimatedRowHeight = UITableView.automaticDimension
        
        //不显示滚动条
        r.showsVerticalScrollIndicator = false
        r.allowsSelection = true
        
        
        return r
    }
    
    
    ///创建connectionView
    static func collectionView() -> UICollectionView {
        let r = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout())
        
        r.backgroundColor = .clear
        
        //不显示滚动条
        r.showsVerticalScrollIndicator = false
        r.showsHorizontalScrollIndicator = false
        
        //collectionView的内容从collectionView顶部距离开始显示，不要自动偏移状态栏尺寸
        r.contentInsetAdjustmentBehavior = .never
        
        r.tg_height.equal(.fill)
        r.tg_width.equal(.fill)
        return r
    }
    
    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let r = UICollectionViewFlowLayout()
        r.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        //滚动方向
        r.scrollDirection = .vertical
        //每个Cell之间的行间距
        r.minimumLineSpacing = 0
        //每个Cell之间的行间距
        r.minimumInteritemSpacing = 0
        return r
    }
    ///创建小的水平分割线
    static func smallDivider() -> UIView {
       let r = UIView()
        r.tg_height.equal(0.5)
        r.tg_width.equal(.fill)
        r.backgroundColor = .colorDivider
        return r
    }
    
    
    
}
