//
//  RecordModel.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import HandyJSON

struct RecordModel:HandyJSON {
    var app_info:AppInfo?
    var records:[RecordItem]?
}

struct RecordItem:HandyJSON {
    var CreatedAt:String?
    var id:String?
    var ip:String?
}
