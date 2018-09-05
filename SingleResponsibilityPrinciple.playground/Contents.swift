//: Single responsibility principle

import UIKit

protocol CanBeOn {
    func on()
}

protocol CanBeOff {
    func off()
}

class Selector: CanBeOn, CanBeOff {
    fileprivate var state = false
    
    func on() {
        state = true
    }
    
    func off() {
        state = false
    }
}

class SwitchOn {
    let selector: CanBeOn
    init(selector: CanBeOn) {
        self.selector = selector
    }
    func execute() {
        selector.on()
    }
}

class SwitchOff {
    let selector: CanBeOff
    init(selector: CanBeOff) {
        self.selector = selector
    }
    func execute() {
        selector.off()
    }
}

let selector = Selector()
selector.state  // false

let switcherOn = SwitchOn(selector: selector)
switcherOn.execute()  // true

let switcherOff = SwitchOff(selector: selector)
switcherOff.execute()  // false











