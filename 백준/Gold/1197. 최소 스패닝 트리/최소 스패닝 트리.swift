var heap = Heap<(v1: Int, v2: Int, cost: Int)> { $0.cost < $1.cost }
let ve = readLine()!.split(separator: " ").compactMap{ Int($0) }
let v = ve[0]
let e = ve[1]
var graph = Array(repeating: [(v2: Int, cost: Int)](), count: v+1)
var included = Array(repeating: false, count: v+1) // 최소신장트리에 속해있는가
var count = 0 // 현재 선택된 간선의 수
var result = 0

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph[input[0]].append((input[1], input[2]))
    graph[input[1]].append((input[0], input[2]))
}

included[1] = true
for next in graph[1] {
    heap.insert((v1: 1, v2: next.v2, cost: next.cost))
}

while count < v - 1 {
    let cur = heap.pop()!

    if included[cur.v2] { continue }
    result += cur.cost

    included[cur.v2] = true
    count += 1

    for next in graph[cur.v2] {
        if !included[next.v2] {
            heap.insert((v1: cur.v2, v2: next.v2, cost: next.cost))
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