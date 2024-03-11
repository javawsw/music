//
//  ListResponse.swift
//  MyCloudMusic
//  解析列表网络请求
//  Created by 王士文啊帅比 on 2024/1/4.
//

import Foundation
import HandyJSON
class ListResponse<T:HandyJSON>: BaseResponse {
    ///分页元数据
    var data:Meta<T>!
}
