//
//  Model.swift
//  DiscriminantApp
//
//  Created by Cyril on 26.07.21.
//

import Foundation

enum OptionType: String {
    case start = "s"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "s": self = .start
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

final class Discriminant {
    
    let consoleIO = ConsoleIO()
    
    func linearSolve(a: Double, b: Double) -> [ComplexNumber] {
        return [ComplexNumber(-b/a)]
    }
    
    func quadraticSolve(a: Double, b: Double, c: Double, threshold: Double = 0.0001) -> [ComplexNumber] {
        if a == 0 { return linearSolve(a: b, b: c) }
        var roots = [ComplexNumber]()
        var d = pow(b, 2) - 4 * a * c
        
        if -threshold < d && d < threshold { d = 0 }
        if d > 0 {
            let x_1 = ComplexNumber((-b + sqrt(d)) / (2 * a))
            let x_2 = ComplexNumber((-b - sqrt(d)) / (2 * a))
            roots = [x_1, x_2]
        } else if d == 0 {
            let x = ComplexNumber(-b / (2 * a))
            roots = [x]
        } else if d < 0 {
            let x_1 = ComplexNumber(-b / (2 * a), sqrt(-d) / (2 * a))
            let x_2 = ComplexNumber(-b / (2 * a), -sqrt(-d) / (2 * a))
            roots = [x_1, x_2]
        }
        return roots
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        
        consoleIO.writeMessage("Welcome to DiscriminantApp.\nLet's find out discriminant.\nax2 + bx + c = 0 \nEnter a number")
        
        var shouldQuit = false
        while !shouldQuit {
            
            consoleIO.writeMessage("Type 's' to start or type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .start:
                consoleIO.writeMessage("Type the first number (a):")
                let first = consoleIO.isNumber()
                consoleIO.writeMessage("\(first)*x2 + bx + c = 0\nType the second number (b):")
                let second = consoleIO.isNumber()
                consoleIO.writeMessage("\(first)*x2 + \(second)*x + c = 0\nType the third number (c):")
                let third = consoleIO.isNumber()
                //5
                let result = quadraticSolve(a: first, b: second, c: third)
                consoleIO.writeMessage("Square roots of the equation \(first)*x2 + \(second)*x + \(third) = 0 are \(result))")
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
}
