//
//  ATMOperation.swift
//  Bank System Program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class ATMOperation : Operation,ATMTransactionProtocol {
    
    func performOperation() {
        inputCardNumber()
        if validateCardNumber(number: currentCardNumber) > 0 {
            inputPinNumber()
            if isPinValid(cardnumber: currentCardNumber, userInput: pin) {
                atmTransaction()
            }
            else {
                recheckPinNumber()
                atmTransaction()
            }
        }
        else {
            print("Invalid card credentials.\n")
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
                print("Cancelling current operation! Redirecting to main menu...")
            default:
                print("Enter correct choice !!")
                
            }
        }
    }
    
    func isValidAmount(amount: Double) -> Bool {
        if amount.truncatingRemainder(dividingBy: 5.0) == 0 {
            return true
        }
        return false
    }
    
    func selectLocation() {
        print("Enter the ATM Branch : ")
        let atmBranch = readLine()
        if let branch = atmBranch {
            let atm = ATM(id: 1, atmLocation: branch)
            print("Welcome to \(atm.atmLocation) branch ATM of HDFC Bank \n")
        }
        else {
            print("There is no such ATM location!")
        }
    }
    
    func atmTransaction() {
        var choice = 0
        accountNumberOnCard = accountInProcess.getAccountNumber()
        
        while !(choice==4) {
            //MARK: - check for min balance of $100
            if (hasMinimumBalance(account: accountNumberOnCard)) {
                
                print(" 1. Withdraw \n 2. Deposit \n 3. Show \n 4. Back to main menu \n 5. Quit\n")
                print("Please enter a choice : ")
                let str = readLine()
                if let input = str, let ch = Int(input) {
                    choice = ch
                    switch(choice) {
                    case 1 :
                        print("Enter amount : ")
                        let str = readLine()
                        if let amt = str, let amount = Double(amt) {
                            withdraw(amount: amount, in: accountNumberOnCard)
                        }
                        else {
                            print("Invalid amount entered")
                        }
                    case 2 :
                        print("Enter amount : ")
                        let str = readLine()
                        if let amt = str, let amount = Double(amt) {
                            deposit(amount: amount, in: accountNumberOnCard)
                        }
                        else {
                            print("Invalid amount entered")
                        }
                        
                    case 3 :
                        showBalance(in: accountNumberOnCard)
                    case 4:
                        print("Redirecting you to main menu...")
                    case 5:
                        print("Thank you for banking with us!")
                        exit(0)
                        
                    default:
                        print("Enter correct choice !!")
                        
                    }
                }
                else {
                    print("Invalid input!")
                }
            }
            else {
                print("Bank account has balance below 100, cannot do transactions.")
                break
            }
        }
    }
    
    //    func isCardValid (number : Int) -> Bool {
    //        if validateCardNumber(number: currentCardNumber) == 1 {
    //            print("Credit cards cannot be used in ATM machine !")
    //                            return false
    //        }
    //        else if validateCardNumber(number: currentCardNumber) == 2 {
    //            print("Valid Debit Card !")
    //
    //                            return true
    //        }
    //        else {
    //            return false
    //        }
    //    }
    
    
    
}
