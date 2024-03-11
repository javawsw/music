//
//  ResourceUtil.swift
//  MyCloudMusic
//  资源工具类
//  Created by 王士文啊帅比 on 2024/1/24.
//

import Foundation


class ResourceUtil {
    /// 将相对路径的资源转为绝对路径
    ///
    /// - Parameter uri: <#uri description#>
    /// - Returns: <#return value description#>
    static func resourceUri(_ data:String) -> String {
        return "\(Config.RESOURCE_ENDPOINT)/\(data)"
    }
}
