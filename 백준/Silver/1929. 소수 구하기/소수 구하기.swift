let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
var arr = Array(repeating: true, count: input[1]+1)

arr[1] = false

var i = 2
while i*i <= input[1] {
    if arr[i] == true {
        for j in stride(from: i*i, through: input[1], by: i) {
            arr[j] = false
        }
    }
    i += 1
}

var result = ""

for i in input[0]...input[1] {
    if arr[i] == true {
        result += "\(i)\n"
    }
}

print(result)