//
//  ResponseHitView.swift
//  BWNote
//
//  Created by bairdweng on 2020/9/22.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit

class ResponseHitView: UIView {
    lazy var testView1: UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        return view
    }()

    lazy var testView2: UIButton = {
        let view = UIButton()
        view.backgroundColor = .yellow
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(testView1)
        testView1.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.left.equalTo(100)
            make.top.equalTo(100)
        }
        testView1.addTarget(self, action: #selector(clickOntheTest1), for: .touchUpInside)

        addSubview(testView2)
        testView2.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalTo(testView1.snp.bottom).offset(-30)
            make.left.equalTo(testView1.snp.left).offset(15)
        }
        testView2.addTarget(self, action: #selector(clickOntheTest2), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
         // Drawing code
     }
     */

    @objc func clickOntheTest1() {
        print("hello,I am is Test1,i was hit")
    }

    @objc func clickOntheTest2() {
        print("hello,I am is Test1,i was hit")
    }

    // Here you can retun best View that needs a response
    override func hitTest(_: CGPoint, with _: UIEvent?) -> UIView? {
        return nil
    }
}
