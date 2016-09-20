//
//  Sword.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class Sword: NSObject, IWeapon {
	
	var year: Int
	var legendary: Bool
	var name: String
	var height: Float
	var width: Float
	var weight: Float
	var price: Float
	
	init(year: Int, legendary: Bool, name: String, height: Float, width: Float, weight: Float, price: Float) {
		self.year = year
		self.legendary = legendary
		self.name = name
		self.height = height
		self.width = width
		self.weight = weight
		self.price = price
	}
	
	func duration() -> Float {
		return (Float(self.year)/self.price)*self.weight
	}
	
	func damage() -> Float {
		let damage = ((self.weight*self.width*self.height)+self.bonus())/Float(self.year)
		return self.legendary && self.duration() >= 10 ? damage : damage*0.9
	}
	
	func bonus() -> Float {
		return self.legendary ? self.weight/Float(self.year) : 0.0
	}
	
	override var description: String {
		var descriptionString = "This "
		if self.legendary { descriptionString += "legendary 🌟 "}
		descriptionString += "🗡 Sword, crafted \(self.year) years ago, is named \"\(self.name)\". It mesures \(self.width)m per \(self.height)m, weights \(self.weight), and costs \(self.price) 💰!"
		return descriptionString
	}
}
