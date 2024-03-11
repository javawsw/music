//
//  AppDelegate.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// 定义一个静态的计算属性
    /// 返回AppDelegate对象实例
    open class var shared:AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        
        let controller = SplashController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        return true
    }
    ///跳转到引导界面
    func toGuide() {
        let r = GuideController()
        setRootViewController(r)
    }
    ///跳转到首页
    func toMain() {
        let r = UINavigationController(rootViewController: MainController())
        setRootViewController(r)
    }
    
    ///跳转到登录首页
    func toLogin() {
        toMain()
        //用这个语法发送一个通知，当主界面显示出来之后接受通知后再处理
        //外面套了一层可以确保前面主界面显示出来之后才会执行里面的代码
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(Constant.EVENT_LOGIN_CLICK), object: nil)
        }

    }
    func setRootViewController(_ data:UIViewController) {
        window?.rootViewController = data
    }
    
    func logout() {

    }
}

