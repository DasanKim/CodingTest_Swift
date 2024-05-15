let n = Int(readLine()!)!
var graph = [(v1: Int, v2: Int, cost: Int)]()
var minSpanningTree = [(v1: Int, v2: Int, cost: Int)]()
var parent = [-1]
var result = 0

for i in 1...n+1 {
    parent.append(i)
}

for i in 1...n {
    let w = Int(readLine()!)!
    graph.append((i, n+1, w))
}

for i in 1...n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<n {
        guard i < j+1 else { continue }
        graph.append((i, j+1, input[j]))
    }
}

graph.sort { $0.cost > $1.cost }

while minSpanningTree.count < n {
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
    } else {
        parent[node] = find(parent[node])
        return parent[node]
    }
}

func union(_ v1: Int, _ v2: Int) {
    let root1 = find(v1)
    let root2 = find(v2)

    if root1 < root2 {
        parent[root2] = root1
    } else {
        parent[root1] = root2
    }
}