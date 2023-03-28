### Codility Lession 17(Dynamic programming) - MinAbsSum
👉 [문제 링크](https://app.codility.com/programmers/lessons/17-dynamic_programming/min_abs_sum/)

### 나의 접근 방법
**처음에 접근한 방법**
- 배열 A를 모두 양수로 바꾼 뒤 총합(totalSum)을 구한다.
- 부분합이 총합의 절반이 될 때가 var(A, S)가 가장 작은 경우이므로 totalSum/2까지의 부분합을 조합을 통해 모두 구한다.
- 구한 부분합 중 가장 큰 수를 sum이라고 하면, totalSum - sum * 2의 값을 반환한다.
- 정확성은 다 맞았지만, 당연하게도 효율성을 통과하지 못했다. `(O(N**2 * max(abs(A)))`
- 조합으로 부분합을 구하는 부분이 효율적이지 못하다고 판단됨.
- 또한 중복처리를 Array -> Set -> Array로 처리를 했었는데 중복된 요소가 많이 포함된 경우 이 부분이 불필요한 연산이 많이 발생할 것 같다.

**해결한 방법**
- 부분합을 구하는 방법을 두 단계로 나눈다.
    - 1. counts 배열: A의 요소가 나타난 개수
    - 2. map 배열: totalSum까지의 숫자들 중에서A로 만들 수 있는 부분합 여부를 확인하는 배열(map[i] = i를 부분합으로 만들고 나서 A의 원소 중 남은 원소가 있는지 판별)
- 동일한 숫자에 대한 처리를 counts 배열을 통해 한 번에 처리함으로써 중복 연산을 줄이는 방법
- 먼저 모든 map 배열을 -1로 설정하고, map[0] = 0으로 설정한다.
```swift
if index >= number, map[index - number] > 0 {
    map[index] = map[index - number] - 1
}
```
- 이 부분이 이해가 안됐었는데 만약 index라는 숫자를 만들려고 하고, index - number를 만들 수 있다면 이것을 재사용한 뒤 number를 더해주면 되므로 map[index]를 만들 수 있다고 표시할 수 있다. 이 때 number를 사용했으므로 map[index-number]에서 1을 빼준 값을 할당한다.
- 부분합 판별 배열을 얻었다면 `total - 2 * index` 중 가장 작은 값을 결과로 반환하면 된다.
- [참고한 자료](https://codility.com/media/train/solution-min-abs-sum.pdf)
- 이 알고리즘의 시간복잡도는 `O(N * max(abs(A))**2)이다.`


### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.isEmpty {
        return 0
    }
        
    let A = A.map{ $0 < 0 ? -$0 : $0 }
    let totalSum = A.reduce(0, +)
    let maxNum = A.max()!
        
    if maxNum > totalSum / 2 {
        return abs(totalSum - 2 * maxNum)
    }
        
    let map = subSumMap(in: A)
    var result = Int.max
        
    for index in 0...totalSum/2 {
        if map[index] >= 0 {
        result = min(result, totalSum - 2 * index)
        }
    }
        
    return result
}
    
func subSumMap(in numbers: [Int]) -> [Int] {
    let maxNum = numbers.max()!
    let totalSum = numbers.reduce(0, +)
    var map = Array(repeating: -1, count: totalSum/2 + 1)
    map[0] = 0
        
    var counts = Array(repeating: 0, count: maxNum+1)
    for number in numbers {
        counts[number] += 1
    }
        
    for number in 1...maxNum {
        if counts[number] <= 0 {
            continue
        }
            
        for index in 0..<map.count {
            if map[index] >= 0 {
                map[index] = counts[number]
            } else if index >= number, map[index - number] > 0 {
                map[index] = map[index - number] - 1
            }
        }
    }
    return map
}
```
