import Foundation

var tree: [[Int]] = []

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    tree = Array(repeating: [Int](), count: n+1)
    
    for i in 0..<wires.count {
        tree[wires[i][0]].append(wires[i][1])
        tree[wires[i][1]].append(wires[i][0])
    }
    
    var result = Int.max
    
    for wire in wires {
        let a = bfs(start: wire[0], end: wire[1], n: n)
        let b = bfs(start: wire[1], end: wire[0], n: n)
        
        result = min(abs(a-b), result)
    }
    
    return result
}

func bfs(start: Int, end: Int, n: Int) -> Int {
    var visit = Array(repeating: false, count: n+1)
    
    var queue = [start]
    var pointer = 0
    visit[start] = true
    var count = 0
    
    while queue.count > pointer {
        let current = queue[pointer]
        pointer += 1
        
        for nextNode in tree[current] {
            if visit[nextNode] || nextNode == end { continue }
            
            visit[nextNode] = true
            queue.append(nextNode)
            count += 1
        }
    }
    
    return count
    
}