let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = inputs[0]
let k = inputs[1]
var index = 0
var arr: [String] = []
let error = "!"
var result = ""

for _ in 0..<k {
    let n = readLine()!.split(separator: " ").map({ String($0) })

    if !check(Int(n[0])!, n[1]) {
        result = error
        break
    }
}

let temp = arr.filter { $0 != "?" }

if result == "!" || Set(temp).count != temp.count {
    print(error)
} else {
    arr[0...index].reverse()
    arr[(index+1)...].reverse()
    print(arr.joined())
}

func check(_ s: Int, _ str: String) -> Bool {
    if arr.isEmpty {
        arr = Array(repeating: "?", count: n)
        arr[index] = str
        return true
    }

    index = (index + s) % n

    if arr[index] == "?" {
        arr[index] = str
    } else if arr[index] != "?" && arr[index] != str {
        return false
    }

    return true
}