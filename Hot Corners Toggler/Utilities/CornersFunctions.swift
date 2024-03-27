//
//  CornersFunctions.swift
//  Hot Corners Toggler
//
//  Created by Niall Murphy on 22/03/2024.
//

func shellSetHotCorners(_ corners: String) -> Void {
    
    let cornersArray = corners.components(separatedBy: " ")
    runCommand("defaults write com.apple.dock wvous-tl-corner -int \(cornersArray[0])")
    runCommand("defaults write com.apple.dock wvous-tr-corner -int \(cornersArray[1])")
    runCommand("defaults write com.apple.dock wvous-bl-corner -int \(cornersArray[2])")
    runCommand("defaults write com.apple.dock wvous-br-corner -int \(cornersArray[3])")
    runCommand("killall Dock")
    
}

// Function to get current hot corners
func shellGetHotCorners() -> String {
    
    let tl = runCommandReturnOutput("defaults read com.apple.dock wvous-tl-corner")
    let tr = runCommandReturnOutput("defaults read com.apple.dock wvous-tr-corner")
    let bl = runCommandReturnOutput("defaults read com.apple.dock wvous-bl-corner")
    let br = runCommandReturnOutput("defaults read com.apple.dock wvous-br-corner")
    return "\(tl) \(tr) \(bl) \(br)"
    
}
