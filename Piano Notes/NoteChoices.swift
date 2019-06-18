//
//  NoteChoices.swift
//  Piano Notes
//
//  Created by Matvey on 4/29/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import Foundation

//struct NoteChoices {

var currentNoteChoices = [""]
var previousNoteChoices = [""]

let allNoteChoices = ["F#3", "G3", "G#3", "A3", "A#3", "B3", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5",  "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5"]

let onlyWhiteKeys = ["G3", "A3", "B3", "C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5", "G5", "A5"]

let onlyBlackKeys = ["F#3", "G#3", "A#3", "C#4", "D#4", "F#4", "G#4", "A#4", "C#5", "D#5", "F#5", "G#5", "A#5"]

let onlyCDE = ["C4", "D4", "E4", "C5", "D5", "E5"]

let onlyFGAB = ["G3", "A3", "B3", "F4", "G4", "A4", "B4", "F5", "G5", "A5"]

// IMPLEMENT WEIRD ENHARMONICS FOR LEVEL 6!
let onlyWeirdEnharmonics = ["B#3", "Cb4", "E#4", "Fb4", "B#4", "Cb5", "E#5", "Fb5"]

// FOR MODE B (NOTE NAMES)
let basicNoteNames = ["A", "B", "C", "D", "E", "F", "G"]
let basicNoteNamesOnlyCDE = ["C", "D", "E"]
let basicNoteNamesOnlyFGAB = ["F", "G", "A", "B"]
let basicNoteNamesOnlyWeirdEnharmonics = ["B", "C", "E", "F"]

// LARGE KEYBOARD -- DEAL WITH C4 AMBIGUITY!
let whiteNotesOnLargeKeyboard = ["C2", "D2", "E2", "F2", "G2", "A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4bass", "C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5", "G5", "A5", "B5", "C6"]

let blackNotesOnLargeKeyboard = ["C#2", "D#2", "F#2", "G#2", "A#2", "C#3", "D#3", "F#3", "G#3", "A#3", "C#4", "D#4", "F#4", "G#4", "A#4", "C#5", "D#5", "F#5", "G#5", "A#5", "C#6"]

let allNotesOnLargeKeyboard = ["C2", "C#2", "D2", "D#2", "E2", "F2", "F#2", "G2", "G#2", "A2", "A#2", "B2", "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5", "B5", "C6", "C#6"]

let onlyTrebleClefWhiteNotes = ["C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5", "G5", "A5", "B5", "C6"]
let onlyTrebleClefBlackNotes = ["C#4", "D#4", "F#4", "G#4", "A#4", "C#5", "D#5", "F#5", "G#5", "A#5", "C#6"]
let allTrebleClefNotes = ["C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5", "B5", "C6", "C#6"]
let onlyBassClefWhiteNotes = ["C2", "D2", "E2", "F2", "G2", "A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4bass"]
let onlyBassClefBlackNotes = ["C#2", "D#2", "F#2", "G#2", "A#2", "C#3", "D#3", "F#3", "G#3", "A#3", "C#4bass"]
let allBassClefNotes = ["C2", "C#2", "D2", "D#2", "E2", "F2", "F#2", "G2", "G#2", "A2", "A#2", "B2", "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C4bass", "C#4bass"]

let onlyGuideNotes = ["F3", "C4", "C4bass", "G4"]
let onlyMiddleCToTrebleG = ["C4", "D4", "E4", "F4", "G4"]
let onlyBassFToMiddleC = ["F3", "G3", "A3", "B3", "C4bass"]
let onlyBassFToTrebleG = ["F3", "G3", "A3", "B3", "C4bass", "C4", "D4", "E4", "F4", "G4"]


// treble clef mnemonics
let onlyFACE = ["F4", "A4", "C5", "E5"]
let onlyEGBDF = ["E4", "G4", "B4", "D5", "F5"]
let onlyTrebleClefMnemonics = ["E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5"]

// bass clef mnemonics
let onlyACEG = ["A2", "C3", "E3", "G3"]
let onlyGBDFA = ["G2", "B2", "D3", "F3", "A3"]
let onlyBassClefMnemonics = ["G2", "A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3"]

// all mnemonics
let allMnemonics = ["G2", "A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5"]



// LEVEL-RELATED SWITCHES
var allNoteChoicesEnabled = false
var onlyWhiteKeysEnabled = true
var onlyBlackKeysEnabled = false
var onlyCDEEnabled = false
var onlyFGABEnabled = false
var allAccidentalsEnabled = false // for notes on staff only, right?
var onlySharpsEnabled = false
var onlyFlatsEnabled = false
var onlyWeirdEnharmonicsEnabled = false
var weirdEnharmonicsEnabled = false

var randomNewNoteIndexUpperLimit = 0

func setToAllNoteChoices() {
    allNoteChoicesEnabled = true
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = true
    
    currentNoteChoices = allNoteChoices
    setRandomNewNoteUpperIndex()
}

func setToOnlyWhiteKeys() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = true
    onlyBlackKeysEnabled = false
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    currentNoteChoices = onlyWhiteKeys
    setRandomNewNoteUpperIndex()
}

func setToOnlyBlackKeys() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = true
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    currentNoteChoices = onlyBlackKeys
    setRandomNewNoteUpperIndex()
}

func setToOnlyCDE() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false
    onlyCDEEnabled = true
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    currentNoteChoices = onlyCDE
    setRandomNewNoteUpperIndex()
}

func setToOnlyFGAB() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false
    onlyCDEEnabled = false
    onlyFGABEnabled = true
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    currentNoteChoices = onlyFGAB
    setRandomNewNoteUpperIndex()
}

func setToOnlySharps() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false // CONFIRM THIS IS CORRECT!
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = true
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    // HOW TO DIFFERENTIATE BETWEEN SHARPS & FLATS
    
    currentNoteChoices = onlyBlackKeys
    setRandomNewNoteUpperIndex()
}

func setToOnlyFlats() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false // CONFIRM THIS IS CORRECT!
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = true
    onlyWeirdEnharmonicsEnabled = false
    weirdEnharmonicsEnabled = false
    
    // HOW TO DIFFERENTIATE BETWEEN SHARPS & FLATS
    
    currentNoteChoices = onlyBlackKeys
    setRandomNewNoteUpperIndex()
}

func setToOnlyWeirdEnharmonics() {
    allNoteChoicesEnabled = false
    onlyWhiteKeysEnabled = false
    onlyBlackKeysEnabled = false
    onlyCDEEnabled = false
    onlyFGABEnabled = false
    onlySharpsEnabled = false
    onlyFlatsEnabled = false
    onlyWeirdEnharmonicsEnabled = true
    weirdEnharmonicsEnabled = true
    
    currentNoteChoices = onlyWeirdEnharmonics
    setRandomNewNoteUpperIndex()
}



// TODO: - FIGURE OUT NOTE CHOICE LOGIC
func setToOnlyGuideNotes() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = onlyGuideNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyMnemonics() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = allMnemonics
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyTrebleClef() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = allTrebleClefNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyTrebleClefWhiteKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = onlyTrebleClefWhiteNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyTrebleClefBlackKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = onlyTrebleClefBlackNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyBassClef() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = allBassClefNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyBassClefWhiteKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = onlyBassClefWhiteNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToOnlyBassClefBlackKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = onlyBassClefBlackNotes
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

// TODO: - allow user to flip back and forth between previous choice and all white keys
func setToAllWhiteKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = whiteNotesOnLargeKeyboard
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToAllBlackKeys() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = blackNotesOnLargeKeyboard
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToAllNotes() {
    previousNoteChoices = currentNoteChoices
    currentNoteChoices = allNotesOnLargeKeyboard
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}

func setToPreviousNoteChoices() {
    currentNoteChoices = previousNoteChoices
    setRandomNewNoteUpperIndex()
    updateNoteIndices()
}


func setRandomNewNoteUpperIndex() {
    randomNewNoteIndexUpperLimit = currentNoteChoices.count - 1
    print("randomNewNoteIndexUpperLimit: \(randomNewNoteIndexUpperLimit)")
}

var lastRandomNumber: Int = -1
var randomNewNoteIndex = Int.random(in: 0...15)

func generateNewRandomNoteIndex() {
    randomNewNoteIndex = Int.random(in: 0...randomNewNoteIndexUpperLimit)
    
    while randomNewNoteIndex == lastRandomNumber {
        randomNewNoteIndex = Int.random(in: 0...randomNewNoteIndexUpperLimit)
    }
}

var currentNoteOnStaffIndex = 15

var lowNoteIndex = 0
var highNoteIndex = whiteNotesOnLargeKeyboard.count - 1

func updateNoteIndices() {
    // TODO: - INVESTIGATE
    if currentNoteChoices[0].contains("#") || (currentNoteChoices.last?.contains("#"))! {
        
        var tempLowIndexNote = currentNoteChoices[0]
        tempLowIndexNote = tempLowIndexNote.replacingOccurrences(of: "#", with: "")
        var tempHighIndexNote = currentNoteChoices.last
        tempHighIndexNote = tempHighIndexNote!.replacingOccurrences(of: "#", with: "")
        
        lowNoteIndex = whiteNotesOnLargeKeyboard.firstIndex(of: tempLowIndexNote)!
        highNoteIndex = whiteNotesOnLargeKeyboard.firstIndex(of: tempHighIndexNote!)!
        
        
    } else {
    
        lowNoteIndex = whiteNotesOnLargeKeyboard.firstIndex(of: currentNoteChoices[0]) ?? allNotesOnLargeKeyboard.firstIndex(of: currentNoteChoices[0]) ?? 0
        highNoteIndex = whiteNotesOnLargeKeyboard.firstIndex(of: currentNoteChoices.last!) ?? 29
    }
    
    print("highNoteIndex in viewDidAppear: \(highNoteIndex)")
    print("lowNoteIndex in viewDidAppear: \(lowNoteIndex)")

}
