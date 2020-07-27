//
//  ViewController.swift
//  Quizzler
//
//  Created by Laura Garcia Cano on 26/07/2020.
//  Copyright © 2020 LauDecked Devs. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    //MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[questionNumber].questionText
        updateUI()
    }
    
    //MARK: - ButtonsProperties

    @IBAction func answerPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            pickedAnswer = true
        case 2:
            pickedAnswer = false
        default:
            print("error checking the answer")
        }
        updateUI()
        checkAnswer()
        nextQuestion()
    }
    
    //MARK: - UpdateUIFunction

    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) /13"
    }
    
    //MARK: - QuestionChanger

    func nextQuestion() {
        if questionNumber < allQuestions.list.count-1 {
            questionNumber += 1
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            
    //MARK: - FinishedQuizzAlert
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                let alert = UIAlertController(title: "The End", message: "You have finished the quizz, do you want to start over?", preferredStyle: .alert)
                let restartAction = UIAlertAction(title:"Restart", style: .default) { (UIAlertAction) in
                self.startOver()
                }
                alert.addAction(restartAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - AnswerChecker
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            score += 1
            ProgressHUD.colorAnimation = .green
            ProgressHUD.showSucceed()
        } else {
            ProgressHUD.colorAnimation = .red
            ProgressHUD.showFailed()
        }
    }

    //MARK: - RestartFunction
    
    func startOver() {
        score = 0
        questionNumber = 0
        viewDidLoad()
    }
}
