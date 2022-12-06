//
//  Baekjoon2170.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/04.
//

// 골드 5. 선 긋기
// 알고리즘 분류: 정렬, 스위핑
import Foundation

final class Baekjoon2170 {
    
//    final class FileIO {
//        private let buffer:[UInt8]
//        private var index: Int = 0
//        
//        init(fileHandle: FileHandle = FileHandle.standardInput) {
//            
//            buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//        }
//        
//        @inline(__always) private func read() -> UInt8 {
//            defer { index += 1 }
//            
//            return buffer[index]
//        }
//        
//        @inline(__always) func readInt() -> Int {
//            var sum = 0
//            var now = read()
//            var isPositive = true
//            
//            while now == 10
//                    || now == 32 { now = read() } // 공백과 줄바꿈 무시
//            if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
//            while now >= 48, now <= 57 {
//                sum = sum * 10 + Int(now-48)
//                now = read()
//            }
//            
//            return sum * (isPositive ? 1:-1)
//        }
//        
//        @inline(__always) func readString() -> String {
//            var now = read()
//            
//            while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//            let beginIndex = index-1
//            
//            while now != 10,
//                  now != 32,
//                  now != 0 { now = read() }
//            
//            return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
//        }
//        
//        @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
//            var now = read()
//            
//            while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//            let beginIndex = index-1
//            
//            while now != 10,
//                  now != 32,
//                  now != 0 { now = read() }
//            
//            return Array(buffer[beginIndex..<(index-1)])
//        }
//    }
    
    func run() {
//        let fileIO = FileIO()
//        let n = fileIO.readInt()
        let n = Int(readLine()!)!
        
        var lines: [[Int]] = []
        for _ in 0..<n {
            //lines.append([fileIO.readInt(), fileIO.readInt()])
            lines.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        lines.sort {
            if $0[0] == $1[0] {
                return $0[1] < $0[1]
            } else {
                return $0[0] < $1[0]
            }
        }
        
        print(solution(lines))
    }
    
    func solution(_ lines: [[Int]]) -> Int {

        var start: Int = -1000000001
        var end: Int = -1000000001
        var length: Int = 0

        for line in lines {
            if end < line[0] {
                length += (end - start)
                start = line[0]
                end = line[1]
            } else {
                end = max(line[1], end)
            }
        }
        
        length += (end - start)
        return length
    }
}
