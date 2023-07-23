//
//  day03_part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/23/23.
//

import Foundation

func day03_part1() {
    
    // Find and format puzzle input
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day03/day03_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
    let puzzleInput = directPuzzleInput!.components(separatedBy: "\n").filter { !$0.isEmpty }
        
    // Separate rucksacks into compartments and find matching elements
    var matchingItems = [String]()

    for rucksack in puzzleInput {
        let compartment1 = rucksack.prefix(rucksack.count / 2)
        let compartment2 = rucksack.suffix(rucksack.count / 2)
        matchingItems.append(String(Set(compartment1).intersection(Set(compartment2))))
    }
//    print (matchingItems)
    
    // calculate points
    let pointDictionary = Array("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
    var points = 0
    
    for item in matchingItems {
        points = points + pointDictionary.firstIndex(of: Character(item))!
    }

    print(points)
}
