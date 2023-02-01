### Codility Lession 15(Caterpillar Method) - AbsDistinct
👉 [문제 링크](https://app.codility.com/programmers/lessons/15-caterpillar_method/abs_distinct/)

### 나의 접근 방법
고유한 절대값이 몇 개인지 구하는 문제이다.
Set을 생성하고 음수를 모두 양수로 변경하여 Set에 넣은 뒤 Set의 크기를 출력하였다.

### 코드
```swift
public func solution(_ A : inout [Int]) -> Int {
    return absDistinctSet(of: A).count
}
    
func absDistinctSet(of Array: [Int]) -> Set<Int> {
    var set = Set<Int>()
        
    for int in Array {
        if int < 0 {
            set.insert(int * -1)
        } else {
            set.insert(int)
        }
    }
        
    return set
}
```
