//
//  FileFunctions.swift
//  Hot Corners Toggler
//
//  Created by Niall Murphy on 22/03/2024.
//

import Foundation
import SwiftData

// If first run or files deleted, create default files

func createDefaultFiles() {

    // If enabled.txt doesn't exist
    if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("enabled.txt").path) {
        saveEnabledToFile(true)
    }
    
    // If data.txt doesn't exist
    if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("data.txt").path) {
        saveStringToFile("0 0 0 0")
    }
    
}

// Save enabled boolean to enabled.txt
func saveEnabledToFile(_ enabled: Bool) {
    
    // Get the URL for the app's Resources directory
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    // Append the file name "enabled.txt" to the Resources directory URL
    let fileURL = resourcesDirectory.appendingPathComponent("enabled.txt")
    
    do {
        // Write the string to the file at the specified URL
        try String(enabled).write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving enabled to file: \(error)")
    }
}

// Read enabled boolean from enabled.txt
func readEnabledFromFile() -> Bool? {
    
    // Get the URL for the app's Resources directory
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return nil
    }
    
    // Append the file name "enabled.txt" to the Resources directory URL
    let fileURL = resourcesDirectory.appendingPathComponent("enabled.txt")
    
    do {
        // Read the contents of the file at the specified URL
        let fileContents = try String(contentsOf: fileURL)
        return Bool(fileContents)
    } catch {
        print("Error reading enabled from file: \(error)")
        return nil
    }
}

func saveStringToFile(_ string: String) {
    
    // Get the URL for the app's Resources directory
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    // Append the file name "default_data.txt" to the Resources directory URL
    let fileURL = resourcesDirectory.appendingPathComponent("data.txt")
    
    do {
        // Write the string to the file at the specified URL
        try string.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving string to file: \(error)")
    }
}

func readStringFromFile() -> String? {
    
    // Get the URL for the app's Resources directory
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return "Error: Couldn't find the app's Resources directory."
    }
    
    // Append the file name "default_data.txt" to the Resources directory URL
    let fileURL = resourcesDirectory.appendingPathComponent("data.txt")
    
    do {
        // Read the contents of the file at the specified URL
        let fileContents = try String(contentsOf: fileURL)
        print(fileContents)
        return fileContents
    } catch {
        print("Error reading string from file: \(error)")
        return nil
    }
}
