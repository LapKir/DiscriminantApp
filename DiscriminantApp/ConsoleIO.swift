//
//  ConsoleIO.swift
//  DiscriminantApp
//
//  Created by Cyril on 27.07.21.
//

import Foundation

enum OutputType {
    case standard
    case error
}

final class ConsoleIO {
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func isNumber() -> Double {
        var result: Double = 0
        var count = 0
        
        while count < 1 {
            guard let a = readLine() else { continue }
            if let number = Double(a) {
                result = number
                count += 1
            } else if a.isEmpty {
                result = 1
                count += 1
                print("Default number is 1")
            } else {
                print("Enter correct number")
            }
        }
        return result
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
