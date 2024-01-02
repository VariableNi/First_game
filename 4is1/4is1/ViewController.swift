//
//  ViewController.swift
//  4is1
//
//  Created by VariableNi on 29.12.2023.
//  Copyright © 2023 VariableNi. All rights reserved.
//

import UIKit

class Creature
{
    var health = 0
    var power = 0
    var name = ""
    var lucky = 0
    
    func attack(target: Creature)
    {
        target.health -= power
    }
}

class Vlood: Creature
{
    var stay = "Shaman"
    
    func Second_Breath(target: Creature)
    {
        target.health += 1000
    }
    
    func Weak_soul(target: Creature)
    {
        target.power -= 30
    }
    
    func Decay(target: Creature)
    {
        target.health -= 55
    }
    
}

class ViewController: UIViewController {
    
    let player1 = Vlood()
    let player2 = Vlood()
    
    @IBOutlet weak var Notification_of_round: UILabel!
    
    // static of first player
    @IBOutlet weak var Player1: UIImageView!
    @IBOutlet weak var Player1_HP: UILabel!
    @IBOutlet weak var Player1_Power: UILabel!
    
    
    // static of second player
    @IBOutlet weak var Player2: UIImageView!
    @IBOutlet weak var Player2_HP: UILabel!
    @IBOutlet weak var Player2_Power: UILabel!
    
    var round = 1
    var step = 0

    @IBAction func Skill_one(_ sender: Any)
    {
        var Character = ""
        
        if Notification_of_round.text! == "Player one turn"
        {
            Character = player1.name
        }
        
        else if Notification_of_round.text! == "Player two turn"
        {
            Character = player2.name
        }
        
        if Character == "Vlood"
        {
            if Notification_of_round.text! == "Player one turn"
            {
                player1.Weak_soul(target: player2)
                step = 1
                start_round()
            }
            
            else if Notification_of_round.text! == "Player two turn"
            {
                player2.Weak_soul(target: player1)
                step = 1
                start_round()
            }
            
        }
        
    }
    
    
    @IBAction func Skill_two(_ sender: Any)
    {
        var Character = ""
        
        if Notification_of_round.text! == "Player one turn"
        {
            Character = player1.name
        }
            
        else if Notification_of_round.text! == "Player two turn"
        {
            Character = player2.name
        }
        
        if Character == "Vlood"
        {
            if Notification_of_round.text! == "Player one turn"
            {
                player1.Decay(target: player2)
                step = 1
                start_round()
            }
                
            else if Notification_of_round.text! == "Player two turn"
            {
                player2.Decay(target: player1)
                step = 1
                start_round()
                
            }
            
            
        }
    }
    
    
    @IBAction func Skill_three(_ sender: Any)
    {
        var Character = ""
        
        if Notification_of_round.text! == "Player one turn"
        {
            Character = player1.name
        }
            
        else if Notification_of_round.text! == "Player two turn"
        {
            Character = player2.name
        }
        
    }
    
    func start_round()
    {
        if Notification_of_round.text! == "Player one turn"
        {
            if step != 0
            {
                step = 0
                Notification_of_round.text? = "Player two turn"
                Player1_HP.text? = "HP:" + String(player1.health)
                Player2_HP.text? = "HP:" + String(player2.health)
                Player1_Power.text? = "Power:" + String(player1.power)
                Player2_Power.text? = "Power:" + String(player2.power)
                }
        }
            
        else if Notification_of_round.text! == "Player two turn"
        {
            if step != 0
            {
                step = 0
                Notification_of_round.text? = "Player one turn"
                Player1_HP.text? = String(player1.health)
                Player2_HP.text? = String(player2.health)
                Player1_Power.text? = String(player1.power)
                Player2_Power.text? = String(player2.power)
            }
        }
    }
    
    override func viewDidLoad() {
        
        Notification_of_round.text? = "Player one turn"
        
        player1.health = 700
        player1.name = "Vlood"
        player1.power = 0
        player1.lucky = 0
        
        player2.health = 700
        player2.name = "Vlood"
        player2.power = 0
        player2.lucky = 0
        
        Player1_HP.text? += String(player1.health)
        Player2_HP.text? += String(player2.health)
        Player1_Power.text? += String(player1.power)
        Player2_Power.text? += String(player2.power)
        
        start_round()
        
        super.viewDidLoad()
    }

}


