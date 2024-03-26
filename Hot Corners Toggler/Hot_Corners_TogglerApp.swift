//
//  Hot_Corners_TogglerApp.swift
//  Hot Corners Toggler
//
//  Created by Niall Murphy on 20/03/2024.
//

import SwiftUI
import LaunchAtLogin

@main struct Hot_Corners_TogglerApp: App {
    
    @State private var command: String = "a"
    @State private var corners: String
    @State private var enabled: Bool
    @State private var icon: String
    
    var body: some Scene {
        
        MenuBarExtra(command, systemImage: icon) {
            
            if enabled {
                Button("Disable Hot Corners") {
                    saveStringToFile(getCurrentHotCorners())
                    disableHotCorners()
                    saveEnabledToFile(false)
                    enabled = false
                    icon = "rectangle"
                }
            } else {
                Button("Enable Hot Corners") {
                    enableHotCorners(readStringFromFile()!)
                    saveEnabledToFile(true)
                    enabled = true
                    icon = "camera.metering.center.weighted.average"
                }
            }
            
            Divider()
            
            LaunchAtLogin.Toggle("Launch at login")
            
            Divider()
            
            Button("Exit") { NSApplication.shared.terminate(nil) }
            
        }
        
    }
    
    init() {
        
        createDefaultFiles()
        
        if let corners = readStringFromFile() {
            self.corners = corners
        } else {
            self.corners = "0 0 0 0"
        }
        
        if let enabled = readEnabledFromFile() {
            self.enabled = enabled
            self.icon = enabled ? "camera.metering.center.weighted.average" : "rectangle"
        } else {
            self.enabled = true
            self.icon = "rectangle"
        }
        
    }
    
}


