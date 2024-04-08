let input = readLine()!.split(separator: " ").compactMap { Int($0 )}
let n = input[0]
let m = input[1]
let v = input[2]
var graph = Array(repeating: [Int](), count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0 )}
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

for i in 1...n {
    graph[i].sort(by: <)
}

var dfsResult = ""
var bfsResult = ""

dfs(node: v)
bfs(node: v)

print(dfsResult)
print(bfsResult)

func bfs(node: Int) {
    var visited = Array(repeating: false, count: n+1)
    var queue = [node]
    var pointer = 0
    visited[node] = true

    while queue.count > pointer {
        let cur = queue[pointer]
        pointer += 1

        bfsResult += "\(cur) " //print(cur)
        for nextNode in graph[cur] {
            if visited[nextNode] { continue }

            visited[nextNode] = true
            queue.append(nextNode)
        }
    }
}

func dfs(node: Int) {
    var visited = Array(repeating: false, count: n+1)
    var stack = [node]

    while !stack.isEmpty {
        let cur = stack.removeLast()

        if visited[cur] { continue }
        visited[cur] = true

        dfsResult += "\(cur) "// print(cur)
        for nextNode in graph[cur].reversed() {
            if visited[nextNode] { continue }

            stack.append(nextNode)
        }
    }
}