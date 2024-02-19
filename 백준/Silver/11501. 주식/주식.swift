let t = Int(readLine()!)!
var input: [Int] = []
var result = Array(repeating: 0, count: t)

for x in 0..<t {
    let n = Int(readLine()!)!

    input = readLine()!.split(separator: " ").compactMap{ Int($0) }

    let currentMax = input.enumerated().max { a, b in
                                             a.element < b.element
                                            } ?? (0, 0)

    var start = 0
    var end = currentMax.offset

    if end == 0 {
        result[x] = 0
    } else if end == n-1 {
        result[x] = cell(from: 0, to: end)
    } else {
        while start < n {
            let currentMax = input[start...n-1].enumerated().max { a, b in
                                                                  a.element < b.element
                                                                 } ?? (0, 0)

            end = start + currentMax.offset
            result[x] += cell(from: start, to: end)
            start = end + 1
        }
    }
}

result.forEach { print($0) }

func cell(from: Int, to: Int) -> Int {
    var sum = 0

    for i in from..<to {
        sum += input[to] - input[i]
    }
    return sum
}