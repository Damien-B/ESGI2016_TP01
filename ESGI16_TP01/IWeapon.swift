//
//  IWeapon.swift
//  ESGI16_TP01
//
//  Created by Damien Bannerot on 13/09/2016.
//  Copyright © 2016 Damien Bannerot. All rights reserved.
//

import Foundation

public protocol IWeapon {
	
	var name: String { get set }
	var height: Float { get set }
	var width: Float { get set }
	var weight: Float { get set }
	var price: Float { get set }
	
	func duration() -> Float
	func damage() -> Float
	func bonus() -> Float
	
}