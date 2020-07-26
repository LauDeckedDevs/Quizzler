//
//  Question.swift
//  Quizzler
//
//  Created by Laura Garcia Cano on 26/07/2020.
//  Copyright © 2020 LauDecked Devs. All rights reserved.
//

import Foundation

class Question {
    
    //MARK: - Properties
    
    let questionText: String
    let answer: Bool
    
    //MARK: - Initializer
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
