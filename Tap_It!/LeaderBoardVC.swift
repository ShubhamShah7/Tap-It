//
//  LeaderBoardVC.swift
//  Tap_It!
//
//  Created by DCS on 13/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LeaderBoardVC: UIViewController {
    
    let usertoken = UserDefaults.standard.string(forKey: "usertoken")
    let username = UserDefaults.standard.string(forKey: "username")
    let score = UserDefaults.standard.string(forKey: "score")
    
    private let nameLabel:UILabel = {
       let lbl = UILabel()
        lbl.text  = "Player Name"
        lbl.font = .boldSystemFont(ofSize:25)
        lbl.textColor  = .black
        
        return lbl
    }()
    
    private let scoreLabel:UILabel = {
        let lbl = UILabel()
        lbl.text  = "Score"
        lbl.font = .boldSystemFont(ofSize:25)
        lbl.textColor  = .black
        
        return lbl
    }()
    
    private let txtName:UILabel = {
        let lbl = UILabel()
        lbl.text  = ""
        lbl.font = .boldSystemFont(ofSize:25)
        lbl.textColor  = .red
        
        return lbl
    }()
    
    private let txtScore:UILabel = {
        let lbl = UILabel()
        lbl.text  = ""
        lbl.font = .boldSystemFont(ofSize:25)
        lbl.textColor  = .red
        lbl.textAlignment = .center
        return lbl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LeaderBoard"
        view.backgroundColor = .yellow

        view.addSubview(nameLabel)
        view.addSubview(txtName)
        view.addSubview(scoreLabel)
        view.addSubview(txtScore)
        txtName.text = username
        txtScore.text = score
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameLabel.frame = CGRect(x:20, y: view.safeAreaInsets.top+30, width: 190, height: 50)
        scoreLabel.frame = CGRect(x:250, y:view.safeAreaInsets.top+30, width: 190, height: 50)
        txtName.frame = CGRect(x:20, y:nameLabel.bottom+15, width: 150, height: 50)
        txtScore.frame = CGRect(x:250, y:scoreLabel.bottom+15, width: 70, height: 50)
    }

}
