//
//  AlgorithmViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/25.
//  Copyright © 2020 apple. All rights reserved.
//

import SnapKit
import UIKit

class AlgorithmViewController: UIViewController {
    let dataTableView = UITableView()
    let dataSources = ["Stack", "Queue", "three", "InsertionSort", "BinarySeach", "MergeSort", "BoyerMoore"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Data Structures and Algorithms"
        view.backgroundColor = .white
        initTableView()
        // Do any additional setup after loading the view.
    }

    func initTableView() {
        view.addSubview(dataTableView)
        dataTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "suanfa_cell")
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

extension AlgorithmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSources.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suanfa_cell", for: indexPath)
        let title = dataSources[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            BWStack.hello()
        case 1:
            BWQueue.hello()
        case 2:
            print("Tree will be written here")
        case 3:
            BWInsertionSort.hello()

        case 4:
            BWBinarySearch.hello()
        case 5:
            BWMergeSort.hello()
        case 6:
            BWBoyerMoore().hello()
        default:
            break
        }
    }
}
