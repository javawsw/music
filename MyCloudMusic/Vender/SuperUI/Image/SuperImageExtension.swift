//
//  SuperImageExtension.swift
//  MyCloudMusic
//  Image扩展，例如:写入文件
//  Created by 王士文啊帅比 on 2024/1/28.
//

import UIKit
extension UIImage{
    
    /// 设置图片支持着色
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    func withTintColor() -> UIImage {
        let result = self.withRenderingMode(.alwaysTemplate)
        return result
    }
}
