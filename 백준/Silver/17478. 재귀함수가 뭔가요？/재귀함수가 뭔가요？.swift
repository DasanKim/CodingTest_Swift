let n = Int(readLine()!)!
let intro = "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다."
let q = "\"재귀함수가 뭔가요?\""
let a1 = "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."
let a2 = "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."
let a3 = "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""
let lastAns = "\"재귀함수는 자기 자신을 호출하는 함수라네\""
let outro = "라고 답변하였지."

print(intro)
whatTheRecursion(n: n, str: "")

func whatTheRecursion(n: Int, str: String) {
    if n == 0 {
        print(str+q)
        print(str+lastAns)
        print(str+outro)
        return
    }

    print(str+q)
    print(str+a1)
    print(str+a2)
    print(str+a3)
    whatTheRecursion(n: n-1, str: str + "____")
    print(str+outro)
}