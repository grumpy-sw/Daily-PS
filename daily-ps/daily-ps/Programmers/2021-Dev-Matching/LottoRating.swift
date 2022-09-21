//
//  LottoRating.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/21.
//

// Level 1. 로또의 최고 순위와 최저 순위

import Foundation

final class LottoRating {
    func run() {
        print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
    }
    
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        var count = 0
        var zeroCount = 0
        
        for lotto in lottos {
            let number = lotto
            if lotto == 0 {
                zeroCount += 1
            } else if binarySearch(win_nums.sorted(), number, 0, lottos.count - 1) >= 0 {
                count += 1
            }
        }
        
        let rowRating = Rating(rawValue: count)?.rate
        let highRating = Rating(rawValue: count + zeroCount)?.rate
        return [highRating!, rowRating!]
    }
    
    func binarySearch(_ array: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        var start = start
        var end = end
        var mid: Int
        while start <= end {
            mid = (start + end) / 2
            
            if array[mid] == target {
                return mid
            } else if array[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return -1
    }
    
    enum Rating: Int {
        case first = 6
        case second = 5
        case third = 4
        case fourth = 3
        case fifth = 2
        case sixth = 1
        case fail = 0
        
        var rate: Int {
            switch self {
            case .first:
                return 1
            case .second:
                return 2
            case .third:
                return 3
            case .fourth:
                return 4
            case .fifth:
                return 5
            case .sixth, .fail:
                return 6
            }
        }
    }
}
