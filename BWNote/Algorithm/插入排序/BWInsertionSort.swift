//
//  InsertionSort.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/26.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit

class BWInsertionSort: NSObject {
    /*
     插入排序
     */
    public func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        var a = array
        for x in 1..<a.count {
            var y = x
            // 一开始是获取数组的第二个
            let temp = a[y]
            // 第二个与第一个对比。如果第二个数 > 第一个数。两者交换
            /* 当交换2的时候，while会循环多次。
               [-1, 3, 9, 10, 2]
               [-1, 3, 9, 10, 10]
               [-1, 3, 9, 9, 10]
               [-1, 3, 3, 9, 10]
             */
            print("start============\(y)")
            while y > 0 && isOrderedBefore(temp, a[y-1]) {
                /// 两者交换。
                a[y] = a[y-1]
                y -= 1
//                print("while============\(y)")
                print("while============\(a)")
            }
            print("end============\(y)")
            a[y] = temp
            /*
             原始：[ 10, -1, 3, 9, 2]
             1：[ -1, 10, 3, 9, 2]
             2：[ -1, 3, 10, 9, 2]
             3：[ -1, 3, 9, 10, 2]
             4：[ -1, 2, 3, 9, 10]
             */
        }
        return a
    }
    func hello() {
        let numbers = [ 10, -1, 3, 9, 2]
//        let att = insertionSort(numbers, <)
//        let strings = [ "b", "a", "d", "c", "e" ]
//        let att2 =  insertionSort(strings, <)
//        print("att:\(att)")
        print("my_att:\(myInserSort(list: numbers))")
    }
    /*
     第一次循环时，从第2个数开始处理。我们将第1个数作为已经排好序的数据：当第2个数 > 第1个数时，将第2个数放在第1个数后面一个位置；否则，将第2个数放在第1个数前面。此时，前两个数形成了一个有序的数据。
     第二次循环时，我们处理第3个数。此时，前两个数形成了一个有序的数据：首先比较第3个数和第2个数，当第3个数 > 第2个数时，将第3个数放在第2个数后面一个位置并结束此次循环；否则，再和第1个数比较。如果第3个数 > 第1个数，则将第3个数插入第1个数和第2个数中间；否则，第3个数 < 第1个数，则将第3个数放在第1个数前面。此时，前三个数形成了一个有序的数据。
     后续的数据同理处理，直至结束。
     */
    /// 插入排序
    func myInserSort(list:[Int])->[Int] {
        var sortList = list
        for i in 1..<list.count {
            // 临时存放的位置
            var j = i
            // 当前要替换的数
            let current = list[i]
            // 当前的数一直跟下标前面的数比，然后交换位置。一直对比忘前移位
            while j > 0 && current > sortList[j - 1] {
               sortList[j] = sortList[j - 1]
                j -= 1
            }
            sortList[j] = current;
        }
        return sortList
    }
    
    public static func hello() {
        BWInsertionSort().hello()
    }
}
