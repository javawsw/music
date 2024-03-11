//
//  ParamUtil.swift
//  MyCloudMusic
//  参数相关工具类
//  Created by 王士文啊帅比 on 2023/11/22.
//

import Foundation
import Moya

class ParamUtil {
    
    /// 返回URL编码的参数
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    static func urlRequestParamters(_ data:[String:Any]) -> Task {
        return .requestParameters(parameters: data, encoding: URLEncoding.default)
    }
}
