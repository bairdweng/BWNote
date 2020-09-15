//
//  HomeViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import Async
import SnapKit
import SVProgressHUD
class HomeViewController: BaseViewController {
    let dataTableView = UITableView()
    let dataSources = ["runtime交换方法","关于copy","算法","grpc","websocket","1000个websocket"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
//        autoLogin()
        // Do any additional setup after loading the view.
    }
    func autoLogin() {
        NetworkDataManage.shared.login(userName: "bairdweng", passWord: "88888888") {(status) in
            if status == true {
                print("成功")
            }
            else {
                print("失败")
                
            }
        }
    }
    
    func initTableView() {
        self.view.addSubview(dataTableView)
        dataTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "home_cell")
    }
    
    
    func initLoginBtn() {
        let login = UIButton()
        view.addSubview(login)
        login.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.center.equalTo(self.view)
        }
        login.backgroundColor = .purple
        login.setTitleColor(.white, for: .normal)
        login.setTitle("登录", for: .normal)
        login.rx.tap.subscribe(onNext:{
            SVProgressHUD.show()
            NetworkDataManage.shared.login(userName: "bairdwend4", passWord: "88888888") { [weak self] (status) in
                if status == true {
                    Async.main({
                        SVProgressHUD.showSuccess(withStatus: "登录成功")
                        login.isHidden = true
                        self?.dataTableView.isHidden = false
                    })
                }
                else {
                    Async.main({
                        SVProgressHUD.showError(withStatus: "失败")
                    })
                }
            }
        }).disposed(by: self.disposeBag)
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
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            break
        case 1:
            AboutCopy().hello()
            break
        case 2:
            let vc = SuanFaViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = GrpcViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 4:
            let websocket = WebSocketExample()
            self.navigationController?.pushViewController(websocket, animated: true)
        case 5:
            let web = WebSocketViewController()
            self.navigationController?.pushViewController(web, animated: true)
        default:
            break
        }
        
    }
    
    
}
