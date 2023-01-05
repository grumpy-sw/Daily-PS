### Codility Lesson 4(Counting Elements) - FrogRiverOne
👉 [문제 링크](https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/)

### 나의 접근 방법
떨어지는 나뭇잎을 [위치 : 떨어진 시간]인 딕셔너리로 선언한다.
배열 A를 순회하면서 딕셔너리에 값을 저장한다. 이 때 딕셔너리에 저장된 값의 수가 X와 같아진다면 현재 Index를 반환한다. 
배열 A의 순회가 끝나고 딕셔너리의 수가 X가 되지 않는다면 연결되지 않는 경우로 -1을 반환한다.


### 코드

```swift
public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var leaves = [Int: Int]()

    for index in 0..<A.count {
        leaves[A[index]] = index
        if leaves.count == X {
            return index
        }
    }
    return -1
}
```
