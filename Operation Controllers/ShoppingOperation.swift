//
//  ShoppingOperation.swift
//  Bank System Program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class ShoppingOperation : Operation, ShoppingTransactionProtocol, CreditLimitCheckProtocol {
    
    func performOperation() {
        inputCardNumber()
        if validateCardNumber(number: currentCardNumber) >= 0 {
            inputPinNumber()
            if isPinValid(cardnumber: currentCardNumber, userInput: pin) {
                shoppingTransaction()
            }
            else {
                recheckPinNumber()
                shoppingTransaction()
            }
        }
        else {
            retryCard()
        }
    }
    func retryCard() {
        print("Enter card number again? - To proceed enter y \n To cancel and go back enter n")
        let input = readLine()
        if let str = input {
            switch(str) {
            case "y" :
                performOperation()
            case "n" :
                print("Cancelling current operation! Redirecting to main menu...\n")
            default:
                print("Enter correct choice !!")
                
            }
        }
    }
    func isfundWithinCreditLimit() -> Bool {
        if creditLimit > 100 {
            return true
        }
        return false
    }
    func isPaymentWithinLimit(amount: Double) -> Bool {
        
        if amount > creditLimit {
            return false
        }
        return true
    }
    
    func swipe(amount: Double, in account : Int, with cardNumber : Int) {
        if validateCardNumber(number: cardNumber) == 0 {
            if isPaymentWithinLimit(amount: amount) && isfundWithinCreditLimit() {
                print("Swipe amount - USD $",amount)
                creditLimit -= amount
                let bonus = cashback(amount: amount)
                creditLimit += bonus
                print("Eligible Limit amount after payment & cashback is USD $",creditLimit)
                creditCardInProcess.setCreditLimit(newLimit: creditLimit)
            }
        }
        else if validateCardNumber(number: cardNumber) == 1 {
            if hasSufficientBalanceForTransaction(amount: amount) && hasMinimumBalance(account: accountNumberOnCard) {
                var bal = accountInProcess.getBalance()
                print("Swipe amount - USD $",amount)
                bal -= amount
                let bonus = cashback(amount: amount)
                bal+=bonus
                print("Balance in account after cashback is USD $",bal)
                accountInProcess.setNewBalance(newBal: bal)
            }
            else {
                print("Insufficient funds for transaction")
            }
        }
    }
    
    func cashback(amount: Double) -> Double {
        let bonus = amount * 0.01
        print("Cashback on Swiping - USD $",bonus)
        return bonus
    }
    
    func shoppingTransaction() {
        var choice : String = ""
        while !(choice == "n") {
            //MARK: - check for min balance of $100
                print("Confirm your payment transaction - \n Enter y to Swipe amount \n Enter n to Cancel payment \n Enter exit to end")
                let input = readLine()
                if let str = input {
                    choice = str
                    switch(choice) {
                    case "y" :
                        print("Enter amount : ")
                        let amount = readLine()
                        swipe(amount: (Double(amount!)) ?? 0.0, in: accountNumberOnCard, with: currentCardNumber)
                    case "n" :
                        print("Cancelling card payment! Exiting...\n")
                    case "exit" :
                        print("Thank you\n")
                        exit(0)
                    default:
                        print("Enter correct choice !!")
                        
                    }
                }
                else {
                    print("Invalid input")
                }
        }
        
    }
}
