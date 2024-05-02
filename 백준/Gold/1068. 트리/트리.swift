let n = Int(readLine()!)!
let parent = readLine()!.split(separator: " ").compactMap { Int($0) }
let r = Int(readLine()!)!

var tree = Array(repeating: [Int](), count: n)
var root = 0

for (i, v) in parent.enumerated() {
    if v == -1 {
        root = i
    } else if i != r {
        tree[v].append(i)
    }
}

var count = 0
dfs(cur: root)
print(r == root ? 0 : count)

func dfs(cur: Int) {
    if tree[cur].isEmpty {
        count += 1
        return
    }

    for next in tree[cur]{
        dfs(cur: next)
    }
}