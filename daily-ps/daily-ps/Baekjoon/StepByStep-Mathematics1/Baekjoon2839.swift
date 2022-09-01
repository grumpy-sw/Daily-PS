//
//  Baekjoon2839.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon2839 {
    func run() {
        solution()
    }
    
    func solution() {
        var result = -1
        let target = Int(readLine()!)!
        
        var quotientFive = target / 5
        if (target - (quotientFive * 5)) % 3 == 0 {
            result = (target - (quotientFive * 5)) / 3 + quotientFive
        } else {
            while quotientFive > 0 {
                quotientFive -= 1
                if (target - (quotientFive * 5)) % 3 == 0 {
                    result = (target - (quotientFive * 5)) / 3 + quotientFive
                    break
                }
            }
        }
        
        print(result)
    }
}
