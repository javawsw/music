//
//  Config.swift
//  MyCloudMusic
//
//  Created by 王士文啊帅比 on 2023/11/22.
//

import Foundation


class Config {
    /**
    * 是否是调试模式
    * 是因为单独定了一个变量更方便，不用真正更改项目的编译模式
    */
    static let DEBUG = true
    static let ENDPOINT = "http://my-cloud-music-api-sp3-dev.ixuea.com/"
    /**
     * 资源端点,相当于图片一类资源的前缀
     */
    static let RESOURCE_ENDPOINT = "http://course-music-dev.ixuea.com/"
}
