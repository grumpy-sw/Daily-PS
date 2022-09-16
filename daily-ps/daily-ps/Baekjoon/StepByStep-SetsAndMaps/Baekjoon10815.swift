//
//  Baekjoon10815.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/16.
//

import Foundation

final class Baekjoon10815 {
    func run() {
        _ = Int(readLine()!)!
        let cards = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
        
        _ = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
        var result: [String] = []
        
        numbers.forEach {
            let val = binarySearch(cards, $0, 0, cards.count - 1) >= 0 ? "1" : "0"
            result.append(val)
        }
        
        print(result.joined(separator: " "))
    }
    
    func binarySearch(_ cards: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        var start = start
        var end = end
        var mid: Int
        while start <= end {
            mid = (start + end) / 2
            
            if cards[mid] == target {
                return mid
            } else if cards[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return -1
    }
}
