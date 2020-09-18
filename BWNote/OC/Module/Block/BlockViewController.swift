//
//  BlockViewController.swift
//  BWNote
//
//  Created by bairdweng on 2020/9/18.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {
    let cellId = "block_cell_id"
    
    
    lazy var tableView:UITableView = { [weak self] in
        let tabView = UITableView()
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tabView
    }()
    
    lazy var dataSource:[String] = {
        return [
            "Show CircularReference",
            "Modify the variables outside the block inside the block"
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "what is a block?"
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
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

extension BlockViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            CircularReference().willCircularReferenc()
            break
        case 1:
            CircularReference().modifyValueTheBlockInside()
            break
        default:
            break
        }
    }
}
