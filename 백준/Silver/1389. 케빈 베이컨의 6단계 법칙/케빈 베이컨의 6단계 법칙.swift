let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var friends = Array(repeating: 0, count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

var minValue: (index: Int, value: Int) = (0, Int.max)

for i in 1...n {
    friends[i] = bfs(node: i, dist: 0)
    minValue = friends[i] < minValue.value ? (i, friends[i]) : minValue
}

print(minValue.index)

func bfs(node: Int, dist: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var queue = [(node, dist)]
    var pointer = 0
    var baconNum = 0

    visited[node] = true

    while queue.count > pointer {
        let cur = queue[pointer]
        pointer += 1

        for nextNode in graph[cur.0] {
            if visited[nextNode] { continue }

            visited[nextNode] = true

            queue.append((nextNode, cur.1+1))
            baconNum += cur.1+1
        }
    }
    return baconNum
}