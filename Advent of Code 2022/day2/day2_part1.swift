//
//  day2-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

//struct Shape {
//    var name: String
//    var code1: String
//    var code2: String
//    var pointValue: Int
//}
//
//let Shapes = [
//    Shape(name: "rock", code1: "A", code2: "X", pointValue: 1),
//    Shape(name: "paper", code1: "B", code2: "Y", pointValue: 2),
//    Shape(name: "scissors", code1: "C", code2: "Z", pointValue: 3)
//]

//enum code1: String {
//    case rock = "A"
//    case paper = "B"
//    case scissors = "C"
//}
//
//enum code2: String {
//    case rock = "X"
//    case paper = "Y"
//    case scissors = "Z"
//}
//
//enum points: Int {
//    case rock = 1
//    case paper
//    case scissors
//}

func day2_part1() {
    
    struct Shape {
        var name: String
        var beats: String
        var loses: String
        var points: Int
    }

    let shapesDict: [String: Shape] = [
        "X": Shape(name: "rock", beats: "C", loses: "B", points: 1),
        "Y": Shape(name: "paper", beats: "A", loses: "C", points: 2),
        "Z": Shape(name: "scissors", beats: "B", loses: "A", points: 3)
    ]

    var pointsTotal = 0

    func playGame(input: [String]) {
        let beats = shapesDict[input[1]]!.beats
        let loses = shapesDict[input[1]]!.loses
        var pointsThisRound = shapesDict[input[1]]!.points

        if input[0] == beats {
            //print("win!")
            pointsThisRound = pointsThisRound + 6
        } else if input[0] == loses {
            //print("loser!")
        } else {
            //print("draw!")
            pointsThisRound = pointsThisRound + 3
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
