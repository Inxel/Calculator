//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Артем Загоскин on 04/04/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func perfomTwoNumberCalculation(n2: Double) -> Double? {
    
        guard let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.calcMethod else {
            return nil
        }
        
        switch operation {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            fatalError("Can't do math operation")
        }
        
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return perfomTwoNumberCalculation(n2: n)
            default:
                intermidiateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
}
