let n = Int(readLine()!)!
let names = readLine()!.split(separator: " ").sorted().map { String($0) }
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var dic = [String: Int]()
var inDegree = Array(repeating: 0, count: n+1)
var tree = Array(repeating: [Int](), count: n+1)

for i in 1...names.count {
    dic[names[i-1]] = i
}

var roots = [String]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    let c = dic[input[0]]!
    let p = dic[input[1]]!

    graph[p].append(c)
    inDegree[c] += 1
}

위상정렬()

print(roots.count)
print(roots.joined(separator: " "))

var result = [String]()
for name in names {
    let index = dic[name]!
    let child = tree[index]
    var temp = "\(name) \(child.count) "

    for c in tree[index].sorted() {
        temp += "\(dic.first(where: {$0.value == c})?.key ?? "") "
    }
    result.append(temp)
}

print(result.joined(separator: "\n") )

func 위상정렬() {
    var queue = [Int]()
    var pointer = 0

    for i in 1...n {
        if inDegree[i] == 0 {
            queue.append(i)
            let name = dic.first(where: {$0.value == i})?.key ?? ""
            roots.append(name)
        }
    }

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for next in graph[cur] {     
            inDegree[next] -= 1

            if inDegree[next] == 0 {
                queue.append(next)
                tree[cur].append(next)
            }
        }
    }
}