//
//  AppInfoViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AppInfoViewController: BaseViewController {
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bundleIDLabel: UILabel!
    @IBOutlet weak var isCrashLabel: UILabel!
    var appInfo:AppInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = appInfo?.app_name ?? ""
        binddata()
        
        // Do any additional setup after loading the view.
    }
    func binddata() {
        self.appNameLabel.text = "app名称：\(appInfo?.app_name ?? "")"
        self.statusLabel.text = "app状态：\(appInfo?.status ?? "")"
        self.bundleIDLabel.text = "包ID：\(appInfo?.bundle_id ?? "")"
        self.isCrashLabel.text = "是否闪退：\(appInfo?.is_crash ?? false)"
    }
    
    @IBAction func clickOntheRecord(_ sender: Any) {
        let vc = RecordViewController()
        vc.id = appInfo?.id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
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
