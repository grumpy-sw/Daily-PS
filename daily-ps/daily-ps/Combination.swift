//
//  Combination.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/19.
//

import Foundation

// 조합
func combination(_ array: [Int], count: Int) -> [[Int]] {
    var result = [[Int]]()
    
    // Early Exit
    if array.count < count { return result }
    
    func pick(_ now: [Int], offset: Int) {
        if now.count == count {
            result.append(now)
            return
        }
        
        for index in offset..<array.count {
            pick(now + [array[index]], offset: index+1)
        }
    }
    
    pick([], offset: 0)
    return result
}
