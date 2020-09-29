//
//  RecordViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import Async
import UIKit

class RecordViewController: UIViewController {
    var tableView = UITableView()
    var id: Int?
    var recordModel: RecordModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "访问记录"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RecordTableViewCell", bundle: nil), forCellReuseIdentifier: "record_cell")
        NetworkDataManage.shared.getAccessRecord(id: id ?? 0) { [weak self] model in
            self?.recordModel = model
            Async.main {
                self?.tableView.reloadData()
            }
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

extension RecordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
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

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 88
    }
}
