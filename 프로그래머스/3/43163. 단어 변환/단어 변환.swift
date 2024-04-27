import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visit = Array(repeating: false, count: words.count)
    var count = Int.max
    
    guard words.contains(target) else { return 0 }
    
    func bfs() {
        var queue = [(begin, 0)]
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if target == cur.0 { 
                count = cur.1 < count ? cur.1 : count
            }
            
            for i in 0..<words.count {
                guard !visit[i] && check(cur.0, words[i]) else { continue }
                visit[i] = true
                queue.append((words[i], cur.1+1))
            }
        }
    }
    
    func check(_ str1: String, _ str2: String) -> Bool {
        let arr1 = Array(str1)
        let arr2 = Array(str2)
        var count = 0
        
        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                count += 1
            }
        }
        return count == 1
    }
    
    bfs()
    
    return count
}