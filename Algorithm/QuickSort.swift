//
//  QuickSort.swift
//  Algorithm
//
//  Created by great Lock on 2019/2/24.
//  Copyright © 2019 great Lock. All rights reserved.
//

import Foundation

struct QuickSortTest {
    init() {
        let arr = [6, 5, 3, 1, 8, 7, 2, 4]
        print(quickSort(arr))
    }
    
    func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        let pivot = array[array.count / 2]
        let middle = array.filter{ $0 == pivot }
        let left = array.filter{ $0 < pivot }
        let right = array.filter{ $0 > pivot }
        
        return quickSort(left) + middle + quickSort(right)
    }
}
