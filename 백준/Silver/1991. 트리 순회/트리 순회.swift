let n = Int(readLine()!)!
var lcs = Array(repeating: "", count: n+1)
var rcs = Array(repeating: "", count: n+1)
var result = Array(repeating: "", count: 3)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let index = Int(Character(input[0]).asciiValue!)-64
    lcs[index] = input[1]
    rcs[index] = input[2]
}

preorder(cur: "A")
inorder(cur: "A")
postorder(cur: "A")

print(result.joined(separator: "\n"))

func preorder(cur: String) {
    let index = Int(Character(cur).asciiValue!)-64

    result[0] += cur
    if lcs[index] != "." { preorder(cur: lcs[index]) }
    if rcs[index] != "." { preorder(cur: rcs[index]) }
}

func inorder(cur: String) {
    let index = Int(Character(cur).asciiValue!)-64

    if lcs[index] != "." { inorder(cur: lcs[index]) }
    result[1] += cur
    if rcs[index] != "." { inorder(cur: rcs[index]) }
}

func postorder(cur: String) {
    let index = Int(Character(cur).asciiValue!)-64

    if lcs[index] != "." { postorder(cur: lcs[index]) }
    if rcs[index] != "." { postorder(cur: rcs[index]) }
    result[2] += cur
}