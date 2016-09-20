//
//  RandomBattleViewController.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 14/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import UIKit

class RandomBattleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var charactersCollectionView: UICollectionView!
	@IBOutlet weak var battleSummaryTableView: UITableView!
	
	var contendersArray: [Character] = []
	var weaponsArray: [IWeapon] = []
	var contendersNameArray: [String] = ["Mario", "Arthur", "Rambo", "Chuck", "Lara", "Snake", "Daisy"] // name pool for random battle generation
	var contendersCount: Int = 7
	var battleSummaryArray: [String] = []
	var winner: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
		
		// random generation battle
		
		self.createWeapons()
		self.createContenders()
		self.presentContenders()
//		let winners = self.startBattle()
//		self.presentWinners(winners)
		
		self.charactersCollectionView.backgroundColor = UIColor.clearColor()
		
	}
	
	@IBAction func test(sender: AnyObject) {
		let winners = self.startBattle()
		self.presentWinners(winners)
	}
	
	override func viewWillAppear(animated: Bool) {
		if let navigationController = self.navigationController {
			navigationController.setNavigationBarHidden(false, animated: true)
		}
	}
	
	// MARK: Helper methods
	
	func createWeapons() {
		// populate array with pool of weapons
		self.weaponsArray.append(Gun(bullets: 8, name: "Colt", height: 0.2, width: 0.4, weight: 1.2, price: 400))
		self.weaponsArray.append(Gun(bullets: 9999, name: "Rail gun", height: 0.4, width: 0.8, weight: 4.9, price: 12500))
		self.weaponsArray.append(Gun(bullets: 24, name: "Dual pistols", height: 0.2*2, width: 0.4*2, weight: 1.1*2, price: 300*2))
		self.weaponsArray.append(Gun(bullets: 1, name: "The russian roulette gun", height: 0.2, width: 0.4, weight: 1.2, price: 300))
		self.weaponsArray.append(Sword(year: 4, legendary: false, name: "Katana", height: 1.7, width: 0.6, weight: 5.1, price: 2100))
		self.weaponsArray.append(Sword(year: 1, legendary: true, name: "Energy blade", height:1.4 , width: 0.8, weight: 8.9, price: 12650))
		self.weaponsArray.append(Sword(year: 20, legendary: false, name: "Glaive", height: 1.1, width: 0.5, weight: 4.1, price: 100))
		self.weaponsArray.append(Sword(year: 1, legendary: true, name: "Mjöllnir", height: 1, width: 0.3, weight: 9999, price: 999999))
		self.weaponsArray.append(Excalibur(year: 100, legendary: true, name: "Kings' sword", height: 1.5, width: 0.6, weight: 10, price: 80000))
		self.weaponsArray.append(Sword(year: Int(arc4random_uniform(40)+1), legendary: Int(arc4random_uniform(1)) == 1 ? true : false, name: "unknown sword", height: Float(Int(arc4random_uniform(20))/10+1), width: Float(Int(arc4random_uniform(100))/10+1), weight: Float(Int(arc4random_uniform(800))/10+1), price: Float(Int(arc4random_uniform(20000))+200)))
		self.weaponsArray.append(Gun(bullets: Int(arc4random_uniform(40)), name: "unknown gun", height: Float(Int(arc4random_uniform(50))/10+1), width: Float(Int(arc4random_uniform(100))/10+1), weight: Float(Int(arc4random_uniform(80))/10+1), price: Float(Int(arc4random_uniform(50000)+200))))
	}
	
	func createContenders() {
		// populate array with characters
		var contendersSelectionNamesArray = self.contendersNameArray
		for _ in 0...self.contendersCount-1 {
			let randomContenderNameArrayIndex = Int(arc4random_uniform(UInt32(contendersSelectionNamesArray.count)))
			let contenderName = contendersSelectionNamesArray[randomContenderNameArrayIndex]
			contendersSelectionNamesArray.removeAtIndex(randomContenderNameArrayIndex)
			let randomWeaponsArrayIndex = Int(arc4random_uniform(UInt32(self.weaponsArray.count)))
			let weapon = self.weaponsArray[randomWeaponsArrayIndex]
			self.weaponsArray.removeAtIndex(randomWeaponsArrayIndex)
			
			self.contendersArray.append(Character(name: contenderName, health: Int(arc4random_uniform(50000)+25000), weapon: weapon, hasArmor: Int(arc4random_uniform(2)) == 1 ? true : false))
		}
	}
	
	func presentContenders() {
		print("•••••••••••• WELCOME TO THE BATTLE OF THE DAY ••••••••••••\n\nHere are the \(self.contendersCount) contenders !! 📢\n")
		for contender in self.contendersArray {
			print("• \(contender)")
		}
	}
	
	func startBattle() -> [Character] {
		print("•••••••••••• NOW LET'S THE BATTLE BEGIN !! ••••••••••••\n")
		var battleContendersArray = self.contendersArray
		while battleContendersArray.count > self.contendersArray.count/2 {
			for contender in battleContendersArray {
				var enemiesArray: [Character] = battleContendersArray
				enemiesArray.removeAtIndex(battleContendersArray.indexOf(contender)!)
				let target: Character = enemiesArray[Int(arc4random_uniform(UInt32(enemiesArray.count)))]
				// TODO: pause after each attack
				self.battleSummaryArray.append(contender.attack(target))
				self.charactersCollectionView.reloadData()
				self.battleSummaryTableView.reloadData()
				if target.health == 0 {
					battleContendersArray.removeAtIndex(battleContendersArray.indexOf(target)!)
					break
				}
			}
		}
		return battleContendersArray
	}
	
	func presentWinners(winners: [Character]) {
		print("•••••••••••• THE BATTLE IS FINISHED !! ••••••••••••\n\nAnd the winners are :")
		for winner in winners {
			print("• \(winner.name)(❤️\(winner.health)/\(winner.maxHealth)), with the weapon named \"\(winner.weapon.name)\"")
		}
		print("\n")
	}
	
	// MARK: UICollectionViewDelegate & UICollectionViewDataSource methods
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.contendersArray.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("characterCell", forIndexPath: indexPath) as! CharacterCollectionViewCell
		cell.populateCellWith(self.contendersArray[indexPath.row])
		return cell
	}
	
	
//	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//		self.contendersArray[indexPath.row].health += -10000
//		self.charactersCollectionView.reloadData()
//	}
	

	// MARK: UITableViewDelegate & UITableViewDataSource methods
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.battleSummaryArray.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("attackSummaryCell", forIndexPath: indexPath)
		cell.textLabel?.text = self.battleSummaryArray[indexPath.row]
		return cell
		
	}
	
//	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//		<#code#>
//	}

}
