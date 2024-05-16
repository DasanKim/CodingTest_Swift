let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0], m = nm[1]
var graph = [(v1: Int, v2: Int, cost: Int)]()
var mst = [(v1: Int, v2: Int, cost: Int)]()
var parent = Array(0..<n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph.append((input[0]-1, input[1]-1, input[2]))
}

graph.sort { $0.cost > $1.cost }

var result = 0

while mst.count < n-2 {
    let cur = graph.removeLast()

    if find(cur.v1) != find(cur.v2) {
        union(v1: cur.v1, v2: cur.v2)
        mst.append(cur)
        result += cur.cost
    }
}

print(result)

func find(_ node: Int) -> Int {
    if parent[node] == node {
        return node
    } else {
        parent[node] = find(parent[node])
        return parent[node]
    }
}

func union(v1: Int, v2: Int) {
    let root1 = find(v1)
    let root2 = find(v2)

    if root1 < root2 {
        parent[root2] = root1
    } else {
        parent[root1] = root2
    }
}