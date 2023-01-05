### Codility Lesson 4(Counting Elements) - PermCheck
👉 [문제 링크](https://app.codility.com/programmers/lessons/4-counting_elements/perm_check/)

### 나의 접근 방법
배열 A가 1부터 N까지의 수열인지 확인해야 한다.
길이가 A.count + 1인 [Bool]타입 배열 permutation을 만들고 배열 A의 원소에 해당하는 위치의 원소를 true로 변경한다.

배열 permutation에 아직 false가 있는지 확인하고 있으면 0, 없으면 1을 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    var permutation = Array(repeating: false, count: A.count + 1)
    permutation[0] = true
    for number in A {
        if number >= permutation.count {
            return 0
        }
        permutation[number] = true
    }
    if permutation.contains(false) {
        return 0
    }
    return 1
}
```
