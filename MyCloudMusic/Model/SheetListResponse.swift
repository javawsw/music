//
//  SheetListResponse.swift
//  歌单列表模型
//
//  Created by 王士文啊帅比 on 2023/11/23.
//

import Foundation
import HandyJSON
class SheetListResponse:HandyJSON {
    var status:Int = 0
    var data:PageResponse!
    
    
    required init() {}
}
