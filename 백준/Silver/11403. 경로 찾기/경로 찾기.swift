let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n)
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: 0, count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[i].append(contentsOf: input)

    for j in 0..<n {
        if arr[i][j] == 1 { graph[i].append(j) }
    }
}

var result = ""

for i in 0..<n {
    visited = Array(repeating: 0, count: n)
    dfs(node: i, depth: 0)
    result += (visited.map { String($0) }.joined(separator: " ")) + "\n"
}

print(result)

func dfs(node: Int, depth: Int) {
    if depth > 0 {
        visited[node] = 1
    }

    for element in graph[node] where visited[element] != 1 {
        dfs(node: element, depth: depth + 1)
    }
}