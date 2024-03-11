//
//  StringExtension.swift
//  MyCloudMusic
//  字符串扩展
//  Created by 王士文啊帅比 on 2024/1/31.
//

import Foundation

extension String{
    /**
     * 将相对资源转为绝对路径
     *
     * @param uri
     * @return
     */
    func absoluteUri() -> String {
        return "\(Config.RESOURCE_ENDPOINT)\(self)"
    }
}
