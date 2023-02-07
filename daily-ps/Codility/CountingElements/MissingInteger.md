### Codility Lession 4(Counting Elements) - MissingInteger
👉 [문제 링크](https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/)

### 나의 접근 방법
- 배열 A의 중복을 없애면서 음수를 모두 제거하고 오름차순으로 정렬한다. (Set, filter 사용)
- 검사할 번호를 1부터 하나씩 올려가며 정렬된 배열에 빠진 번호가 없는지 확인한다.
- 배열 순회가 끝까지 완료되면 그 다음 수를, 중간에 매칭되지 않는 요소가 있다면 그 수를 반환한다.

### 코드
```swift
public func solution(_ A : inout [Int]) -> Int {
    let sortedArray = Array(Set(A.filter { $0 > 0 })).sorted()
    var checkingNumber = 1
        
    for index in 0..<sortedArray.count {
        if checkingNumber != sortedArray[index] {
            return checkingNumber
            }
        checkingNumber += 1
    }
        
    return checkingNumber
}
```
