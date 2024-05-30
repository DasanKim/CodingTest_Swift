let nmx = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nmx[0], m = nmx[1], x = nmx[2]
var arr = Array(repeating: [(v: Int, cost: Int)](), count: n)
var minArr = [[Int]]()

for i in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[input[0]-1].append((input[1]-1, input[2]))
}

for i in 0..<n {
    var d = Array(repeating: Int.max, count: n)
    var minHeap = Heap<(v: Int, cost: Int)>() { $0.cost < $1.cost }

    d[i] = 0
    minHeap.insert((i, d[i]))

    while !minHeap.isEmpty {
        let cur = minHeap.pop()!
        if d[cur.v] != cur.cost { continue }

        for next in arr[cur.v] {
            if d[next.v] <= d[cur.v] + next.cost { continue }
            d[next.v] = d[cur.v] + next.cost
            minHeap.insert((next.v, d[next.v]))
        }
    }
    minArr.append(d)
}

var result = 0

for i in 0..<n {
    var sum = 0
    sum += minArr[i][x-1]
    sum += minArr[x-1][i]
    result = max(result, sum)
}

print(result)

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