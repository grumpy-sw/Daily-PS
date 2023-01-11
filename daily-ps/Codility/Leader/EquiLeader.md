### Codility Lesson 8(Leader) - EquiLeader
👉 [문제 링크](https://app.codility.com/programmers/lessons/8-leader/equi_leader/)

### 나의 접근 방법
문제를 두 부분으로 나눠서 해결한다.
**1. Dominator를 구하기**
딕셔너리를 사용하여 각 숫자가 몇 번 나왔는지 기록한다.
딕셔너리의 value 최대값이 maxCount, maxCount를 갖는 key값이 Dominator가 된다.
- maxCount가 배열 A의 길이의 과반수 이상이 되지 않으면 Dominator가 없는 것으로 판단하여 0을 반환한다.

**2. EquiLeader 구하기**
leftCount = 0, rightCount = maxCount로 시작하여 배열 인덱스를 하나씩 확인한다.
- A[index] == dominator이면 leftCount를 1만큼 증가, rightCount를 1만큼 감소시킨다.
- 현재 인덱스를 기준으로 좌우로 나누어 각각의 count가 Dominator가 되는지 확인하고 result를 증가시킨다.

배열 순회가 끝나면 result를 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.count == 1 {
        return 0
    }
        
    var dict: [Int: Int] = [:]
    var dom = 0
    var maxCount = 0
    var result = 0
        
    for number in A {
        dict[number] = (dict[number] ?? 0) + 1
    }
        
    maxCount = dict.values.max()!
    guard maxCount > A.count/2 else {
        return 0
    }
    dom = dict.keys.first(where: { dict[$0] == maxCount })!

    var leftCount = 0
    var rightCount = maxCount
    for index in 0..<A.count {
        if A[index] == dom {
            leftCount += 1
            rightCount -= 1
        }
        if leftCount > (index+1)/2 && rightCount > (A.count - (index+1))/2 {
            result += 1
        }
    }
    return result
}
```


