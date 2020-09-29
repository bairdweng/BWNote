//
//  GrpcViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/28.
//  Copyright © 2020 apple. All rights reserved.
//

import gRPC_Swift
import NIO
import NIOTransportServices
import SnapKit
import UIKit
class GrpcViewController: BaseViewController {
    let greeter = Helloworld_GreeterClient(channel: ClientConnection.insecure(group: NIOTSEventLoopGroup()).connect(host: "118.89.36.207", port: 50051))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let sendMessageBtn = UIButton()
        sendMessageBtn.setTitle("发送消息", for: .normal)
        sendMessageBtn.backgroundColor = .red
        view.addSubview(sendMessageBtn)
        sendMessageBtn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.center.equalTo(self.view)
        }
        sendMessageBtn.rx.tap.subscribe(onNext: {
            self.sendMessage()
        }).disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }

    func sendMessage() {
        let request1 = Helloworld_HelloRequest.with { $0.name = "卧槽你大爷爷" }
        greeter.sayHello(request1).response.whenComplete { result in
            switch result {
            case let .failure(error):
                debugPrint(error)

            case let .success(response):
                debugPrint(response)
            }
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
