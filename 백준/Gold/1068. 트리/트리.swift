let n = Int(readLine()!)!
let parent = readLine()!.split(separator: " ").compactMap { Int($0) }
var tree = Array(repeating: [Int](), count: n)
var visit = Array(repeating: false, count: n)
var root = 0

for (i, v) in parent.enumerated() {
    if v != -1 {
        tree[v].append(i)
    } else {
        root = i
    }
}

let r = Int(readLine()!)!
var count = 0

visit[r] = true
for i in 0..<tree.count {
    if let index = tree[i].firstIndex(where: { $0 == r }) {
        tree[i].remove(at: index)
    }
}

dfs(cur: root)

print(count)

func dfs(cur: Int) {
    if visit[cur] { return }

    visit[cur] = true
    if tree[cur].isEmpty { count += 1 }

    for next in tree[cur] where !visit[next] {
        dfs(cur: next)
    }
}