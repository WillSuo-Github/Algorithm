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
        print(bookMergeSort(arr))
    }
    
    func bookMergeSort(_ array: [Int]) -> [Int] {
        var helper = Array(repeating: 0, count: array.count), array = array
        mergeSort(&array, &helper, 0, array.count - 1)
        return array
    }
    
    func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
        guard low < high else {
            return
        }
        
        let middle = (high - low) / 2 + low
        mergeSort(&array, &helper, low, middle)
        mergeSort(&array, &helper, middle + 1, high)
        merge(&array, &helper, low, middle, high)
    }
    
    func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
        for i in low...high {
            helper[i] = array[i];
        }
        
        var  helperLeft = low, helperRight = middle + 1, current = low
        
        while helperLeft <= middle && helperRight <= high {
            if helper[helperLeft] <= helper[helperRight] {
                array[current] = helper[helperLeft]
                helperLeft += 1
            } else {
                array[current] = helper[helperRight]
                helperRight += 1
            }
            current += 1
        }
        
        guard middle - helperLeft >= 0 else {
            return
        }
        
        for i in 0...middle - helperLeft {
            array[current + i] = helper[helperLeft + i]
        }
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




