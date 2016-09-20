//
//  Character.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class Character: NSObject {

	var name: String
	var health: Int
	var maxHealth: Int
	var hitChance: Int
	var weapon: IWeapon
	var hasArmor: Bool
	
	init(name: String, health: Int, weapon: IWeapon, hasArmor: Bool) {
		self.name = name
		self.health = health < 25000 ? 25000 : health // minimal health value is 25 000
		self.maxHealth = self.health
		self.hitChance = Int(arc4random_uniform(20) + 50) // random value between 50 & 70
		self.weapon = weapon
		self.hasArmor = hasArmor
	}
	
	func protect(valeurAttaque: Float) -> Int {
		return Int(Double(valeurAttaque)*0.55)
	}
	
	func attack(character: Character) -> String {
		var attackSummary: String = ""
		if Int(arc4random_uniform(100)) < self.hitChance { // miss/dodge d100 roll
			if Int(self.weapon.damage()*1.13) == 0 {
				let log = "❌ \(self.name)(❤️\(self.health)) hits \(character.name)(❤️\(character.health)-0), but the weapon seems useless 👎"
				attackSummary = log
				print(log)
			} else if character.protect(self.weapon.damage()*1.13) <= 0 {
				let log = "❌ \(self.name)(❤️\(self.health)) hits \(character.name)(❤️\(character.health)), but it just stops on the enemy armor without doing any damage 👎"
				attackSummary = log
				print(log)
			} else {
				let withdrawnHealth = self.hasArmor ? character.protect(self.weapon.damage()*1.13) : Int(self.weapon.damage()*1.13)
				if character.health-withdrawnHealth <= 0 {
					let log = "💢 \(self.name)(❤️\(self.health)) lands the final hit to \(character.name)(❤️\(character.health) - \(withdrawnHealth)) with \(withdrawnHealth) damages !\n\(character.name) is dead ☠️"
					attackSummary = log
					print(log)
					character.health = 0
				} else {
					let log = "💢 \(self.name)(❤️\(self.health)) attacks \(character.name)(❤️\(character.health) - \(withdrawnHealth)) for \(withdrawnHealth) damages"
					attackSummary = log
					print(log)
					character.health = character.health-withdrawnHealth
				}
			}
		} else {
			let log = "🚫 \(self.name)(❤️\(self.health)) missed this attack on \(character.name)(❤️\(character.health))"
			attackSummary = log
			print(log)
		}
		return attackSummary
	}
	
	override var description: String {
		return "\(self.name) is a warrior in great shape (❤️\(self.health)). Pretty agile, \(self.name) has \(self.hitChance)% to hit the enemy target\nWeapon of choice : \(self.weapon)\n"
	}
	
}
