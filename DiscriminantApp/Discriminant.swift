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

class Discriminant {
    
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
        //1
        consoleIO.writeMessage("Welcome to Discriminant.")
        //2
        var shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.writeMessage("Type 's' to start or type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .start:
                //4
                consoleIO.writeMessage("Type the first number:")
                let first = consoleIO.isNumber()
                consoleIO.writeMessage("Type the second number:")
                let second = consoleIO.isNumber()
                consoleIO.writeMessage("Type the third number:")
                let third = consoleIO.isNumber()
                //5
                let result = quadraticSolve(a: first, b: second, c: third)
                consoleIO.writeMessage("Result is \(result))")
                
                
            case .quit:
                shouldQuit = true
                
            default:
                //6
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
}
