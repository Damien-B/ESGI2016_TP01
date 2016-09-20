//
//  Gun.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class Gun: NSObject, IWeapon {
	
	var bullets: Int
	var name: String
	var height: Float
	var width: Float
	var weight: Float
	var price: Float
	
	init(bullets: Int, name: String, height: Float, width: Float, weight: Float, price: Float) {
		self.bullets = bullets
		self.name = name
		self.height = height
		self.width = width
		self.weight = weight
		self.price = price
	}
	
	func duration() -> Float {
		return (self.price/self.weight)*self.damage()
	}
	
	func damage() -> Float {
		return (self.weight/(self.width*self.height))+self.bonus()
	}
	
	func bonus() -> Float {
		return (Float(self.bullets)*self.weight)/(self.weight%Float(self.bullets))
	}
	
	override var description: String {
		return "🔫 Gun, called \"\(self.name)\", with its \(self.width)m per \(self.height)m and its \(self.weight)kg, it can deliver no less than \(self.bullets) bullets. Its price suits its power, you could afford one for  \(self.price) 💰!"
	}
}
