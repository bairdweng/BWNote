//
//  LoadAndInitializeViewController.swift
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class LoadAndInitializeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickOntheExample1(_ sender: Any) {
        LoadExample1().hello()
    }
    
    @IBAction func clickOntheChdrenExample1(_ sender: Any) {
        ChildrenLoadExample1().hello()
    }
    
    @IBAction func clickOntheGrandSonExample1(_ sender: Any) {
        GrandSonExample1().hello()
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
