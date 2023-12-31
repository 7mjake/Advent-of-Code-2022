//
//  GetInput.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/25/23.
//

import Foundation

func getInput(filename: String) -> String {
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent(filename)
    
    return try! String(contentsOf: filePath, encoding: .utf8)
}
