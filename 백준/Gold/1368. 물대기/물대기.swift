var heap = Heap<(v1: Int, v2: Int, cost: Int)> { $0.cost < $1.cost }
let n = Int(readLine()!)!
var graph = Array(repeating: [(v1: Int, v2: Int, cost: Int)](), count: n+1)
var minSpanningTree = Set<Int>()
var result = 0

for i in 0..<n {
    let w = Int(readLine()!)!
    graph[i].append((i, n, w))
    graph[n].append((n, i, w))
}

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<n {
        graph[i].append((i, j, input[j]))
    }
}

minSpanningTree.insert(0)

for next in graph[0] {
    heap.insert(next)
}

while minSpanningTree.count < n + 1 {
    let cur = heap.pop()!

    if !minSpanningTree.contains(cur.v2) && cur.cost != 0 {
        minSpanningTree.insert(cur.v2)
        result += cur.cost

        for next in graph[cur.v2] {
            if !minSpanningTree.contains(next.v2) {
                heap.insert(next)
            }
        }
    }
}

print(result)

struct Heap<T> {
    private(set) var heap: [T] = []
    private var condition: (T, T) -> Bool
    var lastNodeIndex: Int { heap.count - 1 }
    var count: Int { heap.count }

    init(_ condition: @escaping (T, T) -> Bool) {
        self.condition = condition
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }

    mutating func insert(_ newElement: T) {
        heap.append(newElement)
        var index = lastNodeIndex
        while index != 0 {
            let parent = parentIndex(of: index)
            if condition(heap[parent], heap[index]) { break }
            heap.swapAt(index, parent)
            index = parent
        }
    }

    mutating func pop() -> T? {
        if heap.count < 1 { return nil }
        heap.swapAt(0, lastNodeIndex)
        let element = heap.removeLast()
        var index = 0

        while 2*index+1 <= lastNodeIndex {
            let leftChild = leftChildIndex(of: index)
            let rightChild = rightChildIndex(of: index)
            var comparisonTarget = leftChild

            if rightChild <= lastNodeIndex,
            condition(heap[rightChild], heap[leftChild]) {
                comparisonTarget = rightChild
            }

            if condition(heap[index], heap[comparisonTarget]) { break }
            heap.swapAt(index, comparisonTarget)
            index = comparisonTarget
        }

        return element
    }
}