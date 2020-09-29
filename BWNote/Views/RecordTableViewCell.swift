//
//  RecordTableViewCell.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    @IBOutlet var showLabel: UILabel!
    var model: RecordItem? {
        didSet {
            showLabel.text = "日期：\(model?.CreatedAt ?? "") \n\n ip：\(model?.ip ?? "")"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
