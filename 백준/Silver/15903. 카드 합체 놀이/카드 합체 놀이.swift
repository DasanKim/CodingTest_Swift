let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var heap: [Int] = [0]
var heapLastNode: Int {
    heap.count-1
}

heap.append(contentsOf: arr)

for _ in 0..<input[1] {
    let a = remove()
    let b = remove()

    insert(data: a+b)
    insert(data: a+b)
}

print(heap.reduce(0, +))

func insert(data: Int) {
    heap.append(data)

    if heap.count > 1 {
        swapUp()
    }
}

func swapUp() {
    var index = heapLastNode

    while index != 1 {
        let parent = index/2

        if heap[index] < heap[parent] {
            heap.swapAt(index, parent)
        }

        index = parent
    }
}

func remove() -> Int {
    // 노드가 1개 밖에 없을 경우
    if heapLastNode == 1 {
        return heap.removeLast()
    }

    // 노드가 2개 이상 있을 경우
    heap.swapAt(1, heapLastNode)
    let root = heap.removeLast()
    swapDown()

    return root
}

func swapDown() {
    var parent = 1

    while true {
        let leftChild = parent * 2
        let rightChild = (parent * 2) + 1

        // 자식 노드 없음
        if heapLastNode < leftChild { return }

        // 왼쪽 자식만 있을 경우
        if heapLastNode < rightChild && heap[parent] > heap[leftChild] {
            heap.swapAt(parent, leftChild)
            return
        } else if heapLastNode < rightChild {
            return
        }

        // 부모가 자식들보다 값이 작은 경우
        if heap[parent] <= heap[leftChild] && heap[parent] <= heap[rightChild] { return }
        // 둘다 부모보다 작은 경우
        if heap[parent] > heap[leftChild] && heap[parent] > heap[rightChild] {
            let index = heap[leftChild] < heap[rightChild] ? leftChild : rightChild
            heap.swapAt(parent, index)
            parent = index
            continue
        }
        // 한쪽만 부모보다 작은 경우
        if heap[parent] > heap[leftChild] || heap[parent] > heap[rightChild] {
            let index = heap[leftChild] < heap[parent] ? leftChild : rightChild
            heap.swapAt(parent, index)
            parent = index
            continue
        }
    }
}