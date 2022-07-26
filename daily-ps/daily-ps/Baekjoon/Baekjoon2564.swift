//
//  Baekjoon2564.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/27.
//

import Foundation

final class Baekjoon2564 {
    /*
     백준 2564 - 경비원
     start : 원점
     mid   : 동근
     end   : 상점
        end - start
      - mid - start
     --------------
        end - mid
     인 것을 응용.
     원점에서 각 상점까지의 거리를 구한 뒤 원점에서 동근이(mid)까지의 거리를 빼서 계산하였습니다.
     이 때 뺀 값이 전체 길이의 50%가 넘는다면, 반대 방향이 더 빠른 것입니다.
     */
    
    func run() {
        let rowAndCol: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        let col = rowAndCol[0]
        let row = rowAndCol[1]
        var markets: [Int] = []
        
        for _ in 0..<Int(readLine()!)! {
            let oneLine = readLine()!.split(separator: " ").map { Int($0)! }
            markets.append(distanceOfMarket(type: Compass(rawValue: oneLine[0])!, pos: oneLine[1], row: row, col: col))
        }
        let oneLine = readLine()!.split(separator: " ").map { Int($0)! }
        let distanceOfPoint = distanceOfMarket(type: Compass(rawValue: oneLine[0])!, pos: oneLine[1], row: row, col: col)
        print(solution(markets, distanceOfPoint, row: row, col: col))
    }
    
    func solution(_ markets: [Int], _ point: Int, row: Int, col: Int) -> Int {
        var result = 0
        markets.forEach {
            var distance = abs($0 - point)
            if distance > (row + col) {
                distance = 2 * (row + col) - distance
            }
            result += distance
        }
        return result
    }
    
    // 원점에서 각 상점까지의 "시계방향" 거리 계산
    func distanceOfMarket(type: Compass, pos: Int, row: Int, col: Int) -> Int {
        switch type {
        case .North:
            return pos
        case .South:
            return 2 * col + row - pos
        case .West:
            return 2 * (col + row) - pos
        case .East:
            return col + pos
        }
    }
    
    enum Compass: Int {
        case North = 1
        case South = 2
        case West = 3
        case East = 4
    }
}
