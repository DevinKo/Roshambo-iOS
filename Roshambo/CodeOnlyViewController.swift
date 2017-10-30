//
//  CodeOnlyViewController.swift
//  Roshambo
//
//  Created by Kevin Do on 10/27/17.
//  Copyright © 2017 Kevin Do. All rights reserved.
//

import UIKit

// MARK: - CodeOnlyViewController: UIViewController

class CodeOnlyViewController: UIViewController {
    
    // MARK: - Properties
    
    var myValue: Int?
    var theirValue: Int?
    
    // MARK: Outlets
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        
        // The dice will only appear if firstValue and secondValue have been set
        if let myValue = self.myValue, let theirValue = self.theirValue {
            // Ties
            if myValue == 1 && theirValue == 1 {
                resultImage.image = UIImage(named: "itsATie")
                resultText.text = "Rock vs Rock. It's a Tie!"
            }
            else if myValue == 2 && theirValue == 2 {
                resultImage.image = UIImage(named: "itsATie")
                resultText.text = "Paper vs Paper. It's a Tie!"
            }
            else if myValue == 3 && theirValue == 3 {
                resultImage.image = UIImage(named: "itsATie")
                resultText.text = "Scissors vs Scissors. It's a Tie!"
            }
            
            // Wins against bot
            else if myValue == 1 && theirValue == 3 {
                resultImage.image = UIImage(named: "RockCrushesScissors")
                resultText.text = "Rock crushes Scissors. You Win!"
            }
            else if myValue == 2 && theirValue == 1 {
                resultImage.image = UIImage(named: "PaperCoversRock")
                resultText.text = "Paper covers Rock. You Win!"
            }
            else if myValue == 3 && theirValue == 2 {
                resultImage.image = UIImage(named: "ScissorsCutPaper")
                resultText.text = "Scissors cut Paper. You Win!"
            }
            
            // Loses against bot
            else if myValue == 1 && theirValue == 2 {
                resultImage.image = UIImage(named: "PaperCoversRock")
                resultText.text = "Paper covers Rock. You Lose!"
            }
            else if myValue == 2 && theirValue == 3 {
                resultImage.image = UIImage(named: "ScissorsCutPaper")
                resultText.text = "Scissors cut Paper. You Lose!"
            }
            else if myValue == 3 && theirValue == 1 {
                resultImage.image = UIImage(named: "RockCrushesScissors")
                resultText.text = "Rock crushes Scissors. You Lose!"
            }
            
        } else {
            self.resultImage.image = nil;
        }

        
        self.resultImage.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.resultImage.alpha = 1
        }
    }
    /**
     * Accepts a conditional Int, and returns an dice image, or nil
     */
    func imageForValue(_ value: Int?) -> UIImage? {
        return nil
    }
    
    // MARK: Actions
    /**
     * Dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
