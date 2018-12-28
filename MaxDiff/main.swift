//
//  main.swift
//  MaxDiff
//
//  Created by Hanguang on 2018/12/28.
//  Copyright © 2018 hanguang. All rights reserved.
//

import Foundation

func customSort(_ a: Int...) {
    let frequencyPairs = a.map { ($0, 1) }
    // use swift 4 new func
    let dict = Dictionary(frequencyPairs, uniquingKeysWith: +)
    
    // create result array with value count
    var result: [[Int]] = []
    dict.values.forEach { _ in result.append([]) }
    
    // because Array is value type, so we have to replace it
    for (value, count) in dict {
        var array = result[count-1]
        for _ in 0..<count {
            array.append(value)
        }
        result[count-1] = array
    }
    
    // Functional Programming
    let _ = result.map { return $0.sorted() }
        .flatMap { $0 }
        .forEach { print("\($0)") }
}

customSort(3, 1, 2, 2, 4, 4, 7, 7, 1)


func maximumDifference(_ a: Int...) -> Int {
    var result = -1;
    
    for (i, value) in a.enumerated() {
        if i == 0 { continue }
        
        for j in (0..<i).reversed() {
            let number = a[j]
            if number < value {
                let temp = value-number
                if temp > result {
                    result = temp
                }
            }
        }
    }
    
    return result
}

let result = maximumDifference(2, 3, 10, 2, 4, 8, 1)
print("result should be 8: \(result)") // 8

let result2 = maximumDifference(10, 8, 4, 3, 2, 1)
print("If no item has a smaller item with a lower index then return -1: \(result2)") // -1

let result3 = maximumDifference()
print("If no parameters then return -1: \(result3)") // -1
