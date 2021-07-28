//
//  enums.swift
//  Banking sys
//
//  Created by Gayathri V on 26/07/21.
//

import Foundation

enum AtmChoice {
    case withdraw
    case deposit
    case show
    case menu
    case quit
}
enum BankChoice {
    case createAccount
    case createCard
    enum performBankOperation {
        case withdraw
        case deposit
        case show
        case menu
        case quit
    }
    case menu
    case quit
}
enum ShoppingChoice {
    case y
    case n
    case exit
}
