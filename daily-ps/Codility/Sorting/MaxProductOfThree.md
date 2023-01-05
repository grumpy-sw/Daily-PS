### Codility Lesson 6(Sorting) - MaxProductOfThree
👉 [문제 링크](https://app.codility.com/programmers/lessons/6-sorting/max_product_of_three/)

### 나의 접근 방법
세 수를 곱하여 큰 수를 얻는 방법
1. 양수 * 양수 * 양수 - 배열을 오름차순으로 정렬 후 가장 큰 수 3개를 곱한다.
2. 양수 * 음수 * 음수 - 배열을 오름차순으로 정렬 후 앞에서 두 수와 가장 마지막 원소를 곱한다.

두 경우를 비교하여 큰 숫자를 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    var result = Int.min
    let sortedNumbers = A.sorted()
    let lastIndex = A.count - 1
        
    if sortedNumbers.filter({ $0 < 0 }).count > 1 {
        result = max(result, sortedNumbers[0] * sortedNumbers[1] * sortedNumbers.last!)
    }
        
    result = max(result, sortedNumbers[lastIndex] * sortedNumbers[lastIndex - 1] * sortedNumbers[lastIndex - 2])
    return result
}
```
