import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        if (prices.count < 2) {return 0}
        
        let sortedAscArr = prices.sorted(by: <)
        let sortedDescArr = prices.sorted(by: >)
        var maxValue = 0
        var countShares = 0
        
        //если входной массив сортирован по возрастанию
        if (sortedAscArr == prices) {
            for i in 0..<prices.count - 1 {
                maxValue -= prices[i]
                countShares += 1
            }
            maxValue += prices.last! * countShares
            return maxValue
        }
        
        //если входной массив сортирован по убыванию
        if (sortedDescArr == prices) {return 0}
        
        //если входной массив состоит из одинаковых элементов
        if (sortedAscArr == sortedDescArr) {return 0}
        
        
        for i in 0..<prices.count - 1 {
            if prices[i + 1] >= prices[i] {
                maxValue -= prices[i]
                countShares += 1
            } else {
                maxValue += countShares * prices[i]
                countShares = 0
            }
        }
        maxValue += countShares * prices.last!
        
        return maxValue
    }
}
