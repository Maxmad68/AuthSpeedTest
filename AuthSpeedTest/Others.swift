//
//  Others.swift
//  AuthSpeedTest
//
//  Created by Maxime on 25/07/2020.
//  Copyright © 2020 Madrau. All rights reserved.
//

import UIKit

extension TimeInterval {
	
	/// Format a TimeInterval into a string
	///
	/// - Returns:
	///		- String : the TimeInterval Formatted
	///
	func string() -> String {
		
		let time = NSInteger(self)
		
		let seconds = time % 60
		let minutes = (time / 60) % 60
		let hours = (time / 3600)
		
		return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
		
	}
}

