//
//  Operation.swift
//  Bank System Program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class Operation : InputController, TransactionProtocol, BalanceCheckProtocol {
    
    func validateCardNumber(number : Int) -> Int {
        
        for card in db.getCreditCardList() {
            if card.getCardNumber() == number {
                return 0
            }
        }
        for card in db.getDebitCardList() {
            if card.getCardNumber() == number {
                accountNumberOnCard = card.getCardAccountNumber()
                return 1
            }
        }
        print("Invalid card details")
        return -1
    }
    
    func isPinValid(cardnumber : Int, userInput pin : Int) ->  Bool {
                if validateCardNumber(number: cardnumber) == 1 {
                    for card in db.getDebitCardList() {
                        if card.getCardNumber() == cardnumber {
                            if card.getPinNumber() == pin {
                                setAccountInProcess()
                                return true
                            }
                        }
                    }
                }
                else if validateCardNumber(number: cardnumber) == 0 {
                    for card in db.getCreditCardList() {
                        if card.getCardNumber() == cardnumber {
                            if card.getPinNumber() == pin {
                                creditLimit = card.getCreditLimit()
                                creditCardInProcess = card
                                return true
                            }
                        }
                    }
                }
            else {
                print("Invalid pin number!")
            }
        return false
    }
    
    func recheckPinNumber() {
        if pinCheck<3 {
            print("Wrong pin! Try again!")
            inputPinNumber()
            if !isPinValid(cardnumber: currentCardNumber, userInput: pin) {
                pinCheck+=1
                recheckPinNumber()
            }
        }
        else {
            print("You've exhausted the pin number tries. Try after 24 hours. \n")
            pinCheck = 0
            exit(0)
        }
    }
    
    func setAccountInProcess() {
        for acc in db.getAccountList() {
            if acc.getAccountNumber() == accountNumberOnCard || acc.getAccountNumber() == accountNumber {
                accountInProcess = acc
                break
            }
        }
    }
    
    func withdraw(amount: Double, in account : Int) {
        var balance = accountInProcess.getBalance()
        if hasSufficientBalanceForTransaction(amount: amount) && hasMinimumBalance(account: accountInProcess.getAccountNumber()){
            print("Withdraw amount - USD $",amount)
            balance -= amount
            balance -= taxCharges(amount: amount)
            //accountInProcess.setNewBalance(newBal: balance)
            db.updateBalance(of: accountInProcess, bal: balance)
            print("Balance in account after withdrawal is USD $",accountInProcess.getBalance())
           
        }
        else {
            print("Insufficient funds for transaction")
        }
    }
    
    func deposit(amount: Double, in account : Int) {
        var balance = accountInProcess.getBalance()
        print("Deposit amount - USD ",amount)
        balance += amount
        //accountInProcess.setNewBalance(newBal: balance)
        db.updateBalance(of: accountInProcess, bal: balance)
        print("Balance in account after deposit is USD $",accountInProcess.getBalance())
    }
    
    func showBalance(in account : Int) {
        print("BALANCE : USD $",accountInProcess.getBalance())
    }
    
    func taxCharges(amount: Double) -> Double {
        var reductionAmt = 0.0
        let transactionCharge = amount > 100 ? 0.04 : 0.02
        
        reductionAmt = amount * transactionCharge
        
        print("Transaction Charges - USD $",reductionAmt)
        return reductionAmt
    }
    
    func hasSufficientBalanceForTransaction(amount: Double) -> Bool {
        if amount > accountInProcess.getBalance() {
            return false
        }
        return true
    }
    
    func hasMinimumBalance(account: Int) -> Bool {
        if accountInProcess.getBalance() > 100 {
            return true
        }
        return false
    }
    func generateAccountNumber() -> Int {
        let randomInt = Int.random(in: 1000000000...9999999999)
        return randomInt
    }
    func generateCardNumber() -> Int {
        let randomInt = Int.random(in: 1000...9999)
        return randomInt
    }
    
}

