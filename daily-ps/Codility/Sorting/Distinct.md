### Codility Lesson 6(Sorting) - Distinct
👉 [문제 링크](https://app.codility.com/programmers/lessons/6-sorting/distinct/)

### 나의 접근 방법

N개의 정수로 이루어진 배열 A가 입력으로 들어오면 배열 A 안에 중복되지 않은 개별 값의 수는 몇 개인지 찾는 문제이다.

배열을 Set으로 바꾸어 중복을 제거하고, Set의 원소 개수를 반환해주면 된다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    return Set(A).count
}
```

### 다른 풀이

Sorting 분류에 있는 만큼 정렬을 이용해서 문제를 풀어보았다.

배열을 오름차순으로 정렬한 뒤 첫 번째 원소를 inital으로 잡는다.
배열 원소를 하나씩 확인하면서 값이 변화할 때마다 result를 1씩 증가시킨다.
배열의 끝까지 확인이 끝나면 result를 반환한다.

두 방법 모두 시간 복잡도는 `O(N*log(N)) or O(N)`로 동일하다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    guard !A.isEmpty else {
        return 0
    }
    var result = 1
    let sortedNumbers = A.sorted()
    var initial = sortedNumbers[0]
    for index in 1..<sortedNumbers.count {
        if initial != sortedNumbers[index] {
            result += 1
            initial = sortedNumbers[index]
        }
    }
    return result
}
```
