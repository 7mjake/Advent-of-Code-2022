//
//  day03_part2.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/23/23.
//

import Foundation

func day03_part2() {
    
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
    
    let chunkedInput = puzzleInput.chunked(into: 3)
    
    // Find matching items in each chunk
    var matchingItems = [String]()

    for group in chunkedInput {
        matchingItems.append(String(Set(group[0]).intersection(Set(group[1])).intersection(Set(group[2]))))
    }
    print (matchingItems)
    
    // calculate points
    let pointDictionary = Array("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
    var points = 0
    
    for item in matchingItems {
        points = points + pointDictionary.firstIndex(of: Character(item))!
    }

    print(points)
}

// Chunk arrays into "size"
extension Array {
    func chunked (into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
