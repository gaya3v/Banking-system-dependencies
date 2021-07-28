//
//  AccountOperationsProtocol.swift
//  ATM Model
//
//  Created by Gayathri V on 20/07/21.
//

import Foundation

protocol CardPaymentProtocol {
    func getCardNumber()
    func pinValidation(number : Int) ->  Bool
}

