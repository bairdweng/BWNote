//
//  HomeViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import Async
import SnapKit
import SVProgressHUD
import UIKit
class HomeViewController: BaseViewController {
    let dataTableView = UITableView()
    let dataSources = [
        "Exchange method",
        "About copy",
        "Algorithm",
        "Grpc",
        "Websocket",
        "1000 websocket",
        "Load and initialize",
        "Memory layout",
        "What is a block?",
        "ResponseChain",
        "Multithreading",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
//        autoLogin()
        // Do any additional setup after loading the view.
    }

    func autoLogin() {
        NetworkDataManage.shared.login(userName: "bairdweng", passWord: "88888888") { status in
            if status == true {
                print("成功")
            } else {
                print("失败")
            }
        }
    }

    func initTableView() {
        view.addSubview(dataTableView)
        dataTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "home_cell")
    }

    func initLoginBtn() {
        let login = UIButton()
        view.addSubview(login)
        login.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.center.equalTo(self.view)
        }
        login.backgroundColor = .purple
        login.setTitleColor(.white, for: .normal)
        login.setTitle("登录", for: .normal)
        login.rx.tap.subscribe(onNext: {
            SVProgressHUD.show()
            NetworkDataManage.shared.login(userName: "bairdwend4", passWord: "88888888") { [weak self] status in
                if status == true {
                    Async.main {
                        SVProgressHUD.showSuccess(withStatus: "登录成功")
                        login.isHidden = true
                        self?.dataTableView.isHidden = false
                    }
                } else {
                    Async.main {
                        SVProgressHUD.showError(withStatus: "失败")
                    }
                }
            }
        }).disposed(by: disposeBag)
    }

    func openCustomVc() {
        //
        //        FatherViewController().printSelf()
        //        SonViewController().openFather()
        //        SonViewController().hello()
        //        self.present(customVc, animated: true, completion: nil)
        //        ISAPoint.hello()
        AboutCopy().hello()
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSources.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "home_cell", for: indexPath)
        let title = dataSources[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            ISAPoint.hello()
        case 1:
            AboutCopy().hello()
        case 2:
            let vc = AlgorithmViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = GrpcViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let websocket = WebSocketExample()
            navigationController?.pushViewController(websocket, animated: true)
        case 5:
            let web = WebSocketViewController()
            navigationController?.pushViewController(web, animated: true)
        case 6:
            let vc = LoadAndInitializeViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = MemoryLayoutViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = BlockViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = ResponseChainViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            break
        default:
            break
        }
    }
}
