let n = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: n+1)
var parent = Array(repeating: 0, count: n+1)
var result = ""

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

dfs(cur: 1)

for i in 2...n {
    result.write(String(parent[i])+"\n")
}

print(result)

func dfs(cur: Int) {
    for next in tree[cur] where parent[cur] != next {
        parent[next] = cur
        dfs(cur: next)
    }
}