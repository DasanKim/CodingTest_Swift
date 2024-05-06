let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var inDegree = Array(repeating: 0, count: n+1)
var result = [Int]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph[input[0]].append(input[1])
    inDegree[input[1]] += 1
}

위상정렬()
print(result.map{ String($0) }.joined(separator: " "))

func 위상정렬() {
    var queue = [Int]()

    for i in 1...n {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        result.append(cur)

        for next in graph[cur] {
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                queue.append(next)
            }
        }
    }
}