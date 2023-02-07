### Codility Lession 4(Counting Elements) - MaxCounters
👉 [문제 링크](https://app.codility.com/programmers/lessons/4-counting_elements/max_counters/)

### 나의 접근 방법
- (N+1)이 나올 때마다 배열을 변경하면 시간 초과가 발생한다.
- 일반적인 상황일 때는 현재 Max Count 값을 체크하고 있다가, (N+1)이 나오면 calledMax에 이 값을 저장한다.
- 만약 호출된 Counter가 calledMax보다 작은 값이라면 Max Counter가 반영된 값으로 변경한다.(`array[pos] = calledMax + 1`)
- 배열 순회가 끝나고 calledMax보다 작은 값이 있다면 요소의 값을 calledMax로 채운다.
  
### 코드
```swift
public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var array = Array(repeating: 0, count: N)
    var maxCount = 0
    var calledMax = 0
        
    for operation in A {
        let pos = operation - 1
        if pos == N {
            calledMax = maxCount
        } else {
            if array[pos] < calledMax {
                array[pos] = calledMax + 1
            } else {
                array[pos] += 1
            }
                
            if maxCount < array[pos] {
                maxCount += 1
            }
        }
    }
        
    return array.map { num in
        num < calledMax ? calledMax : num
    }
}
```
