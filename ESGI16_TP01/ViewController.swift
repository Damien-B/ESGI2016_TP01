//
//  ViewController.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// TEST
//		let rogerSword = Sword(year: 30, legendary: true, name: "épée longue", height: 2.9, width: 1.4, weight: 28, price: 400000)
//		let kevinSword = Sword(year: 10, legendary: false, name: "épee en bois", height: 1.2, width: 1.0, weight: 5, price: 6000)
//		let gun = Gun(bullets: 400, name: "gun", height: 0.2, width: 0.8, weight: 20, price: 40000)
//		let gun2 = Gun(bullets: 100, name: "gun2", height: 0.2, width: 0.5, weight: 15, price: 2200)
//		
//		let roger = Character(name: "Roger", health: 10000, weapon: gun, hasArmor: true)
//		let kevin = Character(name: "Kévin", health: 40000, weapon: gun2, hasArmor: false)
//		print(roger)
//		print(kevin)
//		while roger.health > 0 && kevin.health > 0 {
//			roger.attack(kevin)
//			if kevin.health > 0 {
//				kevin.attack(roger)
//				if roger.health <= 0 {
//					self.winner = kevin
//					print("☠️ \(roger.name) is dead !")
//				}
//			} else {
//				self.winner = roger
//				print("☠️ \(kevin.name) is dead !")
//			}
//		}
//		if let winner = self.winner {
//			print("Fight is finished : \(winner.name) won ! (\(winner.health) remaining health points)")
//		}
		
	}
	
	override func viewWillAppear(animated: Bool) {
		if let navigationController = self.navigationController {
			navigationController.setNavigationBarHidden(true, animated: false)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}
