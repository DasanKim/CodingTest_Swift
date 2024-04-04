let n = Int(readLine()!)!
var isSolved = [Int: Bool]()
var result = ""

var minHeap = Heap<(Int, Int)>() {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

var maxHeap = Heap<(Int, Int)>() {
    if $0.1 == $1.1 {
        return $0.0 > $1.0
    } else {
        return $0.1 > $1.1
    }
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let qNumber = input[0]
    let difficulty = input[1]

    minHeap.insert((qNumber, difficulty))
    maxHeap.insert((qNumber, difficulty))
    isSolved[qNumber] = false
}

let m = Int(readLine()!)!

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let command = input.first!

    switch command {
        case "add":
        let qNumber = Int(input[1])!
        let difficulty = Int(input[2])!

        minHeap.insert((qNumber, difficulty))
        maxHeap.insert((qNumber, difficulty))
        isSolved[qNumber] = false
        case "recommend":
        if input[1] == "1" {
            if let q = maxHeap.first {
                result += "\(q.0)\n"
            }
        } else {
            if let q = minHeap.first {
                result += "\(q.0)\n"
            }
        }
        case "solved":
        let qNumber = Int(input[1])!
        isSolved[qNumber] = true
        while true {
            if let q = minHeap.first,
            isSolved[q.0] == false {
                break
            } else {
                _ = minHeap.pop()
            }
        }
        while true {
            if let q = maxHeap.first,
            isSolved[q.0] == false {
                break
            } else {
                _ = maxHeap.pop()
            }
        }
        default:
        print("error")
    }
}

print(result)

struct Heap<T> {
    private(set) var heap: [T] = []
    private var condition: (T, T) -> Bool
    var lastLodeIndex: Int { return heap.count - 1 }
    var count: Int { return heap.count }
    var first: T? { return heap.first ?? nil }

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