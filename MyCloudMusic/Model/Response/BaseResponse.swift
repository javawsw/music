//
//  BaseResponse.swift
//  MyCloudMusic
//  通用网络请求模型
//  Created by 王士文啊帅比 on 2024/1/4.
//

import UIKit

class BaseResponse: BaseModel {
    ///状态码
    var status:Int = 0
    
    ///错误信息
    ///发生了错误不一定有
    var message:String?
}
