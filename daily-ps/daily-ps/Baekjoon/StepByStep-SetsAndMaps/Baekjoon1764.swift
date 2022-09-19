//
//  Baekjoon1764.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/18.
//

import Foundation

final class Baekjoon1764 {
    func run() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let N = input[0]    // 듣도 못한 사람의 수 N
        let M = input[1]    // 보도 못한 사람의 수 M
        
        var array1: [String] = []
        var result: [String] = []
        
        for _ in 0..<N {
            array1.append(readLine()!)
        }
        
        array1 = array1.sorted()
        
        for _ in 0..<M {
            let target = readLine()!
            
            if binarySearch(array1, target, 0, array1.count - 1) >= 0 {
                result.append(target)
            }
        }
        
        print(result.count)
        result.sorted().forEach {
            print($0)
        }
    }
    
    func binarySearch(_ array: [String], _ target: String, _ start: Int, _ end: Int) -> Int {
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
}
