import Foundation
import SwiftData

func createDefaultFiles() {

    if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("enabled.txt").path) {
        saveIsEnabledToFile(true)
    }
    
    if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("data.txt").path) {
        saveCornersToFile("0 0 0 0")
    }
    
    for i in 1...3 {
        if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("preset\(i).txt").path) {
            savePresetToFile(i, "0 0 0 0")
        }
        if !FileManager.default.fileExists(atPath: Bundle.main.resourceURL!.appendingPathComponent("presetName\(i).txt").path) {
            savePresetNameToFile(i, "Preset \(i)")
        }
    }
}

func saveIsEnabledToFile(_ enabled: Bool) {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("enabled.txt")
    
    do {
        try String(enabled).write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving enabled to file: \(error)")
    }
    
}

func readEnabledFromFile() -> Bool? {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return nil
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("enabled.txt")
    
    do {
        let fileContents = try String(contentsOf: fileURL)
        return Bool(fileContents)
    } catch {
        print("Error reading enabled from file: \(error)")
        return nil
    }
    
}

func saveCornersToFile(_ string: String) {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("corners.txt")
    
    do {
        try string.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving string to file: \(error)")
    }
    
}

func readCornersFromFile() -> String? {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return "Error: Couldn't find the app's Resources directory."
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("corners.txt")
    
    do {
        let fileContents = try String(contentsOf: fileURL)
        print(fileContents)
        return fileContents
    } catch {
        print("Error reading string from file: \(error)")
        return nil
    }
    
}

func savePresetToFile(_ preset: Int, _ string: String) {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("preset\(preset).txt")
    
    do {
        try string.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving preset to file: \(error)")
    }
    
}

func readPresetFromFile(_ preset: Int) -> String? {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return nil
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("preset\(preset).txt")
    
    do {
        let fileContents = try String(contentsOf: fileURL)
        return fileContents
    } catch {
        print("Error reading preset from file: \(error)")
        return nil
    }
    
}

func savePresetNameToFile(_ preset: Int, _ name: String) {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("presetName\(preset).txt")
    
    do {
        try name.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error saving preset name to file: \(error)")
    }
    
}

func readPresetNameFromFile(_ preset: Int) -> String? {
    
    guard let resourcesDirectory = Bundle.main.resourceURL else {
        print("Error: Couldn't find the app's Resources directory.")
        return nil
    }
    
    let fileURL = resourcesDirectory.appendingPathComponent("presetName\(preset).txt")
    
    do {
        let fileContents = try String(contentsOf: fileURL)
        return fileContents
    } catch {
        print("Error reading preset name from file: \(error)")
        return nil
    }
    
}
