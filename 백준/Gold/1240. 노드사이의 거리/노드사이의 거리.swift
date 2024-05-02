let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]

var tree = Array(repeating: [(node: Int, dist: Int)](), count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    tree[input[0]].append((input[1], input[2]))
    tree[input[1]].append((input[0], input[2]))
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    print(bfs(start: input[0], end: input[1]))
}

func bfs(start: Int, end: Int) -> Int {
    var visit = Array(repeating: false, count: n+1)
    var queue: [(node: Int, dist: Int)] = [(start, 0)]
    var pointer = 0
    visit[start] = true

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        if cur.node == end { return cur.dist }

        for next in tree[cur.node] where !visit[next.node] {
            visit[next.node] = true
            queue.append((next.node, cur.dist + next.dist))
        }
    }

    return 0
}