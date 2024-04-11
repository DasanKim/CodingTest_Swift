let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var friends = Array(repeating: 0, count: n+1)

while true {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    if edge[0] == -1, edge[1] == -1 { break }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

var minValue = 50

for i in 1...n {
    friends[i] = bfs(node: i, dist: 0)
    minValue = min(minValue, friends[i])
}

let candidates = friends.enumerated().filter { $0.element == minValue }.map { String($0.offset) }

var result = ""
result += "\(minValue) \(candidates.count)\n"
result += candidates.joined(separator: " ")

print(result)

func bfs(node: Int, dist: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var queue = [(node, dist)]
    var pointer = 0
    var maxDist = 0

    visited[node] = true

    while queue.count > pointer {
        let cur = queue[pointer]
        pointer += 1

        for nextNode in graph[cur.0] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append((nextNode, cur.1+1))
            maxDist = max(maxDist, cur.1+1)
        }
    }
    return maxDist
}