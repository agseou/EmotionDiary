//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 은서우 on 2024/01/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slimes: [UIButton]!
    @IBOutlet var slimesLable: [UILabel]!
    
    var slimesCount: [Int] = [0,0,0,0,0,0,0,0,0]
    
    var slimesEmotion: [String] = ["행복해", "사랑해", "행복해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(leftBarButtonItemClicked))
        
        
        for i in 0...8 {
            slimesLable[i].text = "\(slimesEmotion[i])  \(slimesCount[i])"
        }
        
    }

    @IBAction func tapslime(_ sender: UIButton) {
        print("\(sender.tag)번째 슬라임 누럿더")
        slimesCount[sender.tag] += 1
        slimesLable[sender.tag].text = "\(slimesEmotion[sender.tag])  \(slimesCount[sender.tag])"
    }
    
    
    @objc func leftBarButtonItemClicked(){
        print("leftBarButton Item Clicked")
    }

}

