### Codility Lession 6(Sorting) - NumberOfDiscIntersections
👉 [문제 링크](https://app.codility.com/programmers/lessons/6-sorting/number_of_disc_intersections/)

### 나의 접근 방법
- 처음에는 원점과 양 끝점의 좌표를 프로퍼티로 갖는 Disk 구조체를 만들어 겹치는 Disk의 쌍을 구하는 방법으로 구현하였는데 효율성에서 timeout이 발생하여 81%로 통과하지 못했다.
- Disk 구조체로 엮지 않고 양 끝점을 각각 lower, upper로 각각 저장하고 각각 오름차순으로 정렬한다.
- sortedUpper보다 작은 sortedLower의 개수를 구한 후 intersection에 더한다. 이 때 i와 1을 빼주는 이유는 자기자신과 upper가 현재 upper보다 작은 점을 제외해야하기 때문이다.
- 결론은 sortedUpper 기준으로 만들어지는 Disk의 교점의 개수를 구하는 방법이다.

### 코드
```swift
public func solution(_ A: inout [Int]) -> Int {
    let N = A.count
    var lowers = [Int]()
    var uppers = [Int]()
    var intersection = 0
        
    for index in 0..<N {
        lowers.append(index - A[index])
        uppers.append(index + A[index])
    }
        
    let sortedLowers = lowers.sorted()
    let sortedUppers = uppers.sorted()
    var j = 0
        
    for i in 0..<N {
        while j < N, sortedUppers[i] >= sortedLowers[j] {
            j += 1
        }
        intersection += (j - 1)
        intersection -= i
    }
        
    return intersection > 10000000 ? -1 : intersection
}
```
