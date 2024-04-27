import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit = Array(repeating: false, count: n)
    var count = 0
//     var graph = Array(repeating: [Int](), count: n)
    
//     for i in 0..<n {
//         for j in 0..<n {
//             if computers[i][j] == 1 && i != j {
//                 graph[i].append(j)
//             }
//         }
//     }
    
    func dfs(start: Int) {
        visit[start] = true
        
        for (i, v) in computers[start].enumerated() where !visit[i] {
            if v != 1 { continue }
            dfs(start: i)
        }
    }
    
    for i in 0..<n {
        if !visit[i] { 
            dfs(start: i)
            count += 1
        }      
    }
    
    return count
}