//
//  Hot_Corners_TogglerApp.swift
//  Hot Corners Toggler
//
//  Created by Niall Murphy on 20/03/2024.
//

import SwiftUI
import LaunchAtLogin

@main struct Hot_Corners_TogglerApp: App {
    
    @State private var enabled: Bool
    
    var body: some Scene {
        
        MenuBarExtra("Hot Corners Toggler", systemImage: enabled ? "camera.metering.center.weighted.average": "rectangle") {
            
            if enabled {
                Button("Disable Hot Corners") {
                    disable()
                }
            } else {
                Button("Enable Hot Corners") {
                    enable()
                }
            }
            
            Divider()
            
            LaunchAtLogin.Toggle("Launch at login")
            
            Divider()
            
            Button("Exit") { NSApplication.shared.terminate(nil) }
            
        }
        
    }
    
    func enable() {
        saveIsEnabledToFile(true)
        enabled = true
        shellSetHotCorners(readCornersFromFile() ?? "0 0 0 0")
    }
    
    func disable() {
        saveCornersToFile(shellGetHotCorners())
        saveIsEnabledToFile(false)
        enabled = false
        shellSetHotCorners("0 0 0 0")
    }
    
    init() {
        createDefaultFiles()
        enabled = readEnabledFromFile() ?? true
    }
    
}
