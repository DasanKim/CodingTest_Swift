let caseCount = Int(readLine()!)!
var arr: [Int] = []
var vist: [Bool] = []
var count = 0

for _ in 0..<caseCount {
    let sn = Int(readLine()!)!
    arr = readLine()!.split(separator: " ").compactMap { Int($0)! - 1 }
    vist = Array(repeating: false, count: sn)
    count = 0

    for i in 0..<sn {
        if vist[i] { continue }
        dfs(i)
    }
    print(count)
}

func dfs(_ n: Int) {
    var tempVist: [Int] = []
    var stack = n

    while stack != -1 {
        let cur = stack
        let next = arr[cur]
        stack = -1
        vist[cur] = true
        tempVist.append(cur)

        if !vist[next] {
            stack = next
        } else {
            for i in tempVist {
                if i == next { break }
                count += 1
            }
        }
    }
}