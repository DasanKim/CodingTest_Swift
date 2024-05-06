let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var inDegree = Array(repeating: 0, count: n+1)
var result = [Int]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }

    for i in 1...input[0]-1 {
        graph[input[i]].append(input[i+1])
        inDegree[input[i+1]] += 1
    }
}

위상정렬()

if result.count != n {
    print(0)
} else {
    print(result.map{ String($0) }.joined(separator: "\n"))
}

func 위상정렬() {
    var queue = [Int]()
    var pointer = 0

    for i in 1...n {
        if inDegree[i] == 0 { queue.append(i) }
    }

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1
        result.append(cur)

        for next in graph[cur] {
            inDegree[next] -= 1
            if inDegree[next] == 0 { queue.append(next) }
        }
    }
}