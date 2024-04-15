let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[edge[1]].append(edge[0])
}

var maxValue = 0
var computers = [Int]()

for i in 1...n {
    let temp = dfs(node: i)

    if temp > maxValue {
        maxValue = temp
        computers = [i]
    } else if temp == maxValue {
        computers.append(i)
    }
}

let result = computers.map { String($0) }.joined(separator: " ")
print(result)

func dfs(node: Int) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var stack = [node]
    var dist = 0

    while !stack.isEmpty {
        let cur = stack.removeLast()
        visited[cur] = true

        for nextNode in graph[cur] where !visited[nextNode] {
            stack.append(nextNode)
            visited[nextNode] = true

            dist += 1
        }
    }
    return dist
}