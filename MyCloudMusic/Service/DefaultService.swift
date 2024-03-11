//
//  DefaultService.swift
//  MyCloudMusic
//  网络API
//  Created by 王士文啊帅比 on 2023/11/22.
//

import Foundation
import Moya
enum DefaultService {
    //广告列表
    case ads(position:Int)
    //歌单列表
    case sheets(size:Int)
    //歌单详情
    case sheetDetail(data:String)
    //注册
    case register(data:User)
    
    case songs
    case songDetail(data:String)
}

//MARK: - 实现TargetType协议
extension DefaultService:TargetType {
    ///返回所有API地址
    var baseURL: URL {
        return URL(string: Config.ENDPOINT)!
    }
    ///返回每个请求的路径
    var path: String {
        switch self {
            case .ads(_):
                return "v1/ads"
            case .sheets(_):
                return "v1/sheets"
            case .sheetDetail(let data):
                return "v1/sheets/\(data)"            
            case .songs:
                return "v1/songs"
            case .songDetail(let data):
                return "v1/songs/\(data)"
            case .register(_):
                return "v1/users"
            default:
                fatalError("DefaultService path is null")
        }
    }
    ///请求方式
    var method: Moya.Method {
        switch self {
            case .register(_):
                return .post
            default:
                return .get
        }
    }
    ///请求的参数
    var task: Moya.Task {
        switch self {
            case .ads(let position):
                return ParamUtil.urlRequestParamters(["position":position])
            case .sheets(let size):
                return ParamUtil.urlRequestParamters(["size":size])
            default:
                //不传参数
                return .requestPlain
        }
    }
    ///传递请求头
    var headers: [String : String]? {
        var headers:Dictionary<String,String> = [:]
        return headers
    }
}


