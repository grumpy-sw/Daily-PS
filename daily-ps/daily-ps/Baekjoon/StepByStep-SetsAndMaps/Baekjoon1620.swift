//
//  Baekjoon1620.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/20.
//

import Foundation

final class Baekjoon1620 {
    func run() {
        let inputNumbers = readLine()!.split(separator: " ").map { Int($0)! }
        let N = inputNumbers[0]
        let M = inputNumbers[1]
        var result: [String] = []
        
        var pokeDicByName: [String: Int] = [:]
        var pokeDicByNumber: [Int: String] = [:]
        for index in 1...N {
            let name = readLine()!
            pokeDicByName.updateValue(index, forKey: name)
            pokeDicByNumber.updateValue(name, forKey: index)
        }
        
        for _ in 0..<M {
            let input = readLine()!
            if let number = Int(input) { // 숫자가 입력된 경우
                result.append(pokeDicByNumber[number]!)
            } else {
                result.append(String(pokeDicByName[input]!))
            }
        }
        
        result.forEach {
            print($0)
        }
    }
}
