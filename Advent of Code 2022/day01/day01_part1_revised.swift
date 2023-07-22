//
//  day1-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

func day01_part1_revised() {
    
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day01/day01_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
   // print(puzzleInput)
    
    let lines = directPuzzleInput!.components(separatedBy: "\n\n")
    var maxCalories = 0
    for line in lines {
        let calories = line.components(separatedBy: "\n").compactMap({ Int($0) }).reduce(0, +)
        maxCalories = max(maxCalories, calories)
    }
    
    print("Elf carrying the most Calories: \(maxCalories)")

}
