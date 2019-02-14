//
//  Sort.swift
//  Algorithm
//
//  Created by great Lock on 2019/1/24.
//  Copyright © 2019 great Lock. All rights reserved.
//

import Foundation

struct SortTest {
    init() {
        let arr = [6, 5, 3, 1, 8, 7, 2, 4]
        let result = mergeSort(array: arr.map{[$0]})
        print(result.first)
    }
    
    func mergeSort(array: [[Int]]) -> [[Int]] {
        
        var tmp = array
        var result = [[Int]]()
        while tmp.count > 1 {
            let r = mergeArr(array: tmp.removeFirst(), otherArray: tmp.removeFirst())
            result.append(r)
        }
        if result.count == 1 {
            return result
        }
        return mergeSort(array: result)
    }
    
    func mergeArr(array: [Int], otherArray: [Int]) -> [Int] {
        var a = array
        var b = otherArray
        guard a.count == b.count else {
            a.append(contentsOf: b)
            return a
        }
        var result = [Int]()
        while a.count != 0 || b.count != 0 {
            if a.count == 0 {
                result.append(contentsOf: b)
                break
            }
            
            if b.count == 0 {
                result.append(contentsOf: a)
                break
            }
            
            let aFirst = a.first!
            let bFirst = b.first!
            
            if aFirst < bFirst {
                result.append(a.removeFirst())
            }else {
                result.append(b.removeFirst())
            }
        }
        return result
    }
}




