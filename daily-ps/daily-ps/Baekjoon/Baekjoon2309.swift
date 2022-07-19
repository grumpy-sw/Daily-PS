//
//  Baekjoon2309.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/19.
//

import Foundation

//let testInput = """
//20
//7
//23
//19
//10
//15
//25
//8
//13
//"""

final class Baekjoon2309: Baekjoon {
    
    var array = [Int]()
    
    override func run() {
        for _ in 0..<9 {
            array.append(Int(readLine()!)!)
        }
        
        let result = self.combination(array, count: 7)
        for number in result {
            print(number)
        }
    }
    
    func combination(_ array: [Int], count: Int) -> [Int] {
        var result: [Int] = []
        if array.count < count {
            return result
        }
        
        func pick(_ now: [Int], offset: Int) {
            if now.count == count, now.reduce(0, +) == 100 {
                result = now.sorted()
                return
            }
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index + 1)
            }
        }
        
        pick([], offset: 0)
        return result
    }
}
