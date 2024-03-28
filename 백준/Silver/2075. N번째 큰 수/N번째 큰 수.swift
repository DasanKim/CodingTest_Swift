import Foundation

let io = FileIO()
let n = io.readInt()
var heap = Heap<Int> { $0 > $1 }

for _ in 0..<n {
    for _ in 0..<n {
        heap.insert(io.readInt())
    }
}

for _ in 0..<n-1 {
    _ = heap.pop()
}

print(heap.pop() ?? 0)

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

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {

        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
        || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
        now != 32,
        now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
        now != 32,
        now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}