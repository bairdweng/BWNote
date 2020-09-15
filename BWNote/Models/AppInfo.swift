//
//  AppInfo.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import HandyJSON
/// app信息
struct AppInfo:HandyJSON {
    var id:Int?
    var app_id:String?
    var app_name:String?
    var status:String?
    var bundle_id:String?
    var is_crash:Bool?
}
