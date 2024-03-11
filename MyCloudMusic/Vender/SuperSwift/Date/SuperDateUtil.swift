//
//  SuperDateUtil.swift
//  MyCloudMusic
//  日期工具类
//  Created by 王士文啊帅比 on 2023/11/16.
//

import Foundation

class SuperDateUtil {
    
    ///当前年
    static func currentYear() -> Int {
        //当前日期
        let date = Date()
        //获取日历对象
        let calender = Calendar.current
        //这句是说你想要获取日期的元素有哪些
        let d = calender.dateComponents([Calendar.Component.year,Calendar.Component.month], from: date)
        return d.year!
    }    
    ///当前天
    static func currentDay() -> Int {
        let date = Date()
        let calender = Calendar.current
        let d = calender.dateComponents([Calendar.Component.day], from: date)
        return d.day!
    }
    
    
    
}
