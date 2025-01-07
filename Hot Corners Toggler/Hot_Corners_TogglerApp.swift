import SwiftUI
import LaunchAtLogin

@main struct Hot_Corners_TogglerApp: App {
    
    @State private var enabled: Bool
    @State private var presetNames: [String]
    @State private var currentPreset: Int
    
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
            
            TextField("Preset 1 Name", text: $presetNames[0])
            Button("Save Preset 1") {
                savePreset(1)
            }
            Button("Load Preset 1") {
                loadPreset(1)
            }
            
            TextField("Preset 2 Name", text: $presetNames[1])
            Button("Save Preset 2") {
                savePreset(2)
            }
            Button("Load Preset 2") {
                loadPreset(2)
            }
            
            TextField("Preset 3 Name", text: $presetNames[2])
            Button("Save Preset 3") {
                savePreset(3)
            }
            Button("Load Preset 3") {
                loadPreset(3)
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
        shellSetHotCorners(readPresetFromFile(currentPreset) ?? "0 0 0 0")
    }
    
    func disable() {
        savePreset(currentPreset)
        saveIsEnabledToFile(false)
        enabled = false
        shellSetHotCorners("0 0 0 0")
    }
    
    func savePreset(_ preset: Int) {
        savePresetToFile(preset, shellGetHotCorners())
        savePresetNameToFile(preset, presetNames[preset - 1])
    }
    
    func loadPreset(_ preset: Int) {
        currentPreset = preset
        shellSetHotCorners(readPresetFromFile(preset) ?? "0 0 0 0")
    }
    
    init() {
        createDefaultFiles()
        enabled = readEnabledFromFile() ?? true
        presetNames = (1...3).map { readPresetNameFromFile($0) ?? "Preset \($0)" }
        currentPreset = 1
    }
    
}
