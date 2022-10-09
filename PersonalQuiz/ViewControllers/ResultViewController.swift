//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    @IBOutlet weak var nameLable: UILabel!
    private var animal: Animal!
    
    @IBOutlet weak var definitionLable: UILabel!
    var answersChosen: [Answer] = []
    private var dogs = 0
    private var cats = 0
    private var rabbits = 0
    private var turtles = 0
    
    var lastNumber = 0
    var totalName: Animal!
    
    var animalCounted: [Animal: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for answer in answersChosen {
            if answer.animal == .dog {
                dogs += 1
            } else if answer.animal == .cat {
                cats += 1
            } else if answer.animal == .rabbit {
                rabbits += 1
            } else {
                turtles += 1
            }
        }
        
        animalCounted = [
            .dog : dogs,
            .cat : cats,
            .rabbit : rabbits,
            .turtle : turtles
        ]
        
        for (name, number) in animalCounted {
            if number > lastNumber {
                lastNumber = number
                totalName = name
                
            }
        }
        nameLable.text = "Вы - \(String(totalName.rawValue))"
        definitionLable.text = totalName.definition
        
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
