import Foundation

func solution(_ num_list:[Int]) -> Int {
    let multiply = num_list.reduce(1) { $0 * $1 }
    let sum = num_list.reduce(0) { $0 + $1 }
    
    return multiply < (sum*sum) ? 1 : 0
}