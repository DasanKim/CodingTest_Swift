var heap = Heap<(v: Int, cost: Int)> { $0.1 < $1.1 }
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var d = Array(repeating: Int.max, count: n)
var arr = Array(repeating: [(v: Int, cost: Int)](), count: n)
var pre = Array(repeating: -1, count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[input[0]-1].append((input[1]-1, input[2]))
}

let sd = readLine()!.split(separator: " ").compactMap { Int($0) }
let start = sd[0]-1, end = sd[1]-1

d[start] = 0
heap.insert((start, d[start]))

while !heap.isEmpty {
    let cur = heap.pop()!
    if d[cur.v] != cur.cost { continue }

    for next in arr[cur.v] {
        if d[next.v] <= d[cur.v] + next.cost { continue }
        d[next.v] = d[cur.v] + next.cost
        heap.insert((next.v, d[next.v]))
        pre[next.v] = cur.v
    }
}

var path = [Int]()
var cur = end
while cur != start {
    path.append(cur)
    cur = pre[cur]
}
path.append(cur)

print(d[end])
print(path.count)
print(path.reversed().map { String($0+1) }.joined(separator: " "))

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