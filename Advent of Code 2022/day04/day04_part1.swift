//
//  day04_part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/23/23.
//

import Foundation

func day04_part1() {
    
    // Find and format puzzle input
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day04/day04_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
    let puzzleInput = directPuzzleInput!.components(separatedBy: "\n").filter { !$0.isEmpty }.map { $0.components(separatedBy: ",").map { $0.components(separatedBy: "-")}}
    
    var count = 0
    
    for pair in puzzleInput {
        let elf1Range = Int(pair[0][0])!...Int(pair[0][1])!
        let elf2Range = Int(pair[1][0])!...Int(pair[1][1])!
        
        if (elf1Range.contains(elf2Range.lowerBound) && elf1Range.contains(elf2Range.upperBound)) || (elf2Range.contains(elf1Range.lowerBound) && elf2Range.contains(elf1Range.upperBound)) {
            count += 1
        }
                       
    }
    
    print(count)
}
