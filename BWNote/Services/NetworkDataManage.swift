//
//  NetworkProVider.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import Alamofire
import Moya
import SwiftyJSON
import UIKit
class NetworkDataManage: NSObject {
    static let shared = NetworkDataManage()
    var token: String?
    private let provider = MoyaProvider<AppInfoMoya>()
    func login(userName: String, passWord: String, callBack: @escaping (_ status: Bool) -> Void) {
        provider.request(.login(userName, passWord)) { result in
            switch result {
            case let .success(reps):
                if let token = JSON(reps.data)["data"]["token"].string {
                    self.token = token
                    callBack(true)
                } else {
                    callBack(false)
                }
            case .failure:
                callBack(false)
            }
        }
    }

    func getAppInfos(callBack: @escaping (_ infos: [AppInfo]?) -> Void) {
        provider.request(.getAllAppInfo) { result in
            switch result {
            case let .success(reps):
                let data = JSON(reps.data)["data"].arrayObject
                let infos = [AppInfo].deserialize(from: data)
                callBack(infos as? [AppInfo])
            case .failure:
                callBack(nil)
            }
        }
    }

    func getAccessRecord(id: Int, pageIndex: Int? = 1, pageSize: Int? = 10, callBack: @escaping (_ recordModel: RecordModel?) -> Void) {
        provider.request(.getAppRecord(id, pageIndex: pageIndex!, pageSize: pageSize!)) { result in
            switch result {
            case let .success(reps):
                let data = JSON(reps.data)["data"].dictionaryObject
                let item = RecordModel.deserialize(from: data)
                callBack(item)
            case .failure:
                callBack(nil)
            }
        }
    }
}

enum AppInfoMoya {
    case login(_ userName: String, _ passWord: String)
    case getAllAppInfo
    case getAppRecord(_ id: Int, pageIndex: Int, pageSize: Int)
}

extension AppInfoMoya: TargetType {
    var path: String {
        switch self {
        case .login:
            return "/user/login"
        case .getAllAppInfo:
            return "app/getAppInfos"
        case .getAppRecord:
            return "app/getAccessRecord"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getAllAppInfo:
            return .get
        default:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .login(userName, passWord):
            let params = ["userName": userName, "passWord": passWord]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getAllAppInfo:
            let params = ["token": NetworkDataManage.shared.token ?? ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case let .getAppRecord(id, pageIndex, pageSize):
            let params = ["id": id, "page_index": pageIndex, "page_size": pageSize, "token": NetworkDataManage.shared.token ?? ""] as [String: Any]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return [:]
    }

    var baseURL: URL {
        return URL(string: "http://test.xianjiang666.com")!
    }
}
