//
//  ViewController.swift
//  kanjiJisho2
//
//  Created by Alexandra Matreata on 12/30/14.
//  Copyright (c) 2014 tt. All rights reserved.
//
import Foundation 
import UIKit
 
public class ViewController: UIViewController, UITextFieldDelegate {
//view pour la recherche directe
    
    //variables pour traitement du texte introduit par clavier
    var scris = ""
    var descris = ""
    var dataArray : NSArray = []
    var i = 0
    var j = 0
    var cheie = ""
    var dict : Dictionary<String, String> = ["":""]
    var val : String!
    
    
    var tfText = String()
    
    @IBAction func searchButton(sender: AnyObject) {
        
        traitementTexte()
        
    }
    @IBOutlet weak public var tf: UITextField!
    @IBOutlet weak var eng: UITextField!
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        tf.resignFirstResponder()
        eng.resignFirstResponder()
        return true
    }
    
    
    var scrisfinal : String!
    let myRegexcitire = "[a-z]{1,3}"
    var aux = ""
    //regex pour extraction des espaces
    let myRegex = "(.){1}"
    //regex pour les syllabes
    var regex = NSRegularExpression(pattern:"[bdf-hj-np-tv-z]{1,2}[aeiou]?", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
    
    //regex pour n simple
    var regexN = NSRegularExpression(pattern:"([n][bdf-hj-np-tv-z])|[n]$", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
    
    //regex pour vocales simples
    var regexVoc = NSRegularExpression(pattern:"([aeiou][aeiou])|(^[aeiou])", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
    
    
    // function pour le traitement du texte introduit au clavier
    public func traitementTexte()
    {
        if(tf.text != "")
        {
            tfText = tf.text
            var j = dataArray.count - 1
            scrisfinal = tf.text
            
            for i in 0...j
            {
                
                aux = dataArray.objectAtIndex(i).objectForKey("semn") as String
                cheie = dataArray.objectAtIndex(i).objectForKey("citire") as String
                
                var match = aux.rangeOfString(myRegex, options: .RegularExpressionSearch)
                var substaux = aux.substringWithRange(match!)
                
                match = cheie.rangeOfString(myRegexcitire, options: .RegularExpressionSearch)
                var substcheie = cheie.substringWithRange(match!)
                
               scrisfinal = scrisfinal.stringByReplacingOccurrencesOfString(substcheie, withString: substaux, options: nil, range: nil)
                
            }
            tf.text = scrisfinal
        }
    }
    
    var x = 0
    var c = 0
    
    
        
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tf.delegate = self
        eng.delegate = self
        
        var cale = NSBundle.mainBundle().pathForResource("hiraganaeu", ofType: "xml")
        var url:NSURL = NSURL(fileURLWithPath: cale!)!
        var parser : xmlParser = xmlParser.alloc().initWithURL(url) as xmlParser
        
        
        dataArray = parser.posts
        j = dataArray.count - 1
        for i in 0...j
        {
            aux = dataArray.objectAtIndex(i).objectForKey("semn") as String
            cheie = dataArray.objectAtIndex(i).objectForKey("citire") as String
            dict[cheie] = aux
            
        }
        
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //transmission du texte recherche au table view controller
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var tvc:TVC
        tvc = segue.destinationViewController as TVC
        if(tf.text != "")
        {tvc.search = tf.text}
        if(eng.text != "")
        {tvc.search = eng.text}
    }
}

