//
//  CommandsFunctions.swift
//  Hot Corners Toggler
//
//  Created by Niall Murphy on 22/03/2024.
//

import Foundation

func runCommand(_ command: String) -> Void {
    
    let task = Process()
    task.launchPath = "/bin/zsh"
    task.arguments = ["-c", command]
    task.launch()
    
}

func runCommandReturnOutput(_ command: String) -> String {
    
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-cl", command]
    task.launchPath = "/bin/zsh"
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    return output.trimmingCharacters(in: .whitespacesAndNewlines)
    
}
