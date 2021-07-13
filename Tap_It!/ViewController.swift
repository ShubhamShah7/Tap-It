//
//  ViewController.swift
//  Tap_It!
//
//  Created by DCS on 09/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var SCORE = 0
    var timeLeft = 30
    var timer = Timer()
    
    private let box1:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:40, y:130, width: 90, height: 90)
        return view1
    }()
    
    private let box2:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:140, y:130, width: 90, height: 90)
        return view1
    }()
    
    private let box3:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:240, y:130, width: 90, height: 90)
        return view1
        
    }()
    
    private let box4:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:40, y:230, width: 90, height: 90)
        return view1
    }()
    
    private let box5:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:140, y:230, width: 90, height: 90)
        return view1
    }()
    
    private let box6:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:240, y:230, width: 90, height: 90)
        return view1
    }()
    
    private let box7:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:40, y:330, width: 90, height: 90)
        return view1
    }()
    
    private let box8:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:140, y:330, width: 90, height: 90)
        return view1
    }()
    
    private let box9:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        view1.frame = CGRect(x:240, y:330, width: 90, height: 90)
        return view1
    }()
    
    private let score_lbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Score"
        lbl.textColor = .red
        lbl.font = .boldSystemFont(ofSize:20)
        return lbl
    }()
    
    private let txtScore:UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .red
        lbl.font = .boldSystemFont(ofSize:20)
        return lbl
    }()
    
    private let startButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Start", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return btn
    }()
    
    private let stopButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Stop", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(stopGame), for: .touchUpInside)
        return btn
    }()
    
    @objc private func startGame()
    {
        startButton.isHidden = true
        stopButton.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(timerStarts), userInfo: .none ,repeats: true)
    }
    
    @objc private func stopGame()
    {
        box1.backgroundColor = .yellow
        box2.backgroundColor = .yellow
        box3.backgroundColor = .yellow
        box4.backgroundColor = .yellow
        box5.backgroundColor = .yellow
        box6.backgroundColor = .yellow
        box7.backgroundColor = .yellow
        box8.backgroundColor = .yellow
        box9.backgroundColor = .yellow
        
        timer.invalidate()
        
        var username = ""
        let alert = UIAlertController(title: "Game Finished", message: "Enter your name", preferredStyle: .alert)
        alert.addTextField{(textField) in
            textField.placeholder = "Some Text"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] (_) in
            let textfield = alert.textFields![0]
            username = textfield.text ?? ""
            print(username)
            UserDefaults.standard.setValue("abc", forKey: "usertoken")
            UserDefaults.standard.setValue(username, forKey: "username")
            UserDefaults.standard.setValue(self?.SCORE, forKey: "score")

            let vc = LeaderBoardVC()
            self?.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert,animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(box1)
        view.addSubview(box2)
        view.addSubview(box3)
        view.addSubview(box4)
        view.addSubview(box5)
        view.addSubview(box6)
        view.addSubview(box7)
        view.addSubview(box8)
        view.addSubview(box9)
        view.addSubview(txtScore)
        view.addSubview(score_lbl)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        stopButton.isHidden = true
        title = "Tap It"
    
        let tapGesture1=UITapGestureRecognizer(target: self, action: #selector(didTapView1))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1
        
        let tapGesture2=UITapGestureRecognizer(target: self, action: #selector(didTapView2))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        
        let tapGesture3=UITapGestureRecognizer(target: self, action: #selector(didTapView3))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        
        let tapGesture4=UITapGestureRecognizer(target: self, action: #selector(didTapView4))
        tapGesture4.numberOfTapsRequired = 1
        tapGesture4.numberOfTouchesRequired = 1
        
        let tapGesture5=UITapGestureRecognizer(target: self, action: #selector(didTapView5))
        tapGesture5.numberOfTapsRequired = 1
        tapGesture5.numberOfTouchesRequired = 1
        
        let tapGesture6=UITapGestureRecognizer(target: self, action: #selector(didTapView6))
        tapGesture6.numberOfTapsRequired = 1
        tapGesture6.numberOfTouchesRequired = 1
        
        let tapGesture7=UITapGestureRecognizer(target: self, action: #selector(didTapView7))
        tapGesture7.numberOfTapsRequired = 1
        tapGesture7.numberOfTouchesRequired = 1
        
        let tapGesture8=UITapGestureRecognizer(target: self, action: #selector(didTapView8))
        tapGesture8.numberOfTapsRequired = 1
        tapGesture8.numberOfTouchesRequired = 1
        
        let tapGesture9=UITapGestureRecognizer(target: self, action: #selector(didTapView9))
        tapGesture9.numberOfTapsRequired = 1
        tapGesture9.numberOfTouchesRequired = 1
        
        box1.addGestureRecognizer(tapGesture1)
        box2.addGestureRecognizer(tapGesture2)
        box3.addGestureRecognizer(tapGesture3)
        box4.addGestureRecognizer(tapGesture4)
        box5.addGestureRecognizer(tapGesture5)
        box6.addGestureRecognizer(tapGesture6)
        box7.addGestureRecognizer(tapGesture7)
        box8.addGestureRecognizer(tapGesture8)
        box9.addGestureRecognizer(tapGesture9)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        score_lbl.frame = CGRect(x:70,y:box7.bottom+30, width: 80, height:80)
        txtScore.frame = CGRect(x:280,y:box7.bottom+30, width: 80, height:80)
        startButton.frame = CGRect(x:60, y:txtScore.bottom+1, width: 250, height: 60)
        stopButton.frame = CGRect(x:60, y:txtScore.bottom+1, width: 250, height: 60)
    }
}

extension ViewController {
    @objc private func didTapView1(_ gesture:UITapGestureRecognizer, _ sender:UIView)
    {
        print("Box 1 : \(gesture.location(in: sender))")
        if (self.box1.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box1.backgroundColor?.isEqual(UIColor.black))!{
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    
    @objc private func didTapView2(_ gesture:UITapGestureRecognizer)
    {
        print("Box 2 : \(gesture.location(in: view))")
        if (self.box2.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box2.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView3(_ gesture:UITapGestureRecognizer)
    {
        print("Box 3 : \(gesture.location(in: view))")
        if (self.box3.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }else if(self.box3.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView4(_ gesture:UITapGestureRecognizer)
    {
        print("Box 4 : \(gesture.location(in: view))")
        if (self.box4.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }else if(self.box4.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView5(_ gesture:UITapGestureRecognizer)
    {
        print("Box 5 : \(gesture.location(in: view))")
        if (self.box5.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box5.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView6(_ gesture:UITapGestureRecognizer)
    {
        print("Box 6 : \(gesture.location(in: view))")
        if (self.box6.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box6.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView7(_ gesture:UITapGestureRecognizer)
    {
        print("Box 7 : \(gesture.location(in: view))")
        if (self.box7.backgroundColor?.isEqual(UIColor.red))!
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box7.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView8(_ gesture:UITapGestureRecognizer)
    {
        print("Box 8 : \(gesture.location(in: view))")
        if (self.box8.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box8.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func didTapView9(_ gesture:UITapGestureRecognizer)
    {
        print("Box 9 : \(gesture.location(in: view))")
        if (self.box9.backgroundColor!.isEqual(UIColor.red))
        {
            self.SCORE += 10
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else if(self.box9.backgroundColor!.isEqual(UIColor.black)){
            self.SCORE -= 5
            txtScore.text = String(SCORE)
            print(SCORE)
        }
        else
        {
            self.SCORE -= 1
            txtScore.text = String(SCORE)
            print(SCORE)
        }
    }
    @objc private func timerStarts()
    {
//        self.timeLeft -= 1
//        self.txtTimer.text = String(self.timeLeft)
        
        let index = [1,2,3,4,5,6,7,8,9]
        let randomInt = index.randomElement()
        if(randomInt == 1)
        {
            box1.backgroundColor = .red
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 2) {
            box1.backgroundColor = .black
            box2.backgroundColor = .red
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 3) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .red
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 4) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .red
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 5) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .red
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 6) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .red
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 7) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .red
            box8.backgroundColor = .black
            box9.backgroundColor = .black
        } else if (randomInt == 8) {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .red
            box9.backgroundColor = .black
        } else {
            box1.backgroundColor = .black
            box2.backgroundColor = .black
            box3.backgroundColor = .black
            box4.backgroundColor = .black
            box5.backgroundColor = .black
            box6.backgroundColor = .black
            box7.backgroundColor = .black
            box8.backgroundColor = .black
            box9.backgroundColor = .red
        }
    }
    
    
}
