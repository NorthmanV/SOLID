//: Dependency inversion principle

import UIKit

// Bad approach. UnhappyMan depend on UnhappyWife

class UnhappyWife {
    func getFood() -> String {
        return "Vegeterian food"
    }
}

class UnhappyMan {
    let wife = UnhappyWife()
    var food: String {
        return wife.getFood()
    }
}

// Batter but not best approach. To change food you will need change wife

protocol Wife {
    func getFood() -> String
}

class NormalMan {
    var wife: Wife
    var food: String {
        return wife.getFood()
    }
    
    init(wife: Wife) {
        self.wife = wife
    }
}

class NormalWife: Wife {
    func getFood() -> String {
        return "Normal food"
    }
}

// Best approach

protocol GetFood {
    func getFood() -> String
}

class GoodWife: GetFood {
    func getFood() -> String {
        return "Good food"
    }
}

class Mother: GetFood {
    func getFood() -> String {
        return "Tasty food"
    }
}

class Sister: GetFood {
    func getFood() -> String {
        return "Classic food"
    }
}

class HappyMan {
    var foodProvider: GetFood
    var food: String {
        return foodProvider.getFood()
    }
    init(foodProvider: GetFood) {
        self.foodProvider = foodProvider
    }
}

let happyMan = HappyMan(foodProvider: Mother())
happyMan.food  // Tasty food


