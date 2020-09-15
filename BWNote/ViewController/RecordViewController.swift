//
//  RecordViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import Async

class RecordViewController: UIViewController {
    var tableView = UITableView()
    var id:Int?
    var recordModel:RecordModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "访问记录"
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RecordTableViewCell", bundle: nil), forCellReuseIdentifier: "record_cell")
        NetworkDataManage.shared.getAccessRecord(id: id ?? 0) { [weak self] (model) in
            self?.recordModel = model
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
extension RecordViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordModel?.records?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "record_cell", for: indexPath) as! RecordTableViewCell
        let item = recordModel?.records?[indexPath.row]
        cell.model = item
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
}
