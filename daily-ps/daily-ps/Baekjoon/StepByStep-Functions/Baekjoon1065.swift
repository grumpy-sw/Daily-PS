//
//  Baekjoon1065.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon1065 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var count: Int = 0
        for num in 1...n {
            if checkIsCorrect(num) {
                count += 1
            }
        }
        print(count)
    }
    
    func checkIsCorrect(_ num: Int) -> Bool {
        let numberUnits = Array(String(num)).map{ String($0) }.map{ Int($0)! }
        
        if numberUnits.count == 1 || numberUnits.count == 2 {
            return true
        } else if numberUnits.count == 3 {
            let difference = numberUnits[0] - numberUnits[1]
            if (numberUnits[1] - numberUnits[2]) == difference {
                return true
            }
        }
        return false
    }
}
