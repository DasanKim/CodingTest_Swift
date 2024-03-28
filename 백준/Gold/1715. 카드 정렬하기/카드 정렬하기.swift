let n = Int(readLine()!)!
var heap = Heap<Int>() { $0 < $1 }

for _ in 0..<n {
    let x = Int(readLine()!)!
    heap.insert(x)
}

var result = 0
var sum = 0

while heap.count != 1 {
    let first = heap.pop() ?? 0
    let second = heap.pop() ?? 0
    sum = first + second
    result += sum
    heap.insert(sum)
}

print(result)

struct Heap<T> {
    private(set) var heap: [T] = []
    private var condition: (T, T) -> Bool
    var lastLodeIndex: Int { return heap.count - 1 }
    var count: Int { return heap.count }

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