//
//  NotesOnStaffViewController.swift
//  Piano Notes
//
//  Created by Matvey on 5/15/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit
import AVFoundation

class NotesOnStaffViewController: UIViewController {
    
    
    @IBOutlet weak var noteOnStaffImage: UIImageView!
    
    @IBOutlet weak var accidentalsButtonsOutlet: UIStackView!
    
    @IBOutlet weak var arrowAndCheckButtonsOutlet: UIStackView!
    
    @IBOutlet weak var topLabelOutlet: UIImageView!
    
    @IBOutlet weak var pianoNoteDisplayed: UIImageView!
    
    var currentNoteOnStaffImageName = ""
    
    @IBOutlet var panGestureRecognizerOutlet: UIPanGestureRecognizer!
    
    @IBOutlet var keyButtonsOutletCollection: [UIButton]!
    
    @IBAction func keyButtonTouchUpInside(_ sender: UIButton) {
        print("\(sender.tag): \(allNotesOnLargeKeyboard[sender.tag])")
    }
    
    @IBAction func keyButtonTouchDown(_ sender: UIButton) {
    }
    
    
    @IBAction func keyButtonDraggedOutside(_ sender: UIButton) {
    }
    
    @IBAction func sharpButtonPressed(_ sender: UIButton) {
        
        let currentNoteOnStaffImageNameSecondToLastCharacter = currentNoteOnStaffImageName[currentNoteOnStaffImageName.index(currentNoteOnStaffImageName.endIndex, offsetBy: -2)]
        
        print("currentNoteOnStaffImageName: \(currentNoteOnStaffImageName), currentNoteOnStaffImageNameSecondToLastCharacter: \(currentNoteOnStaffImageNameSecondToLastCharacter)")
        
        if  currentAccidental == .neither {
            
            currentAccidental = .sharp
            
            currentNoteOnStaffImageName.insert("#", at: currentNoteOnStaffImageName.index(currentNoteOnStaffImageName.endIndex, offsetBy: -1))
            
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
            
        } else if currentAccidental == .flat {
            
            currentAccidental = .sharp
            
            currentNoteOnStaffImageName = currentNoteOnStaffImageName.replacingOccurrences(of: "b", with: "#")
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
        }
        
    }
    
    @IBAction func naturalButtonPressed(_ sender: UIButton) {
        
        let currentNoteOnStaffImageNameSecondToLastCharacter = currentNoteOnStaffImageName[currentNoteOnStaffImageName.index(currentNoteOnStaffImageName.endIndex, offsetBy: -2)]
        
        print("currentNoteOnStaffImageName: \(currentNoteOnStaffImageName), currentNoteOnStaffImageNameSecondToLastCharacter: \(currentNoteOnStaffImageNameSecondToLastCharacter)")
        
        if currentAccidental == .sharp {
            currentNoteOnStaffImageName = currentNoteOnStaffImageName.replacingOccurrences(of: "#", with: "")
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
            currentAccidental = .neither
        } else if currentAccidental == .flat {
            currentNoteOnStaffImageName = currentNoteOnStaffImageName.replacingOccurrences(of: "b", with: "")
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
            currentAccidental = .neither
        }
        
    }
    
    @IBAction func flatButtonPressed(_ sender: UIButton) {
        
        let currentNoteOnStaffImageNameSecondToLastCharacter = currentNoteOnStaffImageName[currentNoteOnStaffImageName.index(currentNoteOnStaffImageName.endIndex, offsetBy: -2)]
        
        print("currentNoteOnStaffImageName: \(currentNoteOnStaffImageName), currentNoteOnStaffImageNameSecondToLastCharacter: \(currentNoteOnStaffImageNameSecondToLastCharacter)")
        
        if  currentAccidental == .neither {
            
            currentAccidental = .flat
            
            currentNoteOnStaffImageName.insert("b", at: currentNoteOnStaffImageName.index(currentNoteOnStaffImageName.endIndex, offsetBy: -1))
            
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
            
        } else if currentAccidental == .sharp {
            
            currentAccidental = .flat
            
            currentNoteOnStaffImageName = currentNoteOnStaffImageName.replacingOccurrences(of: "#", with: "b")
            updateNoteOnStaffImage(optionalImageName: currentNoteOnStaffImageName)
        }
        
    }
    
    @IBAction func upArrowButtonPressed(_ sender: UIButton) {
        if currentNoteOnStaffIndex < whiteNotesOnLargeKeyboard.count - 1 {
            currentNoteOnStaffIndex += 1
            updateNoteOnStaffImage(optionalImageName: nil)
            currentAccidental = .neither
        }
    }
    
    @IBOutlet weak var checkButtonOutlet: UIButton!
    
    var userAnswer = ""
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        userAnswer = currentNoteOnStaffImageName
        print("userAnswer: \(userAnswer)")
        checkAnswer()
        
        // generate new note; be sure to reset the accidental!
    }
    
    @IBAction func downArrowButtonPressed(_ sender: UIButton) {
        if currentNoteOnStaffIndex > 0 {
            currentNoteOnStaffIndex -= 1
            updateNoteOnStaffImage(optionalImageName: nil)
            currentAccidental = .neither
        }
    }
    

    // placeholder variables for comparing answers
    var currentCorrectAnswer = ""
    var currentUserAnswer = ""

    // do I need this?
//    // placeholder for current note
//    var currentNote = ""
    
    @IBOutlet weak var scoreLabelOutlet: UILabel!
    
    @IBOutlet weak var starsImageOutlet: UIImageView!
    
    // MARK: - MENU
    
    @IBOutlet weak var menuButtonOutlet: UIButton!
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        
        menuIsClosed ? openMenu() : closeMenu()
        
    }
    
    @IBOutlet weak var menuContainerOutlet: UIView!
    
    @IBOutlet weak var menuTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var darkOverlayOutlet: UIButton!
    
    @IBAction func darkOverlayTapped(_ sender: UIButton) {
        closeMenu()
    }
    
    // MARK: - MENU ITEMS
    
    // TODO: change the top label, and change its size as well? or re-implement using an actual label?
    
    @IBAction func modeSegmentedControl(_ sender: UISegmentedControl) {
        
        let labelScaleMultiplier = 1.0
        let labelScaleMultiplierBackToNormal = 1.1

        switch currentGameMode {
        case .A:
            print("switching to mode B")
            currentGameMode = .B
            
            accidentalsButtonsOutlet.alpha = 0
            arrowAndCheckButtonsOutlet.alpha = 0
            
//            includeEnharmonicsSwitchOutlet.isEnabled = true
            topLabelOutlet.image = UIImage(named: "tap_the_correct_key")
            topLabelOutlet.transform = CGAffineTransform(scaleX: CGFloat(labelScaleMultiplier), y: CGFloat(labelScaleMultiplier))
        case .B:
            print("switching to mode A")
            currentGameMode = .A
            
            accidentalsButtonsOutlet.alpha = 1
            arrowAndCheckButtonsOutlet.alpha = 1
//            includeEnharmonicsSwitchOutlet.isEnabled = false
            topLabelOutlet.image = UIImage(named: "choose_the_correct_note_on_staff")
            topLabelOutlet.transform = CGAffineTransform(scaleX: CGFloat(labelScaleMultiplierBackToNormal ), y: CGFloat(labelScaleMultiplierBackToNormal))
            //            topLabelOutlet.frame.width
        }
        
//        startNewRound()
    }
    
    
    @IBOutlet weak var enableAccidentalsSwitchOutlet: UISwitch!
    
    @IBAction func enableAccidentalsSwitchFlipped(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var accidentalsSegmentedControlOutlet: UISegmentedControl!
    
    
    @IBAction func accidentalsSegmentedControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func onlyTrebleClefSwitchFlipped(_ sender: UISwitch) {
//        if !sender.isOn {
//            setToOnlyMnemonics()
//        } else {
//            //
//        }
//        currentNoteChoices = allTrebleClefNotes
//        updateNoteIndices()
//        onlyBassClefSwitchOutlet.isOn = false
    }
    
    @IBOutlet weak var onlyTrebleClefSwitchOutlet: UISwitch!
    
    @IBAction func onlyTrebleClefSegmentedControl(_ sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var onlyTrebleClefSegmentedControlOutlet: UISegmentedControl!
    
    @IBAction func onlyBassClefSwitchFlipped(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var onlyBassClefSwitchOutlet: UISwitch!
    
    @IBAction func onlyBassClefSegmentedControl(_ sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var onlyBassClefSegmentedControlOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var noteRangeLowNoteImage: UIImageView!
    
    @IBOutlet weak var noteRangeHighNoteImage: UIImageView!

    
    @IBAction func noteRangeLowNoteUp(_ sender: UIButton) {
    }
    
    @IBAction func noteRangeLowNoteDown(_ sender: UIButton) {
    }
    
    @IBAction func noteRangeHighNoteUp(_ sender: UIButton) {
    }
    
    @IBAction func noteRangeHighNoteDown(_ sender: UIButton) {
    }
    
    @IBAction func onlyGuideNotesSwitchFlipped(_ sender: UISwitch) {
        if !sender.isOn {
            setToOnlyGuideNotes()
        } else {
            setToPreviousNoteChoices()
        }
    }
    
    @IBOutlet weak var onlyGuideNotesSwitchOutlet: UISwitch!
    
    
    @IBAction func onlyMnemonicsSwitchFlipped(_ sender: UISwitch) {
        if !sender.isOn {
            setToOnlyMnemonics()
        } else {
            setToPreviousNoteChoices()
        }
    }
    
    @IBOutlet weak var onlyMnemonicsSwitchOutlet: UISwitch!
    
//    @IBAction func onlyMnemonicsSegmentedControl(_ sender: UISegmentedControl) {
//    }
//    
//    @IBOutlet weak var onlyMnemonicsSegmentedControlOutlet: UISegmentedControl!
    
    @IBAction func enableSoundsSwitchFlipped(_ sender: UISwitch) {
        if !sender.isOn {
            soundsEnabled = false
        } else {
            soundsEnabled = true
        }
    }
    
    @IBOutlet weak var enableSoundsSwitchOutlet: UISwitch!
    
    
    @IBAction func reEnableExplainersSwitchFlipped(_ sender: UISwitch) {
        if !sender.isOn {
            explainersEnabled = false
        } else {
            explainersEnabled = true
        }
    }
    
    var noteRangeImageHeight: Double = 0
    var noteRangeImageLocationAdjustment: Double = 0
    var noteRangeLocationFactor: Double = 0
    
    // REFACTOR SOME (MOST?) OF THIS TO viewDidAppear() ?!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let angleIncrement = 0.001
        
        keyButtonsOutletCollection.sort(by: {$0.tag < $1.tag})

        
        for index in (0...24).reversed() {
            keyButtonsOutletCollection[index].transform = CGAffineTransform(rotationAngle: CGFloat(Double(24 - index) * angleIncrement))
            keyButtonsOutletCollection[49 - index].transform = CGAffineTransform(rotationAngle: CGFloat(Double(24 - index) * -angleIncrement))
        }
        
        pianoNoteDisplayed.alpha = 1
        
        currentAccidental = .neither
        updateNoteOnStaffImage(optionalImageName: nil)
        
        
        
        scoreLabelOutlet.text = "0"
        
        menuContainerOutlet.alpha = 0
        menuTrailingConstraint.constant = 460
        
        noteRangeImageHeight = Double(noteRangeLowNoteImage.bounds.height)
        noteRangeLocationFactor = 0.8 * (noteRangeImageHeight) / Double(whiteNotesOnLargeKeyboard.count)
        noteRangeImageLocationAdjustment = 0.09 * noteRangeImageHeight
        
        // TODO: - Change this depending on level
//        currentNoteChoices = allNotesOnLargeKeyboard
//        setRandomNewNoteUpperIndex()
    }
    
    var lowNoteIndex = 0
    var highNoteIndex = whiteNotesOnLargeKeyboard.count - 1
    
    override func viewDidAppear(_ animated: Bool) {
        currentNoteChoices = Level.currentLevel.noteChoices
        
        print("currentNoteChoices: \(currentNoteChoices)")
        setRandomNewNoteUpperIndex()
        
        updateNoteIndices()
        generateNewNote()
        
        noteRangeLowNoteImage.image = UIImage(named: "staff\(whiteNotesOnLargeKeyboard[lowNoteIndex])")
        noteRangeHighNoteImage.image = UIImage(named: "staff\(whiteNotesOnLargeKeyboard[highNoteIndex])")
    }
    
    var locationTracker: Double = Double(whiteNotesOnLargeKeyboard.count / 2) {
        didSet {
            currentNoteOnStaffIndex = Int(round(locationTracker))
            updateNoteOnStaffImage(optionalImageName: nil)
            currentAccidental = .neither
        }
    }
    
    func updateNoteOnStaffImage(optionalImageName: String?) {
        if let imageName = optionalImageName {
            noteOnStaffImage.image = UIImage(named: imageName)
        } else {
            currentNoteOnStaffImageName = "staff\(whiteNotesOnLargeKeyboard[currentNoteOnStaffIndex])"
            noteOnStaffImage.image = UIImage(named: currentNoteOnStaffImageName)
        }
        print("currentNoteOnStaffImageName: \(currentNoteOnStaffImageName)")
        print("locationTracker: \(locationTracker)")
        print("currentNoteIndex: \(currentNoteOnStaffIndex)")

    }
    
    // for keeping track of piano keys already tried
    var notesAlreadyAttempted = [String]()
    
    func checkAnswer() {
        
        print("currentNoteOnStaffImageName: \(currentNoteOnStaffImageName)")
        
        if currentCorrectAnswer == "C4bass" {
            currentCorrectAnswer = "C4"
        }
        
        print("going into checkAnswer, currentNoteOnStaffImageName is: \(currentNoteOnStaffImageName)")
        if currentNoteOnStaffImageName.hasSuffix("bass") {
            currentNoteOnStaffImageName.removeLast(4)
            print("and now, currentNoteOnStaffImageName is: \(currentNoteOnStaffImageName)")
        }
        
        currentUserAnswer = currentAccidental == .neither ? String(currentNoteOnStaffImageName.suffix(2)) : String(currentNoteOnStaffImageName.suffix(3))
        print("currentUserAnswer: \(currentUserAnswer)")
        
        let currentUserAnswerWithoutOctave = currentAccidental == .neither ? String(currentUserAnswer.prefix(1)) : String(currentUserAnswer.prefix(2))
        
        print("currentUserAnswerWithoutOctave: \(currentUserAnswerWithoutOctave)")
        
        
        
        var currentEnharmonic: String? = getEnharmonic(currentNote: currentUserAnswerWithoutOctave)
        
        if currentEnharmonic != nil {
            
            if currentUserAnswer == "B#2" ||
               currentUserAnswer == "B#3" ||
               currentUserAnswer == "B#4" ||
               currentUserAnswer == "B#5" {
                
                currentEnharmonic! += String(Int(currentUserAnswer.suffix(1))! + 1)

            } else if currentUserAnswer == "Cb3" ||
                      currentUserAnswer == "Cb4" ||
                      currentUserAnswer == "Cb5" ||
                      currentUserAnswer == "Cb6" {
                
                currentEnharmonic! += String(Int(currentUserAnswer.suffix(1))! - 1)
                
            } else {
            
                currentEnharmonic! += String(currentUserAnswer.suffix(1))
                
            }
            
        }
        
        print("currentCorrectAnswer: \(currentCorrectAnswer)")
        print("currentEnharmonic: \(currentEnharmonic)")
        print("currentUserAnswer: \(currentUserAnswer)")
        
        // RIGHT ANSWER
        if currentUserAnswer == currentCorrectAnswer || currentEnharmonic == currentCorrectAnswer {
            print("correct!")
            checkButtonOutlet.setImage(UIImage(named: "check_right"), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute:{
                self.checkButtonOutlet.setImage(UIImage(named: "check"), for: .normal)
                self.generateNewNote()
            })
            
            // play sound
            if soundsEnabled {
                
//                switch currentGameMode {
//                case .A: loadSound(currentSound: currentNote)
//                case .B: loadSound(currentSound: nameOfKeyToHighlight)
//                }
                
                loadSound(currentSound: "\(currentCorrectAnswer)")
                
                audioPlayer!.play()
                audioPlayer!.setVolume(0, fadeDuration: 2.5)
            }
            
            // update score
            totalScore += 1
            correctAnswersInARow += 1
            incorrectAnswersInARow = 0
            giveOrTakeAStar()
            starsImageOutlet.image = UIImage(named: "stars\(currentNumberOfStars)")
            
        // WRONG ANSWER
        } else {
            print("incorrect!")
            // play "wrong" sound
            if soundsEnabled {
                loadSound(currentSound: "wrong")
                audioPlayer!.play()
                audioPlayer!.setVolume(0.05, fadeDuration: 0)
            }
            checkButtonOutlet.setImage(UIImage(named: "check_wrong"), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute:{
                self.checkButtonOutlet.setImage(UIImage(named: "check"), for: .normal)
            })
            
            // subtract a point
            if totalScore > 0 {
                totalScore -= 1
            }
            
            // flash score label red #FF3939
            self.scoreLabelOutlet.textColor = UIColor(red:1.00, green:0.22, blue:0.22, alpha:1.0)
            // bring it back to green after a second
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute:{
                self.scoreLabelOutlet.textColor = UIColor(red:0.50, green:0.96, blue:0.00, alpha:1.0)
            })
            
            correctAnswersInARow = 0
            incorrectAnswersInARow += 1
            giveOrTakeAStar()
            starsImageOutlet.image = UIImage(named: "stars\(currentNumberOfStars)")
            
//            if !notesAlreadyAttempted.contains(nameOfKeyToHighlight) {
//
//                let wrongNoteImageName = "\(nameOfKeyToHighlight)_wrong"
//                let wrongNoteImage = UIImage(named: wrongNoteImageName)
//                let wrongNoteImageView = UIImageView(image: wrongNoteImage!)
//
//                wrongNoteImageView.translatesAutoresizingMaskIntoConstraints = false
//                pianoKeyImage.addSubview(wrongNoteImageView)
//
//                NSLayoutConstraint.activate([
//                    wrongNoteImageView.widthAnchor.constraint(equalToConstant: pianoKeyImage!.frame.width),
//                    wrongNoteImageView.heightAnchor.constraint(equalToConstant: pianoKeyImage!.frame.height),
//
//                    ])
//
//            }
//
//            notesAlreadyAttempted.append(nameOfKeyToHighlight)
            
        }
        
        scoreLabelOutlet.text = String(totalScore)

    }
    
//    var randomNewNoteIndex = 10
//    var lastRandomNumber = 10
    
    func generateNewNote() {
        
        // enable or disable buttons/keys depending on current game mode
//        switch currentGameMode {
//        case .A:
//            enableButtons()
//            enableSharps()
//            enableFlats()
//            disableWhiteKeyButtons()
//            disableBlackKeyButtons()
//        case .B:
//            disableButtons()
//            disableSharps()
//            disableFlats()
//            enableWhiteKeyButtons()
//            enableBlackKeyButtons()
//        }
        
        // remove notes marked wrong
//        if !notesAlreadyAttempted.isEmpty {
//            for subview in self.pianoKeyImage.subviews {
//                subview.removeFromSuperview()
//            }
//        }
        
//        notesAlreadyAttempted = [""]
        
//        if currentGameMode == .A {

        
        generateNewRandomNoteIndex()
        currentCorrectAnswer = currentNoteChoices[randomNewNoteIndex]
        print("currentNoteChoices[randomNewNoteIndex]: \(currentCorrectAnswer)")
        lastRandomNumber = randomNewNoteIndex
        
        if currentCorrectAnswer == "C4bass" {
            pianoNoteDisplayed.image = UIImage(named: "large_C4_shown")
        } else {
            pianoNoteDisplayed.image = UIImage(named: "large_\(currentCorrectAnswer)_shown")
        }
        
//        // remove notes marked wrong
//        if !notesAlreadyAttempted.isEmpty {
//            for subview in self.pianoKeyImage.subviews {
//                subview.removeFromSuperview()
//            }
//        }
//        
//        notesAlreadyAttempted = [""]
        
        
        
//
//            currentNote = currentNoteChoices[randomNewNoteIndex]
//            print("the current note is \(currentNote)")
//
//            let currentNoteNameLength = currentNote.count
//
//            // 3-character note names need to be converted to 2-character ones
//            // (because octave doesn't matter)
//            if currentNoteNameLength == 3 {
//                currentCorrectAnswer = String(currentNote[currentNote.startIndex...currentNote.index(after: currentNote.startIndex)])
//                //            print("currentCorrectAnswer when name length == 3: \(currentCorrectAnswer)")
//            } else {
//                currentCorrectAnswer = String(currentNote[currentNote.startIndex])
//                //            print("currentCorrectAnswer when name length == \(currentNoteNameLength): \(currentCorrectAnswer)")
//            }
//            //        currentCorrectAnswer = String(currentNote[currentNote.startIndex])
//            print("currentCorrectAnswer is \(currentCorrectAnswer)")
//
//            pianoKeyImage.image = UIImage(named: "\(currentNote)_shown")
//
//            // MODE B
//        } else {
//
//            pianoKeyImage.image = nil
//
//            var upperNoteChoiceLimit = 6
//
//            // LIMIT NUMBER OF NOTE CHOICES FOR NEW NOTE
//
//            switch currentNoteChoices {
//            case onlyCDE:
//                upperNoteChoiceLimit = 2
//            case onlyFGAB, onlyWeirdEnharmonics:
//                upperNoteChoiceLimit = 3
//            default: break
//            }
//
//            randomNewNoteIndex = Int.random(in: 0...upperNoteChoiceLimit)
//
//            while randomNewNoteIndex == lastRandomNumber {
//                randomNewNoteIndex = Int.random(in: 0...upperNoteChoiceLimit)
//            }
//
//            var accidentalOrNot: Accidentals = .neither
//
//            if allNoteChoicesEnabled {
//
//                accidentalOrNotIndex = Int.random(in: 0...2)
//
//                while accidentalOrNotIndex == lastAccidentalOrNotIndex {
//                    accidentalOrNotIndex = Int.random(in: 0...2)
//                }
//
//                accidentalOrNot = Accidentals.allCases[accidentalOrNotIndex]
//
//            } else if onlyBlackKeysEnabled {
//
//                accidentalOrNotIndex = Int.random(in: 0...1)
//
//                //                while accidentalOrNotIndex == lastAccidentalOrNotIndex {
//                //                    accidentalOrNotIndex = Int.random(in: 0...1)
//                //                }
//
//                accidentalOrNot = Accidentals.allCases[accidentalOrNotIndex]
//
//            } else if onlyWeirdEnharmonicsEnabled {
//
//                accidentalOrNotIndex = Int.random(in: 0...1)
//
//                // IF I LEFT THIS IN, IT WOULD JUST KEEP SWITCHING, RIGHT?
//                //                while accidentalOrNotIndex == lastAccidentalOrNotIndex {
//                //                    accidentalOrNotIndex = Int.random(in: 1...2)
//                //                }
//
//                accidentalOrNot = Accidentals.allCases[accidentalOrNotIndex]
//
//            } else if onlySharpsEnabled {
//
//                accidentalOrNot = .sharp
//
//            } else if onlyFlatsEnabled {
//
//                accidentalOrNot = .flat
//
//            }
//
//            // if noteChoices[1] == "#" (for only sharps) !
//
//            switch accidentalOrNot {
//            case .neither:
//                // NOT BASIC NOTE NAMES, BUT... ?
//                switch currentNoteChoices {
//                case onlyCDE:
//                    currentNote = basicNoteNamesOnlyCDE[randomNewNoteIndex]
//                case onlyFGAB:
//                    currentNote = basicNoteNamesOnlyFGAB[randomNewNoteIndex]
//                default:
//                    currentNote = basicNoteNames[randomNewNoteIndex]
//                }
//
//                currentAccidental = .neither
//            case .sharp:
//                currentNote = basicNoteNames[randomNewNoteIndex] + "#"
//
//                // generate new note if current note is a weird enharmonic
//                if !weirdEnharmonicsEnabled && (currentNote == "B#" || currentNote == "E#") {
//                    generateNewNote()
//                } else {
//                    sharpsOutletCollection[randomNewNoteIndex].setImage(UIImage(named: "sharp_shown"), for: UIControl.State.normal)
//                    currentAccidental = .sharp
//                }
//            case .flat:
//                currentNote = basicNoteNames[randomNewNoteIndex] + "b"
//
//                // generate new note if current note is a weird enharmonic
//                if !weirdEnharmonicsEnabled && (currentNote == "Cb" || currentNote == "Fb") {
//                    generateNewNote()
//                } else {
//                    flatsOutletCollection[randomNewNoteIndex].setImage(UIImage(named: "flat_shown"), for: UIControl.State.normal)
//                    currentAccidental = .flat
//                }
//            }
//
//
//            print("current note should be: \(currentNote)")
//
//            currentCorrectAnswer = currentNote
//
//            let currentNoteToShow = currentNote[currentNote.startIndex]
//            let currentNoteIndex = basicNoteNames.firstIndex(of: String(currentNoteToShow))!
//
//            let buttonImageName = "\(currentNoteToShow)_shown"
//            guard let image = UIImage(named: buttonImageName) else { return }
//            noteButtonsOutletCollection![currentNoteIndex].setImage(image, for: UIControl.State.normal)
//
//        }
//
//        lastRandomNumber = randomNewNoteIndex
//        lastAccidentalOrNotIndex = accidentalOrNotIndex
    }
    
    @IBAction func handleMainNotePanGesture(recognizer: UIPanGestureRecognizer) {
        
//        print(recognizer.velocity(in: self.view).y)
        
        if recognizer.velocity(in: self.view).y < 0 && Int(locationTracker) < whiteNotesOnLargeKeyboard.count - 1 {
//            print("panning up!")
            locationTracker += 0.17
            
            if recognizer.velocity(in: self.view).y < -150 && Int(locationTracker) < whiteNotesOnLargeKeyboard.count - 1 {
                locationTracker += 0.5
            }
        
        } else if recognizer.velocity(in: self.view).y > 0 && locationTracker > 0 {
            locationTracker -= 0.17
//            print("panning down!")
            
            if recognizer.velocity(in: self.view).y > 150 && locationTracker > 0 {
                locationTracker -= 0.5
            }
        }
        
    }
    
    @IBOutlet var noteRangeLowNotePanGestureOutlet: UIPanGestureRecognizer!
    
    @IBOutlet var noteRangeHighNotePanGestureOutlet: UIPanGestureRecognizer!
    
    
    
    @IBAction func handleLowNotePan(recognizer: UIPanGestureRecognizer) {
       
        print(recognizer.location(in: noteRangeLowNoteImage).y)
        
        lowNoteIndex = whiteNotesOnLargeKeyboard.count - Int((Double(recognizer.location(in: noteRangeLowNoteImage).y) - noteRangeImageLocationAdjustment) / noteRangeLocationFactor)
        
        print("lowNoteIndex in handleLowNotePan:\(lowNoteIndex)")
        
        if lowNoteIndex >= 0 && lowNoteIndex < whiteNotesOnLargeKeyboard.count && lowNoteIndex < highNoteIndex {
            noteRangeLowNoteImage.image = UIImage(named: "staff\(whiteNotesOnLargeKeyboard[lowNoteIndex])")
        }
        
        
    }
    
    
    @IBAction func handleHighNotePan(recognizer: UIPanGestureRecognizer) {
        print(recognizer.location(in: noteRangeLowNoteImage).y)
        
        highNoteIndex = whiteNotesOnLargeKeyboard.count - Int((Double(recognizer.location(in: noteRangeHighNoteImage).y) - noteRangeImageLocationAdjustment) / noteRangeLocationFactor)
        
        print("highNoteIndex in handleHighNotePan:\(highNoteIndex)")
        
        if highNoteIndex >= 0 && highNoteIndex < whiteNotesOnLargeKeyboard.count && highNoteIndex > lowNoteIndex {
            noteRangeHighNoteImage.image = UIImage(named: "staff\(whiteNotesOnLargeKeyboard[highNoteIndex])")
        }
    }
    
//    @IBAction func handleMenuLowNotePanGesture(_ sender: UIPanGestureRecognizer) {
//        print(sender.location(in: noteRangeLowNoteImage))
//    }
    
    
//    @IBAction func handleMenuHightNotePanGesture(_ sender: UIPanGestureRecognizer) {
//    }
    
    
    func loadSound(currentSound: String) {
        // sound file
        if let sound = Bundle.main.path(forResource: currentSound, ofType: "aiff") {
            
            do {
                // try to initialize with the URL created above
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                audioPlayer?.prepareToPlay()
            }
            catch {
                print(error)
            }
        } else {
            print("whoops, couldn't load the sound '\(currentSound)'")
        }
    }
    
}
