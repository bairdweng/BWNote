//
//  BaseViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
