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
    
    //UserDefault로 배열 구성하기
    var slimesCount: [Int] = [UserDefaults.standard.integer(forKey: "Idx0"),
                              UserDefaults.standard.integer(forKey: "Idx1"),
                              UserDefaults.standard.integer(forKey: "Idx2"),
                              UserDefaults.standard.integer(forKey: "Idx3"),
                              UserDefaults.standard.integer(forKey: "Idx4"),
                              UserDefaults.standard.integer(forKey: "Idx5"),
                              UserDefaults.standard.integer(forKey: "Idx6"),
                              UserDefaults.standard.integer(forKey: "Idx7"),
                              UserDefaults.standard.integer(forKey: "Idx8")]
    
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
        
        print("\(slimesCount[sender.tag]) \(sender.tag)번째 슬라임 누럿더")
        
        let num = UserDefaults.standard.integer(forKey: "Idx\(sender.tag)")
        
        let newnum = num + 1
        
        UserDefaults.standard.set(newnum, forKey: "Idx\(sender.tag)")
        
        print("\(slimesCount[sender.tag])")
        
        slimesLable[sender.tag].text = "\(slimesEmotion[sender.tag])  \(UserDefaults.standard.integer(forKey: "Idx\(sender.tag)"))"
        
    }
    
    //전체 리셋버튼
    @IBAction func tapResetBtn(_ sender: UIButton) {
        
        for i in 0...8 {
            UserDefaults.standard.set(0, forKey: "Idx\(i)")
            slimesLable[i].text = "\(slimesEmotion[i])  \(UserDefaults.standard.integer(forKey: "Idx\(i)"))"
        }
    }
    
    @objc func leftBarButtonItemClicked(){
        print("leftBarButton Item Clicked")
    }

}

