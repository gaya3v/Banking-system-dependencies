//
//  MainController.swift
//  Banking sys
//
//  Created by Gayathri V on 25/07/21.
//

import Foundation

class MainController {
    let atmOperation = ATMOperation()
    var shoppingOperation = ShoppingOperation()
    var bankOperation = BankOperation()
    
    func startCustomerService() {
        
        while (true) {
            print(" 1. Bank Transaction \n 2. ATM Transaction \n 3. Shopping Payment Transaction \n 4. Quit")
            print("Please enter an option to begin service : ")
            let str = readLine()
            if let input = str , let choice = Int(input) {
                switch(choice) {
                case 1 :
                    print("Starting Bank Account services...")
                   bankOperation.performOperation()
                case 2 :
                    print("Starting ATM Transaction services...")
                    atmOperation.selectLocation()
                    atmOperation.performOperation()
                case 3 :
                    print("Starting Shopping Payment Transaction request...")
                    shoppingOperation.performOperation()
                case 4 :
                    print("Thank you for choosing our service")
                    exit(0)
                default:
                    print("Enter correct choice !!")
                }
            }
            else {
                print("Invalid input\n")
            }
        }
        
    }
    
    
}

