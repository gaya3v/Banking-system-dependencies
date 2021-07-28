//
//  AppDelegate.swift
//  Banking sys
//
//  Created by Gayathri V on 22/07/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Welcome to HDFC Bank \n")
        let ctrl = MainController()
        ctrl.startCustomerService()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
