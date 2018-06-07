//: # Closures

import UIKit

//: The Sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

//: Closure Expression Syntax

reversedNames = names.sorted(by: { (s1, s2) -> Bool in
    return s1 > s2
})
