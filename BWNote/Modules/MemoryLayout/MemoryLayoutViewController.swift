

//
//  MemoryLayoutViewController.swift
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

/* Allocated in stack area:
 1.local variable

 */

import UIKit

class MemoryLayoutViewController: UIViewController {
    let cellId = "memory_cell_id"

    lazy var tableView: UITableView = { [weak self] in
        let tabView = UITableView()
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tabView
    }()

    lazy var dataSource: [String] = {
        ["Show memory layout", "Why not crash?", "Why will crash?"]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memory layout"

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }

        // set headImage
        let headImageView = UIImageView()
        headImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250)
        headImageView.image = UIImage(named: "memory_layout")
        headImageView.contentMode = .scaleAspectFit
        view.addSubview(headImageView)
        tableView.tableHeaderView = headImageView

        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little
     preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

extension MemoryLayoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            MemoryLayout().hello()
        case 1:
            MemoryLayout().whyNotCrash()
        case 2:
            MemoryLayout().whyWillCrach()
        default:
            break
        }
    }
}
