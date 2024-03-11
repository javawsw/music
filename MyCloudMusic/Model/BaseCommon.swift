//
//  BaseCommon.swift
//  MyCloudMusic
//  通用字段模型
//  Created by 王士文啊帅比 on 2024/1/4.
//

import UIKit
import HandyJSON
class BaseCommon: BaseId {
///创建时间
    var createdAt:String!
    
///更新时间
    var updatedAt:String!
    
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        mapper <<< self.createdAt <-- "created_at"
        mapper <<< self.updatedAt <-- "updated_at"
    }
}
