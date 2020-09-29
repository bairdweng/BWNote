//
//  AppInfoViewController.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AppInfoViewController: BaseViewController {
    @IBOutlet var appNameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var bundleIDLabel: UILabel!
    @IBOutlet var isCrashLabel: UILabel!
    var appInfo: AppInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = appInfo?.app_name ?? ""
        binddata()

        // Do any additional setup after loading the view.
    }

    func binddata() {
        appNameLabel.text = "app名称：\(appInfo?.app_name ?? "")"
        statusLabel.text = "app状态：\(appInfo?.status ?? "")"
        bundleIDLabel.text = "包ID：\(appInfo?.bundle_id ?? "")"
        isCrashLabel.text = "是否闪退：\(appInfo?.is_crash ?? false)"
    }

    @IBAction func clickOntheRecord(_: Any) {
        let vc = RecordViewController()
        vc.id = appInfo?.id ?? 0
        navigationController?.pushViewController(vc, animated: true)
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
