var heap = Heap<(v: Int, cost: Int)>() { $0.cost < $1.cost }
let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = ve[0], e = ve[1]
let k = Int(readLine()!)!

var d = Array(repeating: Int.max/2, count: v)
var arr = Array(repeating: [(v: Int, cost: Int)](), count: v)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[input[0]-1].append((input[1]-1, input[2]))
}

d[k-1] = 0
heap.insert((k-1, d[k-1]))

while !heap.isEmpty {
    let cur = heap.pop()!
    if d[cur.v] != cur.cost { continue } // 일치하지 않는다면 해당 원소를 제거하고 넘어가기
    for next in arr[cur.v] {
        if d[next.v] <= d[cur.v] + next.cost { continue }
        d[next.v] = d[cur.v] + next.cost
        heap.insert((next.v, d[next.v]))
    }
}

for i in 0..<v {
    if d[i] == Int.max/2 { print ("INF") }
    else { print(d[i]) }
}

struct Heap<T> {
    private(set) var heap: [T] = []
    private var condition: (T, T) -> Bool
    var lastLodeIndex: Int { return heap.count - 1 }
    var count: Int { return heap.count }
    var isEmpty: Bool { return heap.count == 0 }

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
        var index = lastLodeIndex
        while index != 0 {
            let parent = parentIndex(of: index)
            if condition(heap[parent], heap[index]) { break }
            heap.swapAt(index, parent)
            index = parent
        }
    }

    mutating func pop() -> T? {
        if heap.count < 1 { return nil }
        heap.swapAt(0, lastLodeIndex)
        let element = heap.removeLast()
        var index = 0

        while 2*index+1 <= lastLodeIndex {
            let leftChild = leftChildIndex(of: index)
            let rightChild = rightChildIndex(of: index)
            var comparisonTarget = leftChild

            if rightChild <= lastLodeIndex,
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