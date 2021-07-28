//
//  TempDB.swift
//  banking program
//
//  Created by Gayathri V on 22/07/21.
//

import Foundation

class BankData {
   private var accountList : [Account] = [Account(accountNumber: 1234567890, accountHolderName: "Alex", balance: 2500.0,debitCard: [DebitCard(accNumber: 1234567890, cardNumber: 7890, cvvNumber: 212, cardExpiryDate: "2024/06", pinNumber: 180)]), Account(accountNumber: 9012345678, accountHolderName: "Ben", balance: 5600.0, debitCard: [DebitCard(accNumber: 9012345678, cardNumber: 6789, cvvNumber: 043, cardExpiryDate: "2027/05", pinNumber: 200), DebitCard(accNumber: 9012345678, cardNumber: 2741, cvvNumber: 655, cardExpiryDate: "2034/04", pinNumber: 555)]), Account(accountNumber: 5678901234, accountHolderName: "Charlie", balance: 1680.0, debitCard: [])]
    
    private var creditCardList : [CreditCard] = [CreditCard(cardNumber: 1234, cvvNumber: 123, cardExpiryDate: "2029/08", pinNumber: 102, creditLimit: 200000.0),
                CreditCard(cardNumber: 5678, cvvNumber: 435, cardExpiryDate: "2022/02", pinNumber: 877, creditLimit: 400000.0)]
    
    private var debitCardList : [DebitCard] = [DebitCard(accNumber: 1234567890, cardNumber: 7890, cvvNumber: 212, cardExpiryDate: "2024/06", pinNumber: 180),
        DebitCard(accNumber: 9012345678, cardNumber: 6789, cvvNumber: 043, cardExpiryDate: "2027/05", pinNumber: 200)]
    
    func getAccountList () -> [Account] {
        return accountList
    }
    
    func addAccountToList(newAccount: Account) {
        accountList.append(newAccount)
        debitCardList.append(contentsOf: newAccount.getDebitCardList())
    }
    func getCreditCardList () -> [CreditCard] {
        return creditCardList
    }
    func addCreditCardToList(newCreditCard: CreditCard) {
        creditCardList.append(newCreditCard)
    }
    func getDebitCardList () -> [DebitCard] {
        return debitCardList
    }
    func addDebitCardToList(newDebitCard: DebitCard, of account : Int) {
        debitCardList.append(newDebitCard)
        for element in accountList {
            if element.getAccountNumber() == account {
                element.addNewDebitCard(newCard: newDebitCard)
                break
            }
        }
    }
    func updateBalance(of account: Account, bal : Double) {
        for acc in accountList {
            if acc.getAccountNumber() == account.getAccountNumber() {
                acc.setNewBalance(newBal: bal)
            }
        }
        
    }
}
