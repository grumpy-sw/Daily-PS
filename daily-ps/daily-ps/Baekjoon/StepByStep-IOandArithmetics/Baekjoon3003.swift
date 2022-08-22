//
//  Baekjoon3003.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon3003 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        var results: [Int] = []
        for index in 0..<numbers.count {
            let chessType = Chess(rawValue: index)
            results.append(chessType!.value - numbers[index])
        }
        
        results.forEach {
            print($0, terminator: " ")
        }
    }
    
    enum Chess: Int {
        case king = 0
        case queen = 1
        case look = 2
        case bishop = 3
        case knight = 4
        case pawn = 5
        
        var value: Int {
            switch self {
            case .king:
                return 1
            case .queen:
                return 1
            case .look:
                return 2
            case .bishop:
                return 2
            case .knight:
                return 2
            case .pawn:
                return 8
            }
        }
    }
}
