let ve = readLine()!.split(separator: " ").compactMap{ Int($0) }
let v = ve[0]
let e = ve[1]
var graph = [(v1: Int, v2: Int, cost: Int)]()
var minSpanningTree = [(v1: Int, v2: Int, cost: Int)]()
var parent = [-1]
var result = 0

for i in 1...v {
    parent.append(i)
}

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph.append((input[0], input[1], input[2]))
}

graph.sort { $0.cost > $1.cost }

while minSpanningTree.count < v - 1 {
    let cur = graph.removeLast()

    if find(cur.v1) != find(cur.v2) {
        result += cur.cost
        union(cur.v1, cur.v2)
        minSpanningTree.append(cur)
    }
}

print(result)

func find(_ node: Int) -> Int {
    if parent[node] == node {
        return node
    }
    else {
        parent[node] = find(parent[node])
        return parent[node]
    }
}

func union(_ v1: Int, _ v2: Int) {
    let root1 = find(v1)
    let root2 = find(v2)

    if v1 < v2 {
        parent[root2] = root1
    } else {
        parent[root1] = root2
    }
}