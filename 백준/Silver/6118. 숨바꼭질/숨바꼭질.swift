let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var queue: [(index: Int, dist: Int)] = [(1, 0)]

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

let maxValue = bfs(node: 1)
let arr = queue.filter { $0.dist == maxValue }.sorted(by: { $0.index < $1.index })

print("\(arr[0].index) \(maxValue) \(arr.count)")

func bfs(node: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    //var queue = [(node, 0)]
    var pointer = 0
    var maxDist = 0

    visited[node] = true

    while queue.count > pointer {
        let cur = queue[pointer]
        pointer += 1

        for nextNode in graph[cur.index] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append((nextNode, cur.dist+1))
            maxDist = max(maxDist, cur.dist+1)
        }
    }
    return maxDist
}