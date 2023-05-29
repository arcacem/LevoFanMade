//
//  MemeViewController.swift
//  LEVO
//
//  Created by Arca Sahin on 20.05.2023.
//

import UIKit
import AVFoundation

class MemeViewController: UIViewController {
    
    
    @IBOutlet weak var buton1: UIButton!
    @IBOutlet weak var buton5: UIButton!
    @IBOutlet weak var buton4: UIButton!
    @IBOutlet weak var buton3: UIButton!
    @IBOutlet weak var buton2: UIButton!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    var buttonActive = false
    
    
    let soundName = soundNames(bas: "bas", bynogame: "BYNOGAME", got: "gtnu_yyim", aa: "levo_aa", levobos: "levobosaliyor_1")
    
    var nowPlaying = ""
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)

            
    }
    func playSound(named: String){
        guard let path = Bundle.main.path(forResource: named, ofType:"m4a") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            }
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func changeButton(buttonName: UIButton) {
        if buttonActive != false {
            buttonName.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            buttonName.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    func changeAllButtons(exceptThatButton : UIButton) {
        var allButtons = [buton1, buton2, buton3, buton4, buton5]
        allButtons = allButtons.filter({ $0 !=
            exceptThatButton
        })
        for i in 0..<allButtons.count{
            allButtons[i]!.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        let value = sender.value
        slider1.maximumValue = Float(audioPlayer!.duration)
        audioPlayer?.stop()
        audioPlayer?.currentTime = TimeInterval(value)
        audioPlayer?.play()
    }
    
   @objc func updateSlider() {
       slider1.maximumValue = Float(audioPlayer?.duration ?? 0)
        slider1.value = Float(audioPlayer?.currentTime ?? 0)
        
    }
    
    
    @IBAction func button1Tiklandi(_ sender: Any) {
        
        if audioPlayer?.isPlaying == true {
            if nowPlaying == soundName.bas {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton1)
            } else {
                audioPlayer?.stop()
                buttonActive = true
                self.audioPlayer = nil
                playSound(named:  soundName.bas)
                print("buton 1")
                nowPlaying = soundName.bas
                changeButton(buttonName: buton1)
                changeAllButtons(exceptThatButton: buton1)
            }
            
        } else {
            if nowPlaying == soundName.bas {
                audioPlayer?.play()
                buttonActive = true
                changeButton(buttonName: buton1)

            } else {
                buttonActive = true
                self.audioPlayer = nil
                playSound(named:  soundName.bas)
                print("buton 1")
                nowPlaying = soundName.bas
                changeButton(buttonName: buton1)
                changeAllButtons(exceptThatButton: buton1)
            }
        }
    }
    
    @IBAction func button2Tiklandi(_ sender: Any) {
        if audioPlayer?.isPlaying == true {
            if nowPlaying == soundName.bynogame {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton2)
            } else {
                audioPlayer?.stop()
                buttonActive = true
                self.audioPlayer = nil
                playSound(named:  soundName.bynogame)
                print("buton 2")
                nowPlaying = soundName.bynogame
                changeButton(buttonName: buton2)
                changeAllButtons(exceptThatButton: buton2)
            }
        } else {
            if nowPlaying == soundName.bynogame {
                audioPlayer?.play()
                buttonActive = true
                changeButton(buttonName: buton3)
            
            } else {
                // eğer eşit ise durduğu yerden devam etmesi konulacak  tabii sıfırlama butonu ve slider ile gösterilme işlemi ypaılacak
                self.audioPlayer = nil
                playSound(named: soundName.bynogame)
                buttonActive = true
                print("buton 3 ")
                nowPlaying = soundName.bynogame
                changeButton(buttonName: buton2)
                changeAllButtons(exceptThatButton: buton2)
            }
        }
    }
    
    @IBAction func button3Tiklandi(_ sender: Any) {
        if audioPlayer?.isPlaying == true {
            if nowPlaying == soundName.got {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton3)
                
            } else {
                self.audioPlayer = nil
                audioPlayer?.prepareToPlay()
                playSound(named: soundName.got)
                buttonActive = true
                print("buton 3 ")
                nowPlaying = soundName.got
                changeButton(buttonName: buton3)
                changeAllButtons(exceptThatButton: buton3)
            }
        } else {
            if nowPlaying == soundName.got {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton2)
            } else {
                self.audioPlayer = nil
                audioPlayer?.prepareToPlay()
                playSound(named: soundName.got)
                buttonActive = true
                print("buton 3 ")
                nowPlaying = soundName.got
                changeButton(buttonName: buton3)
                changeAllButtons(exceptThatButton: buton3)
            }
        }
        
        }
    
    @IBAction func button4Tiklandi(_ sender: Any) {
        if audioPlayer?.isPlaying == true {
            if nowPlaying == soundName.aa {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton4)
                
            } else {
                self.audioPlayer = nil
                buttonActive = true
                playSound(named: soundName.aa)
                print("buton 4 ")
                nowPlaying = soundName.aa
                changeButton(buttonName: buton4)
                changeAllButtons(exceptThatButton: buton4)
            }
        }
            else {
            if nowPlaying == soundName.aa {
                audioPlayer?.play()
                buttonActive = true
                changeButton(buttonName: buton4)
            } else {
                self.audioPlayer = nil
                buttonActive = true
                playSound(named: soundName.aa)
                print("buton 4 ")
                nowPlaying = soundName.aa
                changeButton(buttonName: buton4)
                changeAllButtons(exceptThatButton: buton4)
            }
            
        }
    }
    
    @IBAction func button5Tiklandi(_ sender: Any) {
        if audioPlayer?.isPlaying == true {
            if nowPlaying == soundName.levobos {
                audioPlayer?.stop()
                buttonActive = false
                changeButton(buttonName: buton5)
                
            } else {
                self.audioPlayer = nil
                buttonActive = true
                playSound(named: soundName.levobos)
                print("buton 4 ")
                nowPlaying = soundName.levobos
                changeButton(buttonName: buton5)
                changeAllButtons(exceptThatButton: buton5)
            }
        } else {
            if nowPlaying == soundName.levobos {
                audioPlayer?.play()
                buttonActive = true
                changeButton(buttonName: buton5)
                
            } else {
                self.audioPlayer = nil
                buttonActive = true
                playSound(named: soundName.levobos)
                print("buton 5 ")
                nowPlaying = soundName.levobos
                changeButton(buttonName: buton5)
                changeAllButtons(exceptThatButton: buton5)
            }
        }
    }
}
