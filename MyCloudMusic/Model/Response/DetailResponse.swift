//
//  DetailResponse.swift
//  MyCloudMusic
//  详情网络请求解析类
//  Created by 王士文啊帅比 on 2024/1/4.
//

import UIKit
import HandyJSON

class DetailResponse<T:HandyJSON>: BaseResponse {
    ///真实数据
    ///他的类型就是泛型
    var data:T?
    init(_ data:T) {
        self.data = data
    }
    
    required init() {
        super.init()
    }
}
