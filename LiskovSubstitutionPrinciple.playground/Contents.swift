//: Liskov substitution principle

import UIKit

// Wrong way

class Bird {
    var name: String
    var flySpeed: Double

    init(name: String, flySpeed: Double) {
        self.name = name
        self.flySpeed = flySpeed
    }
}

class Eagle: Bird {}

class Penguin: Bird {
    var swimSpeed: Double

    init(name: String, flySpeed: Double, swimSpeed: Double) {
        self.swimSpeed = swimSpeed
        super.init(name: name, flySpeed: flySpeed)
    }
}

let eagle = Eagle(name: "Eagle", flySpeed: 25)
let penguin = Penguin(name: "Penguin", flySpeed: 0, swimSpeed: 10)  // No fly speed for penguin, we should change Bird class


// Right way

protocol CanFly {
    var flySpeed: Double {get set}
}

protocol CanSwim {
    var swimSpeed: Double {get set}
}

class GeneralBird {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class ProperEagle: GeneralBird, CanFly {
    var flySpeed: Double
    init(name: String, flySpeed: Double) {
        self.flySpeed = flySpeed
        super.init(name: name)
    }
}

class ProperPenguin: GeneralBird, CanSwim {
    var swimSpeed: Double
    init(name: String, swimSpeed: Double) {
        self.swimSpeed = swimSpeed
        super.init(name: name)
    }
}

let properEagle = ProperEagle(name: "Eagle", flySpeed: 25)
let properPenguin = ProperPenguin(name: "Penguin", swimSpeed: 10)














