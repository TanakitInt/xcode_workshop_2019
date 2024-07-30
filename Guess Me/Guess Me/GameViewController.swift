//
//  GameViewController.swift
//  Guess Me
//
//  Created by Patcharapon Joksamut on 15/3/2562 BE.
//  Copyright © 2562 apple. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{
    
    //initial varible from UI
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    let imageArray = [#imageLiteral(resourceName: "duck"), #imageLiteral(resourceName: "cat"), #imageLiteral(resourceName: "ant"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "bee")]
    let answerArray = ["duck", "cat", "ant", "dog", "bee"]
    
    
    var turns = 5
    
    var currentIndex = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.image = imageArray[0]
        answerTextField.placeholder = String(repeating: "- ", count: answerArray[0].count)
    }

    @IBAction func didTapSubmit(_ sender: Any)
    {
        let answer = answerArray[currentIndex]
        let userAnswer = answerTextField.text!.lowercased()
        
        if answer == userAnswer
            {
                correct()
            }
        else
            {
                wrong()
            }
    }
    
        func correct()
        {
            incorrectLabel.isHidden = true
            answerTextField.text = ""
            currentIndex = currentIndex + 1
                if currentIndex == imageArray.count
                {
                    //win condition
                    let alert = UIAlertController(title: "You win!", message: "GJ Bobo", preferredStyle : .alert)
                    
                    let action = UIAlertAction(title: "K close it", style: .default)
                        
                    //close the game seesion when win
                        {
                            (_) in self.dismiss(animated: true, completion: nil)
                        }
                
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                    //not win yet
                {
                imageView.image = imageArray[currentIndex]
                
                    //placeholder
                answerTextField.placeholder = String(repeating: "- ", count: answerArray[currentIndex].count)

                    
                }
        }
    
        func wrong()
        {
            answerTextField.text = ""
            incorrectLabel.text = "wrong answer"
            incorrectLabel.isHidden = false
            turns = turns - 1
            turnsCheck()
        }
    
        func turnsCheck()
        {
            if turns <= 0
            {
                let alert = UIAlertController(title: "You lose!", message: "Nooooooo", preferredStyle : .alert)
                
                let action = UIAlertAction(title: "K close it", style: .default)
                    
                    //close the game seesion when win
                {
                    (_) in self.dismiss(animated: true, completion: nil)
                }
                
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                //do nothing
            }
        }
}

    

    

