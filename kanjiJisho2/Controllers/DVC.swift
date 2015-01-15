//
//  DVC.swift
//  kanjiJisho2
//
//  Created by Alexandra Matreata on 12/30/14.
//  Copyright (c) 2014 tt. All rights reserved.
//
  
import UIKit

public class DVC: UIViewController {

//view detaillee sur un kanji recherche
    
    @IBOutlet weak var trans: UILabel!
    @IBOutlet weak var k: UILabel!
    @IBOutlet weak var o: UILabel!
    @IBOutlet weak var str: UILabel!
    @IBOutlet weak var rad: UILabel!
    @IBOutlet weak var lbl: UILabel!
    
    public var semn : String = ""
    public var strokes : String = ""
    public var on : String = ""
    public var kun : String = ""
    public var translation : String = ""
    public var radical : String = ""

    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = semn
        rad.text = radical
        str.text = strokes
        o.text = on
        k.text = kun
        trans.text = translation
        }

    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
