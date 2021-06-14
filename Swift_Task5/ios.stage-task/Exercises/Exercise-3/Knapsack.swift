import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        
        if ((maxWeight > 2500) || (maxWeight < 0)) {return 0}
        
        
        var arrFood = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: foods.count + 1)
        var arrDrinks = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: drinks.count + 1)
        
 ///заполнение массива arrFood для еды
        
        for j in 0..<maxWeight {
            arrFood[0][j] = 0
        }
    
        for i in 1..<arrFood.count {
            for j in 0..<maxWeight {
                if (foods[i - 1].weight > j) {
                    arrFood[i][j] = arrFood[i - 1][j]
                } else {
                    arrFood[i][j] = max(arrFood[i - 1][j], arrFood[i - 1][j - foods[i - 1].weight] + foods[i - 1].value)
                }
            }
        }
///заполнение массива arrFood для еды
        
///заполнение массива arrDrinkдля напитков
               
               for j in 0..<maxWeight {
                   arrDrinks[0][j] = 0
               }
               
               for i in 1..<arrDrinks.count {
                   for j in 0..<maxWeight {
                       if (drinks[i - 1].weight > j) {
                           arrDrinks[i][j] = arrDrinks[i - 1][j]
                       } else {
                           arrDrinks[i][j] = max(arrDrinks[i - 1][j], arrDrinks[i - 1][j - drinks[i - 1].weight] + drinks[i - 1].value)
                       }
                   }
               }
///заполнение массива arrDrink для напитков
        
        var distatance = 0

        for i in 0...maxWeight {
            let Food = arrFood[foods.count][i]
            let Drinks = arrDrinks[drinks.count][maxWeight - i]
            let minFoodOrDrink = min(Food, Drinks)
            
            distatance = max(distatance, minFoodOrDrink)
        }
                
        return distatance
    }
}
