_ = readLine()!.split(separator: " ").compactMap { Int($0) }
let setA = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let setB = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var result = ""
var count = 0

for a in setA {
    if !binarySearch(a) {
        count += 1
        result += "\(a) "
    }
}

print(count)
print(result)

func binarySearch(_ target: Int) -> Bool {
    var start = 0
    var end = setB.count - 1

    while start <= end {
        let mid = (start+end)/2

        if setB[mid] > target {
            end = mid - 1
        } else if setB[mid] < target {
            start = mid + 1
        } else {
            return true
        }
    }
    return false
}