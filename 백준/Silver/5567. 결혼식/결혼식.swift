let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var visitor = Set<Int>()

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

dfs(node: 1, depth: 0)

print(visitor.count-1)

func dfs(node: Int, depth: Int) {
    visitor.insert(node)

    for nextNode in graph[node] where depth < 2 {
        dfs(node: nextNode, depth: depth + 1)
    }
}