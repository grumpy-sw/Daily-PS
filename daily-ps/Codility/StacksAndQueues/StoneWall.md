### Codility Lesson 7(Stacks and Queues) - StoneWall
👉 [문제 링크](https://app.codility.com/programmers/lessons/7-stacks_and_queues/stone_wall/)

### 나의 접근 방법
돌담을 짓는데 필요한 최소 블록을 구하는 문제.
스택에 있는 블록이 현재 블록보다 높이가 높다면 스택에서 제거하고 다음 블록을 기준으로 잡는다.
스택이 비어있거나 현재 블록이 마지막 블록보다 높이가 높다면 스택에 현재 블록을 넣는다.
* 이해에 도움을 받은 설명: [https://yceffort.kr/2020/06/codility-07-04-stone-wall](https://yceffort.kr/2020/06/codility-07-04-stone-wall)

### 코드

```swift
public func solution(_ H : inout [Int]) -> Int {
    var count = 0
    var stack = [Int]()
        
    for block in H {
        while !stack.isEmpty && stack.last! > block {
            stack.removeLast()
        }
            
        if stack.isEmpty || stack.last! < block {
            stack.append(block)
            count += 1
        }
    }
    return count
}
```
