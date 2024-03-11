//
//  MainController.swift
//  MyCloudMusic
//  主界面
//  Created by 王士文啊帅比 on 2023/11/21.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //选中高亮颜色
        tabBar.tintColor = .primaryColor
        tabBar.isTranslucent = true
        
        //添加子控制器
        addChildController(DiscoveryController(), R.string.localizable.discovery(), "Discovery")
        addChildController(VideoController(), R.string.localizable.video(), "Video")
        addChildController(MeController(), R.string.localizable.me(), "Me")
        addChildController(FeedController(), R.string.localizable.feed(), "Feed")
        addChildController(RoomController(), R.string.localizable.live(), "Live")
    }
    /// 添加子控制器
    /// - Parameters:
    ///   - target: <#target description#>
    ///   - title: <#title description#>
    ///   - imageName: <#imageName description#>
    func addChildController(_ target:UIViewController,_ title:String,_ imageName:String) {
        //标题,
        //当一个控制器添加到UITABlebarcontroller里面以后，就可以通过控制器上面的tabbar里面访问到tabbaritem
        target.tabBarItem.title = title
        //默认图片
        target.tabBarItem.image = UIImage(named: imageName)
        //选择后图片
        target.tabBarItem.selectedImage = UIImage(named: "\(imageName)Selected")
        //选择后文本颜色
        target.tabBarItem.setBadgeTextAttributes([.foregroundColor:UIColor.colorPrimary], for: .selected)
        
        addChild(target)
    }
    
    /// 选择了，如果已经选择了，再次点击还会调用
    /// - Parameters:
    ///   - tabBar: <#tabBar description#>
    ///   - item: <#item description#>
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("MainController didSelectItem \(item.title!)")
    }
}
