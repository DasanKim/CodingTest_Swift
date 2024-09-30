import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var grades = [0, 0, 0]
    let a = [1, 2, 3, 4, 5]
    let b = [2, 1, 2, 3, 2, 4, 2, 5]
    let c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    for (i, n) in answers.enumerated() {
        if n == a[i%a.count] { grades[0] += 1 }
        if n == b[i%b.count] { grades[1] += 1 }
        if n == c[i%c.count] { grades[2] += 1 }
    }

    let maxGrade = grades.max()!
    
    return grades.enumerated().filter { $0.element == maxGrade }.map { $0.offset + 1 }
}