//
//  ViewController.swift
//  DH-HelloWorld
//
//  Created by Dave Hylands on 11/27/19.
//  Copyright © 2019 Dave Hylands. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        log.verbose("log.verbose message")
        log.debug("log.debug log message")
        log.info("log.info log message")
        log.warning("log.warning log message")
        log.error("log.error log message")

        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
