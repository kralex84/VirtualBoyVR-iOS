//
//  HomeViewController.swift
//  VirtualBoyVR-iOS
//
//  Created by Tom Kidd on 8/30/18.
//  Copyright © 2018 Tom Kidd. All rights reserved.
//

import UIKit
import PVSupport

class HomeViewController: UIViewController {
    
    var games = [PVGame]()
    var selectedGame: PVGame!
    @IBOutlet weak var gamesTable: UITableView!
    @IBOutlet weak var settingsGear: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsGear.setImage(UIImage(named: "gear")!.withRenderingMode(.alwaysTemplate), for: .normal)
        settingsGear.tintColor = UIColor.black
        
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        gamesTable.backgroundColor = UIColor.black
        gamesTable.separatorColor = Utilities.hexStringToUIColor(hex: "#cc0000")
        
        PVControllerManager.shared()
        PVSettingsModel.sharedInstance()
        
        let defaults = UserDefaults()
        let x = defaults.integer(forKey: "sbs")
        
        if x == 0 {
            defaults.set(60, forKey: "sbs")
        }
        
        let y = defaults.float(forKey: "scale")
        
        if y == 0 {
            defaults.set(Float(UIScreen.main.scale), forKey: "scale")
        }

        // todo: make this a plist or something
        games = []
        games.append(pvGen(title: "Reality Boy demo", romPath: "Reality Boy Demo 1 (PD).vb", cover: "Reality Boy Demo 1 (PD)"))
        games.append(pvGen(title: "3D Tetris", romPath: "3D_Tetris_(U)_[!].vb", cover: "3D_Tetris_(U)"))
        games.append(pvGen(title: "Galactic Pinball", romPath: "Galactic_Pinball_(JU)_[!].vb", cover: "Galactic_Pinball_(JU)"))
        games.append(pvGen(title: "Golf", romPath: "Golf_(U)_[!].vb", cover: "Golf_(U)"))
        games.append(pvGen(title: "Insane Mouse Mansion", romPath: "Insane_Mouse_Mansion_(J)_[!].vb", cover: "Insane_Mouse_Mansion_(J)"))
        games.append(pvGen(title: "Jack Bros (Japan)", romPath: "Jack_Bros_(J)_[!].vb", cover: "Jack_Bros_(J)"))
        games.append(pvGen(title: "Jack Bros (USA)", romPath: "Jack_Bros_(U)_[!].vb", cover: "Jack_Bros_(U)"))
        games.append(pvGen(title: "Mario's Tennis", romPath: "Mario's_Tennis_(JU)_[a1].vb", cover: "Marios_Tennis_(JU)"))
        games.append(pvGen(title: "Mario Clash", romPath: "Mario_Clash_(JU)_[!].vb", cover: "Mario_Clash_(JU)"))
        games.append(pvGen(title: "Nester's Funky Bowling", romPath: "Nester's_Funky_Bowling_(U).vb", cover: "Nesters_Funky_Bowling_(U)"))
        games.append(pvGen(title: "Panic Bomber (Japan)", romPath: "Panic_Bomber_(J)_[!].vb", cover: "Panic_Bomber_(J)"))
        games.append(pvGen(title: "Panic Bomber (USA)", romPath: "Panic_Bomber_(U)_[!].vb", cover: "Panic_Bomber_(U)"))
        games.append(pvGen(title: "Red Alarm (Japan)", romPath: "Red_Alarm_(J)_[!].vb", cover: "Red_Alarm_(J)"))
        games.append(pvGen(title: "Red Alarm (USA)", romPath: "Red_Alarm_(U)_[!].vb", cover: "Red_Alarm_(U)"))
        games.append(pvGen(title: "SD Gundam - Dimension War", romPath: "SD_Gundam_-_Dimension_War_(J).vb", cover: "SD_Gundam_-_Dimension_War_(J)"))
        games.append(pvGen(title: "Space Invaders - Virtual Collection", romPath: "Space_Invaders_-_Virtual_Collection_(J).vb", cover: "Space_Invaders_-_Virtual_Collection_(J)"))
        games.append(pvGen(title: "Space Squash", romPath: "Space_Squash_(J)_[!].vb", cover: "Space_Squash_(J)"))
        games.append(pvGen(title: "T&E Virtual Golf", romPath: "T&E_Virtual_Golf_(J)_[!].vb", cover: "TE_Virtual_Golf_(J)"))
        games.append(pvGen(title: "Teleroboxer", romPath: "Teleroboxer_(JU)_[!].vb", cover: "Teleroboxer_(JU)"))
        games.append(pvGen(title: "V Tetris", romPath: "V_Tetris_(J)_[!].vb", cover: "V_Tetris_(J)"))
        games.append(pvGen(title: "Vertical Force (Japan)", romPath: "Vertical_Force_(J)_[!].vb", cover: "Vertical_Force_(J)"))
        games.append(pvGen(title: "Vertical Force (USA)", romPath: "Vertical_Force_(U)_[!].vb", cover: "Vertical_Force_(U)"))
        games.append(pvGen(title: "Virtual Boy Wario Land", romPath: "Virtual_Boy_Wario_Land_(JU)_[!].vb", cover: "Virtual_Boy_Wario_Land_(JU)"))
        games.append(pvGen(title: "Virtual Fishing", romPath: "Virtual_Fishing_(J)_[!].vb", cover: "Virtual_Fishing_(J)"))
        games.append(pvGen(title: "Virtual Lab", romPath: "Virtual_Lab_(J).vb", cover: "Virtual_Lab_(J)"))
        games.append(pvGen(title: "Virtual League Baseball", romPath: "Virtual_League_Baseball_(U).vb", cover: "Virtual_League_Baseball_(U)"))
        games.append(pvGen(title: "Virtual Pro Yakyuu '95", romPath: "Virtual_Pro_Yakyuu_'95_(J)_[!].vb", cover: "Virtual_Pro_Yakyuu_95_(J)"))
        games.append(pvGen(title: "Waterworld", romPath: "Waterworld_(U)_[!].vb", cover: "Waterworld_(U)"))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func settings(_ sender: Any) {
        self.performSegue(withIdentifier: "SettingsSegue", sender: self)
    }
    
    func pvGen(title: String, romPath: String, cover: String) -> PVGame {
        let game = PVGame()
        game.title = title
        game.romPath = Bundle.main.resourcePath! + "/roms/" + romPath
        game.originalArtworkURL = cover
        game.systemIdentifier = "com.provenance.vb"
        return game
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = Utilities.hexStringToUIColor(hex: "#cc0000")
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:Utilities.hexStringToUIColor(hex: "#cc0000"),
                              NSAttributedStringKey.font: UIFont(name: "VirtualLogo", size: 23)!]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes;
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = gamesTable.indexPathForSelectedRow {
            gamesTable.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "StartGameSegue" {
            (segue.destination as! PVEmulatorViewController).game = selectedGame
            
            let config = PVEmulatorConfiguration.sharedInstance()
            
            (segue.destination as! PVEmulatorViewController).batterySavesPath = config.batterySavesPath(forROM: selectedGame.romPath)
            (segue.destination as! PVEmulatorViewController).biosPath = config.biosPath(forSystemID: selectedGame.systemIdentifier)
            (segue.destination as! PVEmulatorViewController).saveStatePath = config.saveStatePath(forROM: selectedGame.romPath)
            (segue.destination as! PVEmulatorViewController).systemID = selectedGame.systemIdentifier
            (segue.destination as! PVEmulatorViewController).modalTransitionStyle = .crossDissolve
        } else if segue.identifier == "SettingsSegue" {
            // settings stuff
        }
        


        
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = games[indexPath.row]
        performSegue(withIdentifier: "StartGameSegue", sender: self)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.highlightedTextColor = UIColor.black
        
        cell?.textLabel?.text = games[indexPath.row].title
        cell?.textLabel?.textColor = UIColor.white
        cell?.backgroundColor = UIColor.black
        cell?.imageView?.image = UIImage(contentsOfFile: Bundle.main.resourcePath! + "/covers/" + games[indexPath.row].originalArtworkURL + ".jpg")
        
        let selectionColor = UIView(frame: CGRect.zero)
        selectionColor.backgroundColor = Utilities.hexStringToUIColor(hex: "#cc0000")
        cell?.selectedBackgroundView = selectionColor
        
        return cell!
    }
    
    
}
