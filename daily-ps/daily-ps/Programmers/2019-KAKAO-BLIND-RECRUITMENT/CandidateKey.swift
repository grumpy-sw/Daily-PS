//
//  CandidateKey.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/29.
//

import Foundation

final class CandidateKey {
    func run() {
        print(solution(
            [
                ["100","ryan","music","2"],
                ["200","apeach","math","2"],
                ["300","tube","computer","3"],
                ["400","con","computer","4"],
                ["500","muzi","music","3"],
                ["600","apeach","music","2"]
            ]
        ))
    }
    
    func solution(_ relation:[[String]]) -> Int {
        let columns = Array(0..<relation[0].count)
        
        var result: [[Int]] = []
        for count in 0..<columns.count {
            let keyArray: [[Int]] = combination(columns, count + 1)
            for keys in keyArray {
                if isUnique(relation, keys), isMinimal(keys, in: result) {
                    result.append(keys)
                }
            }
        }
        
        return result.count
    }
    
    func combination(_ array: [Int], _ count: Int) -> [[Int]] {
        var result = [[Int]]()
        
        if array.count < count { return result }
        
        func pick(_ now: [Int], _ offset: Int) {
            if now.count == count {
                result.append(now)
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], index + 1)
            }
        }
        
        pick([], 0)
        return result
        
    }
    
    func isUnique(_ relation: [[String]], _ keys: [Int]) -> Bool {
        var array: [[String]] = Array(repeating: [], count: relation.count)
        for index in 0..<relation.count {
            for key in keys {
                array[index].append(relation[index][key])
            }
        }
        
        array = Array(Set(array))
        if array.count != relation.count {
            return false
        }
        
        return true
    }
    
    func isMinimal(_ key: [Int], in keys: [[Int]] ) -> Bool {
        for index in 0..<keys.count {
            if Set(keys[index]).isSubset(of: key) {
                return false
            }
        }
        return true
    }
}
