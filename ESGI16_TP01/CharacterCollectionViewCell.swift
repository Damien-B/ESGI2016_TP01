//
//  CharacterCollectionViewCell.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 14/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
 
	
	@IBOutlet weak var characterNameLabel: UILabel!
	@IBOutlet weak var characterHealthLabel: UILabel!
	@IBOutlet weak var characterMaxHealthLabel: UILabel!
	@IBOutlet weak var characterHitChanceLabel: UILabel!
	@IBOutlet weak var characterArmorImageView: UIImageView!
	@IBOutlet weak var characterHealthProgressView: UIProgressView!
	@IBOutlet weak var characterWeaponLabel: UILabel!
	
	var character: Character?
	
	func populateCellWith(character: Character) {
		self.characterNameLabel.text = character.name
		self.characterHealthLabel.text = String(character.health)
		self.characterMaxHealthLabel.text = String(character.maxHealth)
		self.characterHitChanceLabel.text = "\(character.hitChance)%"
		self.characterArmorImageView.alpha = character.hasArmor ? 1 : 0.1
		if self.characterWeaponLabel.text == character.weapon.name {
			self.characterHealthProgressView.updateWith(character, animated: true)
		} else {
			self.characterHealthProgressView.updateWith(character, animated: false)
		}
		self.characterWeaponLabel.text = character.weapon.name
	}
	
	
}

extension UIProgressView {
	func updateWith(character: Character, animated: Bool) {
		let percent = Float(character.health)/Float(character.maxHealth)
		UIView.animateWithDuration(NSTimeInterval(0.4), animations: {
			self.setProgress(percent, animated: animated)
		if percent > 0.5 {
			self.progressTintColor = UIColor(red: ((-410.0*CGFloat(percent))+440.0)/255.0, green: 235.0/255.0, blue: 0.0/255.0, alpha: 1.0)
		} else {
			self.progressTintColor = UIColor(red: 235.0/255.0, green: (102.5*CGFloat(percent)+183.75)/255.0, blue: 0.0/255.0, alpha: 1.0)
		}
		})
		
	}
}