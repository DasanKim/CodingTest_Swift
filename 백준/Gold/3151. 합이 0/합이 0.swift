let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var result = 0

for i in 0..<n {
    var start = i+1
    var end = n-1
    let goal = -arr[i]
    var tempIndex = n

    while start < end {
        let sum = arr[start] + arr[end]

        if sum < goal {
            start += 1
        } else if sum == goal {
            if arr[start] == arr[end] {
                result += end - start
            } else {
                if tempIndex > end {
                    tempIndex = end
                    while arr[tempIndex-1] == arr[end] {
                        tempIndex -= 1
                    }
                }
                result += end - tempIndex + 1
            }
            start += 1
        } else {
            end -= 1
        }
    }
}

print(result)