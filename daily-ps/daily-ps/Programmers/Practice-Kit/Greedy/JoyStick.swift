//
//  JoyStick.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/25.
//

import Foundation

final class JoyStick {
    func run() {
        print(solution("GTAASKKAE"))
    }
    
    func solution(_ name: String) -> Int {
        let name = Array(name).map{ String($0) }
        if name.allSatisfy({ $0 == "A" }) {
            return 0
        }
        
        var count = 0
        count += min(findLastIndexOfNotA(name), lengthWhenTurnOnce(name))
        for character in name {
            count += requiredMoveCount(for: character)
        }
        
        return count
    }
    
    func findLastIndexOfNotA(_ name: [String]) -> Int {
        // 정방향으로만 탐색할 때
        let right = name.lastIndex(where: { $0 != "A" }) ?? name.count - 1
        
        // 역방향으로만 탐색할 때
        let left = name.count - (name.firstIndex(where: { $0 != "A" }) ?? name.count - 1)
        return min(left, right)
    }
    
    func lengthWhenTurnOnce(_ name: [String]) -> Int {
        return min(lengthFromStartedA(name), lengthFromContinuedA(name))
    }
    
    func lengthFromStartedA(_ name: [String]) -> Int {
        var x = 0
        var y = 0
        
        x = name.firstIndex(where: { $0 != "A" })!
        y = x
        var resultXtoY = 0
        for index in x..<name.count - 1 {
            if name[index + 1] != "A" {
                y = index + 1
                break
            }
        }
        
        if x == y {
            resultXtoY = min(x, name.count - x)
        } else {
            resultXtoY = min(2 * x + name.count - y, 2 * (name.count - y) + x)
        }
        
        var resultYtoX = 0
        y = name.lastIndex(where: { $0 != "A" })!
        x = y
        
        for index in stride(from: y, to: 1, by: -1) {
            if name[index - 1] != "A" {
                x = index - 1
                break
            }
        }
        
        if x == y {
            resultYtoX = min(x, name.count - x)
        } else {
            resultYtoX = min(2 * x + name.count - y, 2 * (name.count - y) + x)
        }
        return min(resultXtoY, resultYtoX)
    }
    
    func lengthFromContinuedA(_ name: [String]) -> Int {
        let continuedAIndex: [Int] = rangeOfMostContinuedA(name)
        var x = 0
        var y = 0
        
        if continuedAIndex == [0, 0] || continuedAIndex[0] == 0 || continuedAIndex[1] == name.count - 1 {
            return name.count
        }
        x = continuedAIndex[0] - 1
        y = continuedAIndex[1] + 1
        return min(2 * x + name.count - y, 2 * (name.count - y) + x)
    }
    
    func rangeOfMostContinuedA(_ name: [String]) -> [Int] {
        let totalA = name.filter({ $0 == "A" }).count
        
        for number in stride(from: totalA, through: 2, by: -1) {
            for index in 0...name.count - number {
                if name[index..<index+number] == ArraySlice(repeating: "A", count: number) {
                    return [index, index + number - 1]
                }
            }
        }
        return [0, 0]
    }
    
    func requiredMoveCount(for character: String) -> Int {
        if character == "A" {
            return 0
        }
        
        return Int(min(Character(character).asciiValue! - 65, 26 - (Character(character).asciiValue! - 65)))
    }
}
