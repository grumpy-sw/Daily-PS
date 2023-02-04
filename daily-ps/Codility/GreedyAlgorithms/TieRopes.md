### Codility Lession 16(Greedy algorithms) - TieRopes
👉 [문제 링크](https://app.codility.com/programmers/lessons/16-greedy_algorithms/tie_ropes/)

### 나의 접근 방법
길이가 K 이상이 될 때까지 앞에서부터 로프를 하나씩 합친다. 

### 코드
```swift
public func solution(_ K : Int, _ A : inout [Int]) -> Int {
    var offset = 0
    let N = A.count
    var ropes = 0
    var currentLength = 0
        
    while offset < N {
        currentLength += A[offset]
            
        if currentLength >= K {
            ropes += 1
            currentLength = 0
        }
        offset += 1
    }
        
    return ropes
}
```
