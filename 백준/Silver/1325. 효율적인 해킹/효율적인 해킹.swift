let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: 0, count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[1]].append(edge[0])
}

var maxValue = 0
var computers = [Int]()

for i in 1...n {
    let temp = bfs(node: i)

    if temp > maxValue {
        maxValue = temp
        computers = [i]
    } else if temp == maxValue {
        computers.append(i)
    }
}

let result = computers.map { String($0) }.joined(separator: " ")
print(result)

func bfs(node: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var queue = [node]
    var pointer = 0

    visited[node] = true

    while queue.count > pointer {
        let cur = queue[pointer]
        pointer += 1

        for nextNode in graph[cur] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append(nextNode)
        }
    }
    return queue.count
}