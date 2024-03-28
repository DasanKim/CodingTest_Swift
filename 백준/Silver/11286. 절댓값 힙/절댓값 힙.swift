let n = Int(readLine()!)!
var heap = Heap()
var result = ""

for _ in 0..<n {
    let x = Int(readLine()!)!

    switch x {
        case 0:
        result += "\(heap.remove())\n"
        default:
        heap.insert(data: x)
    }
}

print(result)

struct Heap {
    var heap: [Int] = [0]
    private var heapSize: Int {
        heap.count-1
    }

    mutating func insert(data: Int) {
        heap.append(data)
        var index = heapSize
        while index != 1 {
            let parent = index/2
            if abs(heap[parent]) < abs(heap[index]) { break }
            else {
                if abs(heap[parent]) > abs(heap[index]) {
                    heap.swapAt(index, parent)
                    index = parent
                } else if abs(heap[parent]) == abs(heap[index]), heap[parent] > heap[index] {
                    heap.swapAt(index, parent)
                    index = parent
                } else {
                    break
                }
            }
        }
    }

    mutating func remove() -> Int {
        if heap.count < 2 { return 0 }

        let min = heap[1]
        heap[1] = heap[heapSize]
        heap.removeLast()
        var index = 1

        while 2*index <= heapSize {
            let leftChild = index * 2
            let rightChild = (index * 2) + 1
            var minChild = leftChild

            if rightChild <= heapSize {
                if abs(heap[rightChild]) < abs(heap[leftChild]) {
                    minChild = rightChild
                } else {
                    if abs(heap[rightChild]) == abs(heap[leftChild]), heap[rightChild] < heap[leftChild] {
                        minChild = rightChild
                    }
                }
            }

            if abs(heap[index]) < abs(heap[minChild]) { break }
            else {
                if abs(heap[index]) > abs(heap[minChild]) {
                    heap.swapAt(index, minChild)
                    index = minChild
                } else if abs(heap[index]) == abs(heap[minChild]), heap[index] > heap[minChild] {
                    heap.swapAt(index, minChild)
                    index = minChild
                } else {
                    break
                }
            }
        }
        return min
    }
}