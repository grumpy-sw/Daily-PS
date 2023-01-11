### Codility Lesson 8(Leader) - Dominator
👉 [문제 링크](https://app.codility.com/programmers/lessons/8-leader/dominator/)

### 나의 접근 방법
배열 A의 원소가 Dominator가 되려면 개수가 배열 A의 과반수 이상이어야 한다. 따라서 정렬했을 때 (Dominator가 존재한다면) 중간 지점은 항상 Dominator이다.
배열 A를 오름차순으로 정렬한 배열 Numbers의 중앙값 midValue을 구한다.
filter 고차함수를 통해 배열 A 안에서 midValue의 개수가 과반수 이상인지 아닌지를 확인한다. 
- 과반수가 아니라면 Dominator가 없으므로 -1을 반환한다.
- 과반수 이상이라면 firstIndex(of:) 메서드를 통해 Dominator의 Index를 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.count == 0 {
        return -1
    }
        
    if A.count == 1 {
        return 0
    }
        
    let numbers = A.sorted()
    let midValue = numbers[numbers.count/2]
        
    if A.filter({ $0 == midValue }).count > numbers.count / 2 {
        return A.firstIndex(of: midValue)!
    } else {
        return -1
    }
}
```
