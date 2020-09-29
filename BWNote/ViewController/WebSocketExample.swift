//
//  WebSocketExample.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/31.
//  Copyright © 2020 apple. All rights reserved.
//

import Async
import Starscream
import SwiftyJSON
import UIKit
class WebSocketExample: BaseViewController {
    @IBOutlet var connectBtn1: UIButton!
    @IBOutlet var showLabel1: UILabel!
    @IBOutlet var sendMessage1: UIButton!

    @IBOutlet var connectbtn2: UIButton!
    @IBOutlet var showLabel2: UILabel!
    @IBOutlet var sendMessage2: UIButton!

    var webSocket1: WebSocket?
    var webSocket2: WebSocket?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickOntheSendMessage1(_: Any) {
        let json = [
            "toID": "2",
            "message": "你好，我是用户1",
        ] as [String: Any]
        do {
            let json = try JSON(json).rawData()
            webSocket1?.write(data: json, completion: nil)
        } catch _ {
            print("序列化失败")
        }
    }

    @IBAction func clickOntheSendMessage2(_: Any) {
        let json = [
            "toID": "1",
            "message": "你好，我是用户2",
        ] as [String: Any]
        do {
            let json = try JSON(json).rawData()
            webSocket2?.write(data: json, completion: nil)
        } catch _ {
            print("序列化失败")
        }
    }

    @IBAction func clickOntheConnect1(_: Any) {
        if webSocket1 == nil {
            var request = URLRequest(url: URL(string: "ws://127.0.0.1:5322/websocket?id=1")!)
            request.timeoutInterval = 5
            webSocket1 = WebSocket(request: request)
            webSocket1?.onEvent = { [weak self] event in
                switch event {
                case let .connected(headers):
                    print("websocket is connected: \(headers)")
                case let .disconnected(reason, code):
                    print("websocket is disconnected: \(reason) with code: \(code)")
                case let .text(string):
                    print("Received text: \(string)")
                    Async.main {
                        self?.showLabel1.text = string
                    }
                case let .binary(data):
                    let hello = String(data: data, encoding: .utf8)
                    print("Received1 data: \(hello ?? "")")
                    Async.main {
                        self?.showLabel1.text = hello
                    }
                case .ping:
                    break
                case .pong:
                    break
                case .viabilityChanged:
                    break
                case .reconnectSuggested:
                    break
                case .cancelled:
                    print("连接取消")
                case let .error(error):
                    print("error：\(error?.localizedDescription ?? "")")
                }
            }
        }
        webSocket1?.connect()
    }

    @IBAction func clickOntheConnect2(_: Any) {
        if webSocket2 == nil {
            var request = URLRequest(url: URL(string: "ws://127.0.0.1:5322/websocket?id=2")!)
            request.timeoutInterval = 5
            webSocket2 = WebSocket(request: request)
            webSocket2?.onEvent = { [weak self] event in
                switch event {
                case let .connected(headers):
                    print("websocket2 is connected: \(headers)")
                case let .disconnected(reason, code):
                    print("websocket2 is disconnected: \(reason) with code: \(code)")
                case let .text(string):
                    print("Received2 text: \(string)")
                    Async.main {
                        self?.showLabel2.text = string
                    }
                case let .binary(data):

                    let hello = String(data: data, encoding: .utf8)
                    print("Received2 data: \(hello ?? "")")
                    Async.main {
                        self?.showLabel2.text = hello
                    }
                case .ping:
                    break
                case .pong:
                    break
                case .viabilityChanged:
                    break
                case .reconnectSuggested:
                    break
                case .cancelled:
                    print("2连接取消")
                case let .error(error):
                    print("2error：\(error?.localizedDescription ?? "")")
                }
            }
        }
        webSocket2?.connect()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webSocket1?.disconnect()
        webSocket2?.disconnect()
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
