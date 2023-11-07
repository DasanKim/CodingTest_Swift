import Foundation

let input1 = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input1[0]
let k = input1[1]
var array = [[Int]](repeating: [0, 0], count: 6)
var result = 0

for _ in 0..<n {
    let input2 = readLine()!.split(separator: " ").compactMap{ Int($0) }

    if input2[0] == 0 {
        array[input2[1]-1][0] += 1
    } else if input2[0] == 1 {
        array[input2[1]-1][1] += 1
    }
}

for i in array {
    if i.max()! == 0 { continue }

    result += Int(ceil(Double(i[0]) / Double(k)))
    result += Int(ceil(Double(i[1]) / Double(k)))
}

print(result)