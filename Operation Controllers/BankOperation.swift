
//
//  main.swift
//  banking program
//
//  Created by Gayathri V on 21/07/21.
//

import Foundation

class BankOperation : Operation {
   var exitChoice = 0
    
    func getAccountNumber() {
        if doesAccountExist() {
            print("Hello", accountInProcess.getAccountHolderName())
            exitChoice = 0
        }
        else {
            print("Account does not exist!! \n Create new one? y / n / exit ")
            let newAccountChoice = readLine()
            if newAccountChoice == "y" {
                createAccount()
                db.addAccountToList(newAccount: accountInProcess)
            }
            else if newAccountChoice == "n" {
                inputAccountNumber()
                getAccountNumber()
            }
            else if newAccountChoice == "exit" {
                exitChoice = 1
            }
            else {
                print("Error : Enter from given options!")
            }
        }
    }
    func doesAccountExist() -> Bool {
        for acc in db.getAccountList() {
            if acc.getAccountNumber() ==  accountNumber {
                accountInProcess = acc
                return true
            }
        }
        return false
    }
    func createAccount() {
        accountInProcess = newAccount
        let num = generateAccountNumber()
        accountNumber = num
        if !doesAccountExist() {
            accountInProcess.setAccountNumber(newAccNum: accountNumber)
        }
        else {
            createAccount()
        }
        print("Enter new account holder's name : ")
        let input2 = readLine()
        if let str = input2 {
            accountInProcess.setAccountHolderName(newUser: str)
        }
        print("Enter new account balance : ")
        let input3 = readLine()
        if let str = input3, let balance = Double(str) {
            accountInProcess.setNewBalance(newBal: balance)
        }
        else {
            print("Invalid input!")
        }
    }
    
    func createNewCard(for newAccount : Account, accountNum : Int) {
     
        print(" Enter 1 for new credit card \n Enter 2 for new debit card ")
        let input = readLine()
        if let cardChoice = input {
                if cardChoice == "1" {
                    createCreditCard(for: newAccount)
                }
                else if cardChoice == "2" {
                    createDebitCard(for: newAccount, accountNum: accountNum)
                }
                else {
                    print("Inappropriate choice")
                    createNewCard(for: newAccount, accountNum: accountNum)
                }
        }
        else {
            print("Invalid input")
        }
            
     
        }
    
        func createCreditCard(for newAccount : Account) {
            let tuple = inputNewCreditCard()
                db.addCreditCardToList(newCreditCard: CreditCard(cardNumber: tuple.0, cvvNumber: tuple.1, cardExpiryDate: tuple.2, pinNumber: tuple.3 ,creditLimit: tuple.4))
        }
    
        //MARK: - createDebitCard
        func createDebitCard(for newAccount : Account, accountNum : Int) {
            let tuple = inputNewDebitCard()
            db.addDebitCardToList(newDebitCard: DebitCard(accNumber: accountNum, cardNumber: tuple.0, cvvNumber: tuple.1, cardExpiryDate: tuple.2, pinNumber: tuple.3), of: accountNum)
        }
    
    func performOperation() {
         var choice = 0
         while !(choice==4) {
             print("1. Create Account \n 2. Create Card \n 3. Perform Transaction \n 4. Back to main menu \n 5. Quit")
             print("Please enter a choice : ")
             let str = readLine()
             if let input = str, let ch = Int(input) {
                 choice = ch
                 switch(choice) {
                 case 1 :
                     createAccount()
                     print("Account Created successfully")
                    print("Do you want to add debit cards your new account? y / n")
                    let cardChoice = readLine()
                    if cardChoice == "y" {
                        createDebitCard(for: accountInProcess, accountNum: accountInProcess.getAccountNumber())
                    }
                    else if cardChoice == "n" {
                        print("Add Debit cards later for easier banking!")
                    }
                    else {
                        print("Invalid input")
                    }
                    
                     print("Do you want to perform any transaction in your new account? y / n")
                     let opChoice = readLine()
                     if opChoice == "y" {
                         transactionProcess()
                     }
                     else if opChoice == "n" {
                         print("Thank you for banking with us!")
                         break
                     }
                     else {
                         print("Invalid input")
                     }
                 case 2 :
                    inputAccountNumber()
                    getAccountNumber()
                    if exitChoice == 0 {
                     createNewCard(for: accountInProcess, accountNum: accountNumber)
                     print("Card Created successfully")
                    }
                 case 3 :
                    inputAccountNumber()
                    getAccountNumber()
                     transactionProcess()
                 case 4:
                     print("Redirecting you to main menu...")
                 case 5 :
                     print("Thank you for choosing our service!")
                     exit(0)
                 default:
                     print("Enter correct choice !!")
                 }
             }
             else {
                 print("Invalid choice!")
             }
         }
     }

     func transactionProcess() {
        var mychoice = 0
         while !(mychoice==4) {
             //MARK: - check for min balance of $100
             
             if (hasMinimumBalance(account: accountNumber)) {
                 print(" 1. Withdraw \n 2. Deposit \n 3. Show \n 4. Main menu \n 5.Quit")
                 print("Please enter a choice : ")
                 let str = readLine()
                 if let input = str, let ch = Int(input) {
                     mychoice = ch
                     switch(mychoice) {
                     case 1 :
                         print("Enter amount : ")
                         let amount = readLine()
                         withdraw(amount: (Double(amount!)) ?? 0.0, in: accountNumber)
                     case 2 :
                         print("Enter amount : ")
                         let amount = readLine()
                         deposit(amount: (Double(amount!)) ?? 0.0, in: accountNumber)
                     case 3 :
                         showBalance(in: accountNumber)
                     case 4:
                        print("Redirecting you to main menu...")
                     case 5 :
                         print("Thank you for banking with us!")
                         exit(0)
                         
                     default:
                         print("Enter correct choice !!")
                     }
                 }
                 else {
                     print("Invalid choice!")
                 }
             }
             else {
                 print("Bank account has balance below 100, cannot do transactions.")
                 break
             }
         }
     }

}





















//var bankData = BankDatabase()
//var userAccountDetails : [String : [Int]] = [:]
//    func createAccount() {}
//    func createNewCard() {}
//
//
//    func saveAccountToUserDetails(newAccount : Account) {
//        var flag = 0
//        if userAccountDetails.isEmpty {
//            getAccountDetailsFromDB()
//        }
//        else {
//        for key in userAccountDetails.keys {
//            if key == newAccount.accountHolderName {
//                userAccountDetails[key]?.append(newAccount.accountNumber)
//                flag = 1
//            }
//        }
//            if flag == 0 {
//                userAccountDetails[newAccount.accountHolderName] = []
//                userAccountDetails[newAccount.accountHolderName]?.append(newAccount.accountNumber)
//            }
//        }
//    }
//    func getAccountDetailsFromDB() {
//        for acc in bankData.accountList {
//            if userAccountDetails.keys.contains(acc.accountHolderName) {
//
//                    userAccountDetails.updateValue([acc.accountNumber], forKey: acc.accountHolderName)
//
//            }
//            else {
//                userAccountDetails[acc.accountHolderName] = []
//            }
//        }
//    }
