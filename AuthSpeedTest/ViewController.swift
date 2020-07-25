//
//  ViewController.swift
//  AuthSpeedTest
//
//  Created by Maxime on 10/06/2020.
//  Copyright © 2020 Madrau. All rights reserved.
//

import UIKit
import LocalAuthentication

struct Test {
	var type: LABiometryType
	var time: TimeInterval
	var error: Bool = false
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet var label: UILabel!
	@IBOutlet var tableview: UITableView!
	
	var tests: [Test] = []
	var context: LAContext!
	var mid: Double = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		// Update top text from authentication method
		var authMethodText: String = "Unknown"
		var adviceText: String = ""
		context = LAContext.init()

        var error: NSError?

        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			
            if (context.biometryType == .faceID) {
				authMethodText = "FaceID"
				adviceText = "Stay in front of your device and keep your eyes open while testing."
				
			} else if (context.biometryType == .touchID) {
				authMethodText = "TouchID"
				adviceText = "Keep your finger on the sensor before pressing \"Measure\". Lift your finger between tests."
			} else {
				print ("Other method")
			}
		} else {
			authMethodText = "Unknown"
			adviceText = "Can't recognize a biometric authentication…"
			
		}
		
		label.text = "Auth method: \(authMethodText)\n\(adviceText)"
	}
	
	/// Start an authencication measure.
	/// Called when user press the "Measure" button
	///
	@IBAction func ProceedAuthenticationMeasure(_ sender: Any) {
		
		var authPolicy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
		#if os(OSX)
			authPolicy = .deviceOwnerAuthenticationWithBiometricsOrWatch
		#endif
		
		
		var error: NSError?
		
		context = LAContext.init()

		if context.canEvaluatePolicy(authPolicy, error: &error) {
			let reason = "Measuring authentication"

			let start = Date()
			context.evaluatePolicy(authPolicy, localizedReason: reason) {
				[unowned self] success, authenticationError in

				DispatchQueue.main.async {
					if success {
						print ("Success")
						self.ValidateMeasure(start: start)
					} else {
						self.Error()
					}
				}
			}
		} else { // Device can't use biometrocs authentication
			let ac = UIAlertController(title: "Cannot test", message: "Your device is not configured for a biometric authentication", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "OK", style: .default))
			present(ac, animated: true)
		}
	}

	/// Get time delta between start and end of the measure test and
	/// write it to the table view
	///
	func ValidateMeasure(start: Date) {
		let end = Date()
		let delta = end.timeIntervalSince(start)
		let res = Test(type: self.context.biometryType, time: delta)
		self.tests.append(res)
		self.tableview.reloadData()
		let indexPath = IndexPath(row: tests.count, section: 0)
		self.tableview.scrollToRow(at: indexPath, at: .bottom, animated: false)
	}
	
	/// Measure failed: write it as a fail in the tableview
	///
	func Error() {
		let res = Test(type: self.context.biometryType, time: 0, error: true)
		self.tests.append(res)
		self.tableview.reloadData()
		let indexPath = IndexPath(row: tests.count, section: 0)
		self.tableview.scrollToRow(at: indexPath, at: .bottom, animated: false)
	}
	
	
	
}
