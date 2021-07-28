//
//  InputController.swift
//  Banking sys
//
//  Created by Gayathri V on 26/07/21.
//

import Foundation

class InputController {
    var db = BankData()
    var accountNumber : Int = 0
    var accountInProcess : Account!
    var creditCardInProcess : CreditCard!
    var newCreditCard = CreditCard(cardNumber: 0, cvvNumber: 0, cardExpiryDate: "", pinNumber: 0, creditLimit: 0.0)
    //var newDebitCard = DebitCard(accNumber: 0, cardNumber: 0, cvvNumber: 0, cardExpiryDate: "", pinNumber: 0)
    var newAccount = Account(accountNumber: 0, accountHolderName: "", balance: 0.0, debitCard: [])
    var currentCardNumber : Int = 0
    var accountNumberOnCard : Int = 0
    var creditLimit = 0.0
    var pinCheck = 0
    var pin : Int = 0
    
    func inputCardNumber() {
        print("Enter card number to begin the process : ")
        let string = readLine()
        if let input = string, let cardNum = Int(input) {
            currentCardNumber = cardNum
        }
        else {
            print("Invalid card number input!")
        }
    }
    func inputPinNumber() {
        
        print("Enter PIN number : ")
        let string = readLine()
        if let input = string, let pinNum = Int(input) {
            pin = pinNum
        }
        else {
            print("Invalid pin number input!")
        }
    }
    func inputAccountNumber() {
        print("Enter account number to begin the process : ")
        let string = readLine()
        if let input = string, let accNum = Int(input) {
            accountNumber = accNum
        }
    }
    func inputNewDebitCard() -> (Int, Int, String, Int) {
        print("Enter new 4-digit debit card number : ")
        let dcNumber = readLine()
        print("Enter the 3-digit CVV number of new debit card : ")
        let cvvNum = readLine()
        print("Enter the expiry date of new debit card : ")
        let expiryDate = readLine()
        print("Set new pin number : ")
        let pin = readLine()
        if let input1 = dcNumber, let dcNumber = Int(input1), let input2 = cvvNum, let cvvNum = Int(input2), let expiryDate = expiryDate, let input4 = pin, let pin = Int(input4) {
           return (dcNumber,cvvNum,expiryDate,pin)
        }
        else {
            print("Invalid input")
            return (0,0,"",0)
        }
    }
    func inputNewCreditCard() -> (Int, Int, String, Int, Double) {
        print("Enter new 4-digit credit card number : ")
        let ccNumber = readLine()
        print("Enter the 3-digit CVV number of new credit card : ")
        let cvvNum = readLine()
        print("Enter the expiry date of new credit card : ")
        let expiryDate = readLine()
        print("Set new pin number : ")
        let pin = readLine()
        print("Set credit limit : ")
        let fundLimit = readLine()
        if let input1 = ccNumber, let ccNumber = Int(input1), let input2 = cvvNum, let cvvNum = Int(input2), let expiryDate = expiryDate, let input4 = pin, let pin = Int(input4), let input5 = fundLimit, let fundLimit = Double(input5) {
            return (ccNumber,cvvNum,expiryDate,pin,fundLimit)
        }
        else {
            print("Invalid input")
            return (0,0,"",0,0.0)
        }
    }
    
}


