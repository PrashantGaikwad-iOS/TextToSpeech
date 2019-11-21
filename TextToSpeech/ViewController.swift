//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Saif on 21/11/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var hindiLabel: UILabel!
    @IBOutlet weak var englishPlayButton: UIButton!
    @IBOutlet weak var hindiPlayButton: UIButton!
    
    //MARK: - Properties
    var hotspotName : String?
    // Synth object
    let speechSynthesizer = AVSpeechSynthesizer()
    // Utterance object
    var speechUtterance = AVSpeechUtterance(string: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.speechSynthesizer.delegate = self
    }

    @IBAction func playEnglishTextAction(_ sender: Any) {
        // The resume functionality
        if (speechSynthesizer.isPaused) {
            speechSynthesizer.continueSpeaking();
            englishPlayButton.setTitle("Pause", for: .normal)
        }
        // The pause functionality
        else if (speechSynthesizer.isSpeaking) {
            speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
            englishPlayButton.setTitle("Play", for: .normal)
        }
        // The start functionality
        else if (!speechSynthesizer.isSpeaking) {
            englishPlayButton.setTitle("Pause", for: .normal)
            // Getting text to read from the UITextView (textView).
            speechUtterance = AVSpeechUtterance(string: englishLabel.text ?? "")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.5
            speechSynthesizer.speak(speechUtterance)
        }
    }
    @IBAction func playHindiTextAction(_ sender: Any) {
        // The resume functionality
        if (speechSynthesizer.isPaused) {
            speechSynthesizer.continueSpeaking();
            hindiPlayButton.setTitle("Pause", for: .normal)
        }
        // The pause functionality
        else if (speechSynthesizer.isSpeaking) {
            speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
            hindiPlayButton.setTitle("Play", for: .normal)
        }
        // The start functionality
        else if (!speechSynthesizer.isSpeaking) {
            hindiPlayButton.setTitle("Pause", for: .normal)
            // Getting text to read from the UITextView (textView).
            speechUtterance = AVSpeechUtterance(string: hindiLabel.text ?? "")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "hi-IN")
            speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.5
            speechSynthesizer.speak(speechUtterance)
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        hindiPlayButton.setTitle("Play", for: .normal)
        englishPlayButton.setTitle("Play", for: .normal)
    }
    
}

