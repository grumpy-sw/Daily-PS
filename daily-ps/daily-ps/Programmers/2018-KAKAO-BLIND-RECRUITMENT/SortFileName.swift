//
//  SortFileName.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/01.
//

import Foundation

final class SortFileName {
    func run() {
        print(solution(["fo o9.txt", "foo010bar020.zip", "F-15"]))
    }
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    func solution(_ files: [String]) -> [String] {
        var items = [Item]()
        
        for index in 0..<files.count {
            items.append(convertItem(files[index], index))
        }
        
        items.sort { item1, item2 in
            if item1.head == item2.head {
                if item1.number == item2.number {
                    return item1.index < item2.index
                } else {
                    return item1.number < item2.number
                }
            } else {
                return item1.head < item2.head
            }
        }
        
        var result: [String] = []
        items.forEach {
            result.append(files[$0.index])
        }
        
        return result
    }
    
    func convertItem(_ file: String, _ index: Int) -> Item {
        let file = Array(file).map{ String($0) }
        
        // Header
        var header = [String]()
        for index in 0..<file.count {
            if numbers.contains(file[index]) {
                header = Array(file[0..<index])
                break
            }
        }
        
        // Number
        var number = [String]()
        for index in header.count..<file.count {
            if numbers.contains(file[index]) {
                number.append(file[index])
            } else {
                break
            }
            if number.count == 5 {
                break
            }
        }
        
        return Item(head: header.joined().lowercased(), number: Int(number.joined())!, index: index)
    }
    
    struct Item {
        let head: String
        let number: Int
        let index: Int
    }
}
