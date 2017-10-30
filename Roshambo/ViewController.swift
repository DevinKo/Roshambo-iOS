//
//  ViewController.swift
//  Roshambo
//
//  Created by Kevin Do on 10/26/17.
//  Copyright © 2017 Kevin Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Generate Opponent's Hand
    
    // Randomly generates an Int from 1 to 3
    // 1 = Rock, 2 = Paper, 3 = Scissors
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    // MARK: - Actions
    
    /**
     * User throws a rock. Segue done only by code
     */
    @IBAction func ThrowRock(_ sender: Any) {
        let controller: CodeOnlyViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "CodeOnlyViewController") as! CodeOnlyViewController
        
        controller.myValue = 1 // Player throwing rock
        controller.theirValue = randomDiceValue()
        
        present(controller, animated: true, completion: nil)
    }
    
    /**
     * User throws a paper. Segue done only by storyboard
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "throwSomething" {
            let controller = segue.destination as! CodeOnlyViewController
            
            controller.myValue = 2 // Player throwing paper
            controller.theirValue = randomDiceValue()
        }
    }
    
    // TODO: - Add code + storyboard segue
    /**
     * User throws scissors. Segue done by both code and storyboard
     */
    @IBAction func ThrowScissors(_ sender: Any) {
        let controller: CodeOnlyViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "CodeOnlyViewController") as! CodeOnlyViewController
        
        controller.myValue = 3 // Player throwing scissors
        controller.theirValue = randomDiceValue()
        
        present(controller, animated: true, completion: nil)
    }
}

