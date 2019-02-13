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
        
        if array.count > 1 {
            
        }
        
        
    }
    
    func mergeArr(array: [Int], otherArray: [Int]) -> [Int] {
        var a = array
        var b = otherArray
        guard a.count == b.count else {
            a.append(contentsOf: b)
            return a
        }
        var result = [Int]()
        for i in 0..<a.count {
            if a[i] < b[i] {
                result.append(a[i])
            }else {
                result.append(b[i])
            }
        }
        return result
    }
}




