let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0
var end = n-1
var minValue = (arr[start], arr[end], abs(arr[start] + arr[end]))

while start < end {
    let mix = arr[start] + arr[end]
    let absMix = abs(mix)

    if minValue.2 > absMix {
        minValue = (arr[start], arr[end], absMix)
    }

    if mix < 0 {
        start += 1
    } else {
        end -= 1
    }
}
print("\(minValue.0) \(minValue.1)")