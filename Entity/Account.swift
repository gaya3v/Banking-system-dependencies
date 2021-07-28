//
//  Account.swift
//  Banking sys
//
//  Created by Gayathri V on 23/07/21.
//

import Foundation

class Account  {
    private var accountNumber : Int
    private var accountHolderName : String
    private var balance : Double
    private var debitCard : [DebitCard]
    
    init (accountNumber : Int, accountHolderName : String, balance : Double, debitCard : [DebitCard]) {
        self.accountNumber = accountNumber
        self.accountHolderName = accountHolderName
        self.balance = balance
        self.debitCard = debitCard
    }
    func getAccountNumber() -> Int {
        return accountNumber
    }
    func setAccountNumber(newAccNum : Int) {
        accountNumber = newAccNum
    }
    func getAccountHolderName() -> String {
        return self.accountHolderName
    }
    func setAccountHolderName(newUser : String) {
        self.accountHolderName = newUser
    }
    func getBalance() -> Double {
        return self.balance
    }
    func setNewBalance(newBal : Double) {
        balance = newBal
    }
    func getDebitCardList() -> [DebitCard] {
        return self.debitCard
    }
    func addNewDebitCard(newCard : DebitCard) {
        debitCard.append(newCard)
    }
}
