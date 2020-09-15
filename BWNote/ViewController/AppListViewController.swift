//
//  AppListViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import Async
class AppListViewController: BaseViewController {
    var tableView = UITableView()
    var dataSources:[AppInfo]?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "应用列表"
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "list_cell")
        
        NetworkDataManage.shared.getAppInfos { [weak self] (infos) in
            self?.dataSources = infos
            Async.main({
                self?.tableView.reloadData()
            })
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
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

extension AppListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list_cell", for: indexPath)
        let appInfo = dataSources?[indexPath.row]
        cell.textLabel?.text = appInfo?.app_name ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let appInfo = dataSources?[indexPath.row]
        let vc = AppInfoViewController()
        vc.appInfo = appInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
