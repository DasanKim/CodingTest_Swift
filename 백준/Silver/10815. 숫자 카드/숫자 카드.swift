let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

let _ = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = ""

for a in arr {
    result += "\(binarySearch(a)) "
}

print(result)

func binarySearch(_ target: Int) -> Int {
    var start = 0
    var end = n-1

    while start <= end {
        let mid = (start+end)/2

        if cards[mid] > target {
            end = mid - 1
        } else if cards[mid] < target {
            start = mid + 1
        } else {
            return 1
        }
    }
    return 0
}