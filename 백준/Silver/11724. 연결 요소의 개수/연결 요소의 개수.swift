let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = input[0]
let e = input[1]
var graph = Array(repeating: [Int](), count: v+1)
var visited = Array(repeating: false, count: v+1)

for _ in 0..<e {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

var result = 0

for i in 1...v {
    if !visited[i] {
        result += 1
        bfs(node: i)
    }
}

print(result)

func bfs(node: Int) {
    var queue = [node]
    var pointer = 0
    visited[node] = true

    while queue.count > pointer {
        let node = queue[pointer]
        pointer += 1

        for nextNode in graph[node] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append(nextNode)
        }
    }
}