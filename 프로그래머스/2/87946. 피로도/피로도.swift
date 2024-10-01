import Foundation

var result = 0
var visit: [Bool] = []

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    visit = Array(repeating: false, count: dungeons.count)
    
    process(current: k, count: 0, dungeons: dungeons)
    
    return result
}

func process(current: Int, count: Int, dungeons: [[Int]]) {
    //count가 증가했다는 건 던전에 방문했다는 의미
    result = max(result, count)
    
    for i in 0..<visit.count {
        if current < dungeons[i][0] { continue }
        
        if !visit[i] {
            visit[i] = true
            process(current: current - dungeons[i][1], count: count + 1, dungeons: dungeons)
            visit[i] = false
        }
    }
}