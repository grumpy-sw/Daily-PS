//
//  Baekjoon10163.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/01.
//

import Foundation

final class Baekjoon10163 {
    var map: [[Int]] = []
    var result: [Int] = []
    
    func run() {
        map = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
        result = Array(repeating: 0, count: 101)
        solution()
    }
    
    func solution() {
        let paperCount = Int(readLine()!)!
        for marker in 0..<paperCount {
            let oneLine: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
            let paper = Paper(x: oneLine[0], y: oneLine[1], width: oneLine[2], height: oneLine[3])
            fillTheMap(paper, marker: marker + 1)
        }
        
        for y in 0..<1001 {
            for x in 0..<1001 {
                if map[y][x] > 0 {
                    let count = map[y][x]
                    result[count] += 1
                }
            }
        }
        
        for index in 0..<paperCount {
            print(result[index+1])
        }
    }
    
    // 시간초과를 잡은 방법: ArraySlice 사용
    func fillTheMap(_ paper: Paper, marker: Int) {
        for y in paper.y..<paper.y+paper.height {
            map[y][paper.x..<paper.x + paper.width] = ArraySlice(repeating: marker, count: paper.width)
        }
    }

    struct Paper {
        let x: Int
        let y: Int
        let width: Int
        let height: Int
    }
}
