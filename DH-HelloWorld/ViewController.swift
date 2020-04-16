//
//  ViewController.swift
//  DH-HelloWorld
//
//  Created by Dave Hylands on 11/27/19.
//  Copyright © 2019 Dave Hylands. All rights reserved.
//

import UIKit
import CocoaLumberjack
import FullStory

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        DDLogVerbose("DDLogVerbose log message")
        DDLogDebug("DDLogDebug log message")
        DDLogInfo("DDLogInfo log message")
        DDLogWarn("DDLogWant log message")
        DDLogError("DDLogError log message")

        FS.log(with: FSLOG_ASSERT, message: "FS.log FSLOG_ASSERT")
        FS.log(with: FSLOG_INFO, message: "FS.log FSLOG_INFO")
        FS.log(with: FSLOG_WARNING, message: "FS.log FSLOG_WARNING")
        FS.log(with: FSLOG_ERROR, message: "FS.log FSLOG_ERROR")
        FS.log(with: FSLOG_DEBUG, message: "FS.log FSLOG_DEBUG")

        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

