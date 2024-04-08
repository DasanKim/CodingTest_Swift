let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

print(bfs(node: 1)-1)

func bfs(node: Int) -> Int {
    var queue = [node]
    var count = 0
    var pointer = 0
    visited[node] = true

    while queue.count > pointer {
        let node = queue[pointer]
        pointer += 1

        count += 1

        for nextNode in graph[node] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append(nextNode)
        }
    }

    return count
}