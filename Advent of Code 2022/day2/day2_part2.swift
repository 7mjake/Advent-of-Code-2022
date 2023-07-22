//
//  day2-part2.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation



func day2_part2() {
    
    struct Shape {
        var name: String
        var beats: String
        var loses: String
        var points: Int
    }

    let shapesDict: [String: Shape] = [
        "A": Shape(name: "rock", beats: "C", loses: "B", points: 1),
        "B": Shape(name: "paper", beats: "A", loses: "C", points: 2),
        "C": Shape(name: "scissors", beats: "B", loses: "A", points: 3)
    ]

    var pointsTotal = 0

    func playGame(input: [String]) {
        let beats = shapesDict[input[0]]!.beats
        let loses = shapesDict[input[0]]!.loses
        var pointsThisRound = 0
        var myChoice: String


        if input[1] == "X" {
            // LOSE
            myChoice = shapesDict[input[0]]!.beats
            pointsThisRound = shapesDict[myChoice]!.points
        } else if input[1] == "Y" {
            // DRAW
            myChoice = input[0]
            pointsThisRound = shapesDict[myChoice]!.points + 3
        } else if input[1] == "Z" {
            // WIN
            myChoice = shapesDict[input[0]]!.loses
            pointsThisRound = shapesDict[myChoice]!.points + 6
        }
        
        pointsTotal = pointsTotal + pointsThisRound
    }
    
    var directPuzzleInput: String? = nil // declaring puzzleInput here
    
    let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                      .appendingPathComponent("day2/day2_realInput.txt")
                        
    do {
        directPuzzleInput = try String(contentsOf: filePath, encoding: .utf8)
    } catch {
        print("Error: \(error)")
    }
    
    let puzzleInput = directPuzzleInput!.components(separatedBy: "\n").filter { !$0.isEmpty }.map {
        $0.components(separatedBy: " ")
    }
    
    for pairs in puzzleInput {
        playGame(input: pairs)
    }
    
    print(pointsTotal)
    
}
