//
//  ExplainerViewController.swift
//  Piano Notes
//
//  Created by Matvey on 3/19/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ExplainerViewController: UIViewController {
    
    var explainerStartIndex = 1
    var explainerEndIndex = 6
    var explainerCurrentIndex = 1
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var explainerImage: UIImageView!
    
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        segueToGame()
    }
    
    @IBOutlet weak var navTriangleLeft: UIButton!
    
    @IBOutlet weak var navTriangleRight: UIButton!
    
    @IBAction func navTriangleLeftPressed(_ sender: UIButton) {
        
        if explainerCurrentIndex > explainerStartIndex {
            
            explainerCurrentIndex -= 1
            explainerImage.image = UIImage(named: "explainer_\(explainerCurrentIndex)")
            
            if explainerStartIndex == 1 {
                
                navTriangleLeft.isEnabled = false
                
            }
            
            updateProgressBar()
            
        }
        
    }
    
    @IBAction func navTriangleRightPressed(_ sender: UIButton) {
        
        if explainerCurrentIndex < explainerEndIndex {
            
            explainerCurrentIndex += 1
            explainerImage.image = UIImage(named: "explainer_\(explainerCurrentIndex)")
            
            updateProgressBar()
            
        } else {
            
            segueToGame()
            
        }
        
        navTriangleLeft.isEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        switch currentGameType {
        case .noteNames:
            explainerStartIndex = 1
            explainerEndIndex = 6
        case .notesOnStaff:
            explainerStartIndex = 7
            explainerEndIndex = 9
        }
        
        explainerCurrentIndex = explainerStartIndex
        
        explainerImage.image = UIImage(named: "explainer_\(explainerCurrentIndex)")
        
        navTriangleLeft.isEnabled = false
        
        navTriangleLeft.setImage(UIImage(named: "nav_triangle_L_inactive"), for: UIControl.State.disabled)
        
        navTriangleRight.setImage(UIImage(named: "nav_triangle_R_normal"), for: UIControl.State.normal)
        
        updateProgressBar()
    }
    
    func segueToGame() {
        
        switch currentGameType {
        case .noteNames:
            explainersEnabledNoteNames = false
            performSegue(withIdentifier: "doneExplainingToNoteNames", sender: nil)
        case .notesOnStaff:
            explainersEnabledNotesOnStaff = false
            performSegue(withIdentifier: "doneExplainingToNotesOnStaff", sender: nil)
        }

    }
    
    func updateProgressBar() {
        var currentProgress = 0
        var progressBarEndIndex = 5
        
        switch currentGameType {
        case .noteNames:
            currentProgress = explainerCurrentIndex
            progressBarEndIndex = 6
        case .notesOnStaff:
            currentProgress = explainerCurrentIndex - 6
            progressBarEndIndex = 3
        }
        progressBar.setProgress(Float(currentProgress) / Float(progressBarEndIndex), animated: true)
    }

}
