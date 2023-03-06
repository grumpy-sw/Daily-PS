### Codility Lession 5(Prefix Sums) - MinAvgTwoSlice
👉 [문제 링크](https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/)

### 나의 접근 방법
- A의 원소 개수 N의 제한이 100,000개 까지이므로 O(N^2) 미만의 방법으로 해결해야 함
- 누적 합을 이용한 평균 배열로 최소값 비교 -> 타임아웃으로 실패
- [다른 분의 풀이](https://lipcoder.tistory.com/195)를 보고 접근 방법을 알게 됨
    - 평균의 수학적 성질을 이용하여 풀어야 한다.
    - 쉽게 말하면 두 수의 평균은 두 수 중 작은 값보다 더 작아질 수 없다는 성질을 이용하여, 최소 단위의 조각로 나눈 뒤 그들의 평균을 계산하고 나면, 그들을 포함한 조각의 평균은 최소 조각보다 작아질 수 없으므로 계산할 필요가 없다. 
- 이 때 주의해야 할 것은 조각의 길이가 2와 3으로 각각 다르기 때문에 어느 지점에서 시작했는지 확실하게 값을 반환해야 한다.
- 수학적으로 개념을 알고 있다면 쉬운 문제라고 한다..
  
### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.count == 2 {
        return 0
    }
        
    let sums = prefixSum(of: A)
        
    var minAvg = Double(sums[2] - sums[0])/Double(2)
    var startpoint = 0
        
    for index in 1..<sums.count - 2 {
        // 3 numbers
        let threeAvg = Double(sums[index+2] - sums[index-1]) / Double(3)
        if threeAvg < minAvg {
            minAvg = threeAvg
            startpoint = index-1
        }
            
        // 2 numbers
        let twoAvg = Double(sums[index+2] - sums[index]) / Double(2)
        if twoAvg < minAvg {
            minAvg = twoAvg
            startpoint = index
        }
    }
        
    return startpoint
}
    
func prefixSum(of numbers: [Int]) -> [Int] {
    var array = Array(repeating: 0, count: numbers.count+1)
    array[1] = numbers[0]
    for index in 2...numbers.count {
        array[index] = array[index-1] + numbers[index-1]
    }
    return array
}
```

