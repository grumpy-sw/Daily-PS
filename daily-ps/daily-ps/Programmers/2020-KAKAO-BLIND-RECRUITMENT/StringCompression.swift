//
//  StringCompression.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/27.
//

import Foundation

final class StringCompression {
    func run() {
        print(solution("a"))
    }
    
    func solution(_ s:String) -> Int {
        let str = Array(s).map{ String($0) }
        var minLength = 1001
        var maxCompressionLength = 0
        maxCompressionLength = str.count > 1 ? str.count / 2 : 1
        
        for compressionLength in 1...maxCompressionLength {
            var result: [String] = []
            var offset = 0
            var pattern: String = ""
            var count = 1
            
            while true {
                let slice: String
                if offset + compressionLength >= str.count {
                    slice = Array(str[offset..<str.count]).joined()
                    if pattern.isEmpty {
                        result.append(slice)
                    } else {
                        if pattern == slice {
                            count += 1
                            result.append(String(count) + pattern)
                        } else {
                            result.append(count == 1 ? pattern : String(count) + pattern)
                            result.append(slice)
                        }
                        
                    }
                    break
                }
                slice = Array(str[offset..<offset+compressionLength]).joined()
                if pattern.isEmpty {
                    pattern = slice
                } else {
                    if pattern == slice {
                        count += 1
                    } else {
                        result.append(count == 1 ? pattern : String(count) + pattern)
                        pattern = slice
                        count = 1
                    }
                }
                
                offset += compressionLength
            }
            
            //print(result.joined())
            minLength = min(minLength, result.joined().count)
        }
        return minLength
    }
}
