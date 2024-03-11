let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var arr = [Int]()
var result = [String]()
var ans = 0

for _ in 0..<input[0] {
    let planet = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr = Set(planet).sorted()
    var temp = ""

    for target in planet {
        temp += "\(findLeft(target))"
    }

    result.append(temp)
}

for i in 0..<result.count {
    for j in i+1..<result.count {
        if result[i] == result[j] {
            ans += 1
        }
    }
}

print(ans)

func findLeft(_ target: Int) -> Int {
    var st = 0
    var en = arr.count

    while st < en {
        let mid = (st+en) / 2
        if arr[mid] >= target {
            en = mid
        } else if arr[mid] < target {
            st = mid + 1
        }
    }
    return st
}