let len = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
var arr: [(Int, Int)] = []
let start = 0
var index = start
var result = [String]()

(0..<len).forEach { arr.append(($0, inputs[$0])) }

while arr.isEmpty == false {
    let space = arr[index].1

    result.append((String(arr[index].0 + 1)))
    arr.remove(at: index)

    var temp = index + space

    if temp < 0 && arr.count > 0 {
        while temp < 0 {
            temp += arr.count
        }
    }

    if space > 0 && arr.count > 0 {
        temp = (temp - 1) % arr.count
    }

    index = temp
}

print(result.joined(separator: " "))