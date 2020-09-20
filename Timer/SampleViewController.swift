//
//  SamplViewController.swift
//  Timer
//
//  Created by Bryce Yang on 2020/09/20.
//

import Cocoa

class SampleViewController: NSViewController {

    @IBOutlet var textLabel: NSTextField!
    @IBOutlet var leftTime: NSTextField!
    @IBOutlet var inputTime: NSTextField!
    
    var inputTimeValue: String?
    
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
      didSet {
        updateQuote()
      }
    }
    
    var time = 0
    var timer: Timer?
    
    override func viewDidLoad() {
      super.viewDidLoad()
      currentQuoteIndex = 0
    }

    func updateQuote() {
      textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    

}

extension SampleViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> SampleViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("SampleViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SampleViewController else {
            fatalError("Why cant i find SampleViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
    
}

// MARK: Actions

extension SampleViewController {
  @IBAction func previous(_ sender: NSButton) {
    currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
  }

  @IBAction func next(_ sender: NSButton) {
    currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
  }

  @IBAction func quit(_ sender: NSButton) {
    NSApplication.shared.terminate(sender)
  }
}

extension SampleViewController {
    @IBAction func startTimer(_ sender: NSButton) {
        
        self.inputTimeValue = inputTime.stringValue
        print(self.inputTimeValue)
        leftTime.stringValue = self.inputTimeValue! + ".00"
//        self.timer = Foundation.Timer.scheduledTimer(
//              timeInterval: 1, // (second)
//              target: self,
//              selector: #selector(tick),
//              userInfo: nil,
//              repeats: true
//            )

    }
    
//    @objc func tick() {
//        self.leftTime.stringValue = CGFloat(self.timer.i)
//    }
    
}


