final class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

final class LinkedList {
    private var head: Node?
    private var cursor: Node?
    var result = [Int]()
    
    func append(data: Int) {
        if head == nil {
            head = Node(data: data)
            head?.next = head
            cursor = head
            return
        }
        
        var node = head
        
        while node?.next?.data != head?.data {
            node = node?.next
        }
        
        let newNode = Node(data: data)
        node?.next = newNode
        newNode.next = head
    }
    
    func remove(_ n: Int) {
        var node = cursor
        
        if n > 1 {
            for _ in 1..<n-1 {
                node = node?.next
            }
            result.append(node?.next?.data ?? 0)
            node?.next = node?.next?.next
            cursor = node?.next
        } else {
            result.append(node?.data ?? 0)
            cursor = node?.next
        }
    }
}

let list = LinkedList()
let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = inputs[0]
let k = inputs[1]

(1...n).forEach { list.append(data: $0) }

while list.result.count < n {
    list.remove(k)
}

print("<\(list.result.map({ String($0) }).joined(separator: ", "))>")
