//
//  MenuRenewal.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/23.
//

import Foundation

final class MenuRenewal {
    func run() {
        print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
    }
    
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        var result: [String] = []
        let orders_array = orders.map{ Array($0).map{ String($0) }.sorted()}
        
        for count in course {
            var dictionary: [String: Int] = [:]
            orders_array.forEach {
                dictionary = classifyOrder($0, count, dictionary)
            }
            let maxSet: [String] = dictionary.keys.filter {
                (dictionary[$0]! >= 2) && (dictionary[$0] == dictionary.values.max())
            }
            result += maxSet
        }
        
        return result.sorted()
    }
    
    func classifyOrder(_ array: [String], _ count: Int, _ dict: [String: Int]) -> [String: Int] {
        var dictionary = dict
        let orderArray: [String] = combination(array, count: count)
        
        orderArray.forEach {
            dictionary.updateValue((dictionary[$0] ?? 0) + 1, forKey: $0)
        }
        return dictionary
    }
    
    func combination(_ array: [String], count: Int) -> [String] {
        var result = [String]()
        
        // Early Exit
        if array.count < count { return result }
        
        func pick(_ now: [String], offset: Int) {
            if now.count == count {
                result.append(now.joined())
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        
        pick([], offset: 0)
        return result
    }
}
