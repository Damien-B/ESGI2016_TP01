//
//  Excalibur.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class Excalibur: Sword {

	override func bonus() -> Float {
		return (self.weight/Float(self.year))*1.3
	}
	
	override var description: String {
		return "This legendary 🌟 sword is called \"\(self.name)\" (aka Excalibur)! She's been crafted in \(self.year). It mesures \(self.width)m per \(self.height)m, weights \(self.weight), and costs \(self.price) 💰!"
	}
	
}
