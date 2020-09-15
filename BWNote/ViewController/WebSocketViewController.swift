//
//  WebSocketViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/28.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import Starscream
import Async
class WebSocketViewController: BaseViewController {
    var sockets:[WebSocket] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        let sendMessageBtn = UIButton()
        sendMessageBtn.setTitle("+200连接", for: .normal)
        sendMessageBtn.backgroundColor = .red
        self.view.addSubview(sendMessageBtn)
        sendMessageBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.center.equalTo(self.view)
        }
        sendMessageBtn.rx.tap.subscribe(onNext:{
            self.sendMessage()
        }).disposed(by: self.disposeBag)
        
        // Do any additional setup after loading the view.
    }
    func initWebSock()->WebSocket {
        var request = URLRequest(url: URL(string: "ws://127.0.0.1:5322/websocket?a=2")!)
        request.timeoutInterval = 5
        let socket = WebSocket(request: request)
        socket.onEvent = {(event) in
            print("========")
        }
        socket.connect()
        return socket
    }
    func sendMessage() {
        for _ in 0..<1000 {
            sockets.append(initWebSock())
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        for sock in sockets {
            sock.disconnect()
        }
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
