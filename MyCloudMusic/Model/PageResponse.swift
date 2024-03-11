//
//  PageResponse.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/23.
//

import Foundation
import HandyJSON
class PageResponse:HandyJSON {
    var total:Int = 0
    var pages:Int = 0
//    var data:[Sheet]!
    var data:Array<Sheet>!
    required init() {
    }
}
