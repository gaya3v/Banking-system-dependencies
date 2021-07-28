//
//  DebitCard.swift
//  banking program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class DebitCard : Card {
    private var accNumber : Int
    init(accNumber : Int, cardNumber : Int, cvvNumber : Int, cardExpiryDate : String, pinNumber : Int) {
        self.accNumber = accNumber
        super.init(cardNumber: cardNumber, cvvNumber: cvvNumber, cardExpiryDate: cardExpiryDate, pinNumber: pinNumber)
    }
    func getCardAccountNumber() -> Int {
        return self.accNumber
    }
    func setCardAccountNumber(newCardAccNum : Int) {
        self.accNumber = newCardAccNum
    }
}
