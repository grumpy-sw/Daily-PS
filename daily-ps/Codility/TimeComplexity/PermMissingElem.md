### Codility Lesson 3(Time Complexity) - PermMissingElem
👉 [문제 링크](https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/)

### 나의 접근 방법
idle case인 correctNumbers 배열을 만든다.
오름차순으로 A를 정렬한 sortedNumbers와 correctNumbers를 비교하여 중간에 빠진 원소가 있다면 그 값을 반환하고, 배열의 끝까지 도달했다면 가장 마지막 숫자가 빠졌으므로 correctNumbers의 마지막 원소를 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.isEmpty {
        return 1
    }
        
    let correctNumbers = Array<Int>(1...A.count+1)
    let sortedNumbers = A.sorted()
        
    for index in 0..<A.count {
        if correctNumbers[index] != sortedNumbers[index] {
            return correctNumbers[index]
        }
    }
        
    return correctNumbers.last!
}
```
