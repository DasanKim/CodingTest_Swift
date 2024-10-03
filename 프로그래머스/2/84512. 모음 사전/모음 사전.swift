import Foundation

let vowel = ["A", "E", "I", "O", "U"]
var temp: [String] = []
var result = 0

func solution(_ word:String) -> Int {
    
    dfs(curr: "", word: word)
    
    return result
}

func dfs(curr: String, word: String) {
    if curr == word { 
        result = temp.count
        return 
    }
    temp.append(curr)
    
    if curr.count == 5 { return }
    
    for i in 0..<5 {
        dfs(curr: curr + vowel[i], word: word)
    }
}