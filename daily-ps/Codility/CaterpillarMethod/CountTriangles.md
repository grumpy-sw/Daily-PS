### Codility Lession 15(Caterpillar Method) - CountTriangles
👉 [문제 링크](https://app.codility.com/programmers/lessons/15-caterpillar_method/count_triangles/)

### 나의 접근 방법
배열을 오름차순으로 정렬하고, 앞에서부터 3개씩`(start, mid, end)` 체크하여 삼각형이 이루어지는 경우 end 증가, 삼각형이 안되는 경우 start를 증가시키며 개수를 확인했다.

![](https://i.imgur.com/7pQgMd6.png)

문제에서 설명하는 대로 3중 반복문을 사용하여 구현하였는데, 결과를 보니 O(N^3) 미만의 해법이 필요해보였다.

시간을 단축한 방법
- count를 하나씩 증가시키는 것 대신 범위를 수학적으로 계산
- end의 값이 항상 oldValue 이상이기 때문에 end를 증가시켰을 때 mid를 다시 초기화할 필요가 없으므로 3중 반복문을 2중으로 수정. 

> 결과: O(N^2)로 줄여 통과
![](https://i.imgur.com/FkAchon.png)

### 코드
```swift
public func solution(_ A : inout [Int]) -> Int {
    let N = A.count
        
    if N < 3 {
        return 0
    }
    var mid = 0
    var end = 0
    var triangles = 0
        
    let sortedNumbers = A.sorted()
        
    for start in 0..<N-2 {
        end = start + 2
        mid = start + 1
            
        while end < N {
            if sortedNumbers[start] + sortedNumbers[mid] - sortedNumbers[end] > 0 {
                triangles += (end - mid)
                end += 1
            } else {
                mid += 1
            }
        }
    }
    return triangles
}
```
