//
//  day1-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

func day01_part1() {
    
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day01/day01_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
    let puzzleInput = directPuzzleInput!.components(separatedBy: "\n\n").map {
        $0.components(separatedBy: "\n").compactMap { Int($0) }
    }
    
    print(puzzleInput)
    
    var mostCalsElf: Int = -1
    var mostCals = 0
    
    for (index, elf) in puzzleInput.enumerated() {
        
        var calTotal = 0
        for item in elf {
            calTotal = calTotal + item
        }
        print("elf #\(index + 1) has \(calTotal) calories")
        if calTotal > mostCals {
            mostCals = calTotal
            mostCalsElf = index + 1
        }
    }
    
    print("elf #\(mostCalsElf) has the most at \(mostCals) calories")
    
}
