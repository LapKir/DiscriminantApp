//
//  ComplexNumber.swift
//  DiscriminantApp
//
//  Created by Cyril on 27.07.21.
//

import Foundation

struct ComplexNumber {
    
    var real: Double
    var imaginary: Double
    
    init(_ real: Double, _ imaginary: Double) {
        self.real = real
        self.imaginary = imaginary
    }
    
    init(_ real: Double) {
        self.real = real
        self.imaginary = 0
    }
}
