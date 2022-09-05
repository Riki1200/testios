

import Foundation
final class GameViewModel: ObservableObject {
    @Published var magicNumber = ""
    @Published var generateList: [Int] = []
    @Published var nonDuplicateValue: [Int: Int] = [:]
    @Published var primeNumber: [Int] = []
    @Published var breakdown: [Int] = []
    @Published var amount: String = "0"
    @Published var desglose: [Int: Int] = [:]
    let bills = [1, 5, 10, 25, 50, 100, 200, 500, 1000, 2000]

    func generateListFunction(max: Int) {
        for item in 0 ..< max {
            let n = Int.random(in: item ..< 10 + item * 8)
            if n > 1 || n <= 100 {
                generateList.append(n)
            }
        }
        generateList = generateList.unique()
    }

    func generateListPrimeNumber(_ n: Int) {
        for value in 0 ..< n {
            if checkIsPrime(value) {
                primeNumber.append(value)
            }
        }
    }

    public func getBills(m: Int) -> [Int] {
        var monto = m
        var totals: [Int] = []
        for montos in bills.reversed() {
            let residuo = m / montos
            totals.append(residuo)
            monto = monto % montos
        }
        return totals
    }

    func checkIsPrime(_ number: Int) -> Bool {
        if number == 1 || number == 0 {
            return false
        }
        for prime in 2 ..< number {
            if number % prime == 0 {
                return false
            }
        }
        return true
    }
}
