
class FoodRatings {
    var system: [String: (cuisine: String, rating: Int)] = [:]
    
    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        for (i, food) in foods.enumerated() {
            system[food] = (cuisines[i], ratings[i])
        }
    }
    
    func changeRating(_ food: String, _ newRating: Int) {
        guard let (cuisine, oldRating) = system[food] else { return }
        system[food] = (cuisine, newRating)
    }
    
    func highestRated(_ cuisine: String) -> String {
        var foods: [String] = []
        var maxRating = Int.min
        for (food, (cuis, rating)) in system where cuis == cuisine {
            if rating > maxRating {
                foods = [food]
                maxRating = rating
            } else if rating == maxRating {
                foods.append(food)
            }
        }
        
        foods = foods.sorted()
        return foods.first ?? ""
    }
}

/**
 * Your FoodRatings object will be instantiated and called as such:
 * let obj = FoodRatings(foods, cuisines, ratings)
 * obj.changeRating(food, newRating)
 * let ret_2: String = obj.highestRated(cuisine)
 */