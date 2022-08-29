//
//  DoublePriorityQueue.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class DoublePriorityQueue {
    
    func run() {
        print(solution(["I 1", "I 2", "I 3", "I 4", "I -5", "D -1", "D 1", "D 1", "I 123", "I 456", "I 789", "D -1", "D -1"]))
        
        // testcase: ["I 1", "I 2", "I 3", "I 4", "I 5", "I 6", "I 7", "I 8", "I 9", "I 10", "D 1", "D -1", "D 1", "D -1", "I 1", "I 2", "I 3", "I 4", "I 5", "I 6", "I 7", "I 8", "I 9", "I 10", "D 1", "D -1", "D 1", "D -1"]
    }
            
    func solution(_ operations:[String]) -> [Int] {
        var maxQueue = Heap<Int>(sort: >)
        var minQueue = Heap<Int>(sort: <)
        
        for index in 0..<operations.count {
            let operation = operations[index].split(separator: " ").map { String($0) }
            let command = operation[0]
            let number = Int(operation[1])!
            
            if command == "I" {
                maxQueue.append(number)
                minQueue.append(number)
            } else if command == "D" {
                if number == 1 {
                    _ = maxQueue.removeFirst()
                    let elements = maxQueue.elements
                    minQueue.removeAll()
                    maxQueue.removeAll()
                    elements.forEach {
                        maxQueue.append($0)
                        minQueue.append($0)
                    }
                }
                if number == -1 {
                    _ = minQueue.removeFirst()
                    let elements = minQueue.elements
                    minQueue.removeAll()
                    maxQueue.removeAll()
                    elements.forEach {
                        maxQueue.append($0)
                        minQueue.append($0)
                    }
                }
            }
        }
        
        var numbers = maxQueue.elements.sorted()
        if numbers.isEmpty {
            numbers.append(0)
        }
        return [numbers.last!, numbers.first!]
    }
    
    struct Heap<T: Comparable> {
        private(set) var elements: [T] = []
        var sort: (T, T) -> Bool
        
        init(sort: @escaping (T, T) -> Bool) {
            self.sort = sort
        }
        
        var isEmpty: Bool {
            return self.elements.isEmpty
        }
        
        mutating func append(_ element: T) {
            elements.append(element)
            sortUp(of: elements.count - 1)
        }
        
        mutating func removeFirst() -> T? {
            guard !elements.isEmpty else {
                return nil
            }
            elements.swapAt(0, elements.count - 1)
            let element = elements.removeLast()
            sortDown(of: 0)
            return element
        }
        
        mutating func removeAll() {
            elements.removeAll()
        }
        
        mutating func sortUp(of index: Int) {
            var child = index
            var parent = self.parent(of: child)
            
            while child > 0, sort(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = self.parent(of: parent)
            }
        }
        
        mutating func sortDown(of index: Int) {
            var parent = index
            
            while rightChild(of: parent) < elements.count {
                let leftElement = leftChild(of: parent)
                let rightElement = rightChild(of: parent)
                var temp = parent
                
                if leftElement < elements.count && sort(elements[leftElement], elements[parent]) {
                    temp = leftElement
                }
                if rightElement < elements.count && sort(elements[rightElement], elements[parent]) {
                    temp = rightElement
                }
                
                if temp == parent {
                    return
                }
                
                elements.swapAt(parent, temp)
                parent = temp
            }
        }
        
        // MARK: - Private Methods
        
        private func leftChild(of index: Int) -> Int {
            return index * 2 + 1
        }
        
        private func rightChild(of index: Int) -> Int {
            return index * 2 + 2
        }
        
        private func parent(of index: Int) -> Int {
            return (index - 1) / 2
        }
    }
}
