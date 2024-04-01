let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0] // 보석 갯수
let k = nk[1] // 상덕이 가방 갯수
var maxHeap = Heap<Int>(>)
var bags = [Int]()
var jewels = [(cost: Int, value: Int)]()

for _ in 0..<n {
    let mv = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = mv[0] // 보석 무게
    let v = mv[1] // 보석 가격
    jewels.append((m,v))
}

for _ in 0..<k {
    let c = Int(readLine()!)! // 가방에 담을 수 있는 최대 무게
    bags.append(c)
}

jewels.sort { $0.cost < $1.cost }
bags.sort(by: < )

var result = 0
var index = 0

for bag in bags {
    while index <= jewels.count-1, bag >= jewels[index].cost {
        maxHeap.insert(jewels[index].value)
        index += 1
    }
    result += maxHeap.pop() ?? 0
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