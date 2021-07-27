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

class ConsoleIO {
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
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
            }
        }
        return result
    }
    
    func getInput() -> String {
        // 1
        let keyboard = FileHandle.standardInput
        // 2
        let inputData = keyboard.availableData
        // 3
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        // 4
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
}
