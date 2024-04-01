let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let k = Int(readLine()!)!
    var minHeap = Heap<Int>(<)
    var maxHeap = Heap<Int>(>)
    var dic = [Int:Int]()

    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let command = input.first!
        let number = Int(input.last!)!

        switch command {
            case "D":
            if minHeap.heap.isEmpty || maxHeap.heap.isEmpty { break }
            if number == -1 {
                while true {
                    guard let min = minHeap.pop() else { break }
                    if dic[min, default: 0] > 0 {
                        dic[min] = dic[min, default: 0] - 1
                        break
                    }
                }
            } else {
                while true {
                    guard let max = maxHeap.pop() else { break }
                    if dic[max, default: 0] > 0 {
                        dic[max] = dic[max, default: 0] - 1
                        break
                    }
                }
            }
            default:
            dic[number] = dic[number, default: 0] + 1
            minHeap.insert(number)
            maxHeap.insert(number)
        }
    }

    var minResult: Int? = nil
    var maxResult: Int? = nil

    if let minTemp = minHeap.pop() {
        if dic[minTemp, default: 0] == 0 {
            while true {
                guard let min = minHeap.pop() else { break }
                if dic[min, default: 0] > 0 {
                    minResult = min
                    break
                }
            }
        } else {
            minResult = minTemp
        }
    }

    if let maxTemp = maxHeap.pop() {
        if dic[maxTemp, default: 0] == 0 {
            while true {
                guard let max = maxHeap.pop() else { break }
                if dic[max, default: 0] > 0 {
                    maxResult = max
                    break
                }
            }
        } else {
            maxResult = maxTemp
        }
    }

    if maxResult == nil || minResult == nil {
        result += "EMPTY\n"
    } else {
        result += "\(maxResult ?? 0) \(minResult ?? 0)\n"
    }
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