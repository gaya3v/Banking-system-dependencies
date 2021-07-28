//
//  CreditCard.swift
//  banking program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class Card {
    private var cardNumber : Int
    private var cvvNumber : Int
    private var cardExpiryDate : String
    private var pinNumber : Int
    init(cardNumber : Int, cvvNumber : Int, cardExpiryDate : String, pinNumber : Int) {
        self.cardNumber = cardNumber
        self.cvvNumber = cvvNumber
        self.cardExpiryDate = cardExpiryDate
        self.pinNumber = pinNumber
    }
    func getCardNumber() -> Int {
        return self.cardNumber
    }
    func setNewCardNumber(newValue : Int) {
        self.cardNumber = newValue
    }
    func getPinNumber() -> Int {
        return self.pinNumber
    }
    func setNewPinNumber(newPin : Int) {
        self.cardNumber = newPin
    }
}


