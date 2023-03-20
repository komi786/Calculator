//
//  CalcButtonenum.swift
//  Calculator
//
//  Created by Komal Gilani on 17/03/2023.
//

import Foundation
import SwiftUI
enum CalcuButton:String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four  = "4"
    case five  =  "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case equal = "="
  
    var buttonColor:Color{
        switch self{
        case .add , .subtract, .multiply ,.divide ,.equal:
            return Color(.orange)
        case .clear,.negative,.percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(displayP3Red: 55/255, green: 55/255, blue: 55/255, alpha: 1))
        }
    }
}

enum Operations{
    case add,subtract, multiply,divide,equal,none
}
