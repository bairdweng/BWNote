//
//  WebSocketExample.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/31.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import Starscream
import Async
import SwiftyJSON
class WebSocketExample: BaseViewController {
    @IBOutlet weak var connectBtn1: UIButton!
    @IBOutlet weak var showLabel1: UILabel!
    @IBOutlet weak var sendMessage1: UIButton!
    
    @IBOutlet weak var connectbtn2: UIButton!
    @IBOutlet weak var showLabel2: UILabel!
    @IBOutlet weak var sendMessage2: UIButton!
    
    var webSocket1:WebSocket?
    var webSocket2:WebSocket?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickOntheSendMessage1(_ sender: Any) {
        let json = [
            "toID":"2",
            "message":"你好，我是用户1"
            ] as [String : Any]
        do {
            let json =  try JSON(json).rawData()
            webSocket1?.write(data: json, completion: nil)
        } catch _ {
            print("序列化失败")
        }
        
    }
    @IBAction func clickOntheSendMessage2(_ sender: Any) {
        let json = [
            "toID":"1",
            "message":"你好，我是用户2",
            ] as [String : Any]
        do {
            let json =  try JSON(json).rawData()
            webSocket2?.write(data: json, completion: nil)
        } catch _ {
            print("序列化失败")
        }
    }
    
    @IBAction func clickOntheConnect1(_ sender: Any) {
        if webSocket1 == nil {
            var request = URLRequest(url: URL(string: "ws://127.0.0.1:5322/websocket?id=1")!)
            request.timeoutInterval = 5
            webSocket1 = WebSocket(request: request)
            webSocket1?.onEvent = { [weak self] (event) in
                switch event {
                case .connected(let headers):
                    print("websocket is connected: \(headers)")
                case .disconnected(let reason, let code):
                    print("websocket is disconnected: \(reason) with code: \(code)")
                case .text(let string):
                    print("Received text: \(string)")
                    Async.main({
                        self?.showLabel1.text = string
                    })
                case .binary(let data):
                    let hello =  String(data: data, encoding: .utf8)
                    print("Received1 data: \(hello ?? "")")
                    Async.main({
                        self?.showLabel1.text = hello
                    })
                case .ping(_):
                    break
                case .pong(_):
                    break
                case .viabilityChanged(_):
                    break
                case .reconnectSuggested(_):
                    break
                case .cancelled:
                    print("连接取消")
                case .error(let error):
                    print("error：\(error?.localizedDescription ?? "")")
                }
            }
        }
        webSocket1?.connect()
    }
    
    @IBAction func clickOntheConnect2(_ sender: Any) {
        if webSocket2 == nil {
            var request = URLRequest(url: URL(string: "ws://127.0.0.1:5322/websocket?id=2")!)
            request.timeoutInterval = 5
            webSocket2 = WebSocket(request: request)
            webSocket2?.onEvent = {   [weak self] (event) in
                switch event {
                case .connected(let headers):
                    print("websocket2 is connected: \(headers)")
                case .disconnected(let reason, let code):
                    print("websocket2 is disconnected: \(reason) with code: \(code)")
                case .text(let string):
                    print("Received2 text: \(string)")
                    Async.main({
                        self?.showLabel2.text = string
                    })
                case .binary(let data):
                    
                    let hello =  String(data: data, encoding: .utf8)
                    print("Received2 data: \(hello ?? "")")
                    Async.main({
                        self?.showLabel2.text = hello
                    })
                case .ping(_):
                    break
                case .pong(_):
                    break
                case .viabilityChanged(_):
                    break
                case .reconnectSuggested(_):
                    break
                case .cancelled:
                    print("2连接取消")
                case .error(let error):
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
