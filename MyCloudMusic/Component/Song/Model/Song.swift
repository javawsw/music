//
//  Song.swift
//  MyCloudMusic
//  单曲模型
//  Created by 王士文啊帅比 on 2024/1/31.
//

import UIKit
import HandyJSON

class Song: BaseCommon {
    
    /// 标题
    var title:String!
    /// 封面
    var icon:String?
    /// 音乐地址
    var uri:String!
    /// 点击数
    var clicksCount:Int = 0
    /// 评论数
    var commentsCount:Int = 0
    /// 创建该音乐的人
    var user:User!
    /// 歌手
    var singer:User!
    
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        mapper <<< self.clicksCount <-- "clicks_count"
        mapper <<< self.commentsCount <-- "comments_count"
    }
}
