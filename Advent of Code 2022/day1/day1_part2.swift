//
//  day1-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

func day1_part2() {
    
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day1/day1_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
    let puzzleInput = directPuzzleInput!.components(separatedBy: "\n\n").map {
        $0.components(separatedBy: "\n").compactMap { Int($0) }
    }
    
    //print(puzzleInput)
    
    
    var elfCalsArray: [Int] = []
    var mostCalsElves: [Int] = []
    var mostCalsElvesCals: [Int] = []

    
    for elf in puzzleInput {
        
        var calTotal = 0
        for item in elf {
            calTotal = calTotal + item
        }
        elfCalsArray.append(calTotal)
        //print("elf #\(index + 1) has \(calTotal) calories")
    }
        
    for _ in 1...3 {
        let mostCals = elfCalsArray.max()!
        let mostCalsElf = elfCalsArray.firstIndex(of: mostCals)!
        mostCalsElves.append(mostCalsElf + 1)
        mostCalsElvesCals.append(mostCals)
        elfCalsArray[mostCalsElf] = 0
    }
    
print(mostCalsElves)
    print(mostCalsElvesCals.reduce(0, +))

}
