//
//  xmlParser.swift
//  transformareTastatura
//
//  Created by Alexandra Matreata on 11/22/14.
//  Copyright (c) 2014 tt. All rights reserved.
// 
import Foundation
import UIKit

public class xmlParser: NSObject, NSXMLParserDelegate {
    
//parser pour le fichier xml avec hiragana
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var semn = NSMutableString()
    var citire = NSMutableString()
    
    func initWithURL(url :NSURL) -> AnyObject {
        beginParsing(url)
        return self
    }
    
    
    
    func beginParsing(xmlUrl :NSURL) {
        posts = []
        parser = NSXMLParser(contentsOfURL: xmlUrl)!
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.delegate = self
        
        parser.parse()
    }
    
    func allPosts() -> NSMutableArray {
        return posts
    }
    
    
    public func parserDidStartDocument(parser: NSXMLParser!) {
        
    }
    
    public func parserDidEndDocument(parser: NSXMLParser!) {
        
    }
  public   
    func parser(_parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        
    }
    
    func parser(parser: NSXMLParser!,didStartElement elementName: String!, namespaceURI: String!, qualifiedName : String!, attributes attributeDict: NSDictionary!) {
        
        element = elementName
        
        if (elementName as NSString).isEqualToString("silaba") {
            elements = NSMutableDictionary.alloc()
            elements = [:]
            semn = NSMutableString.alloc()
            semn = ""
            citire = NSMutableString.alloc()
            citire = ""
        }
    }
    
    public func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        
        if (elementName as NSString).isEqualToString("silaba") {
            if semn != "" {
                elements.setObject(semn, forKey: "semn")
            }
            if citire != ""
            {elements.setObject(citire, forKey: "citire")}
            
            posts.addObject(elements)
        }
    }
    
    public func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if element.isEqualToString("semn") {
            semn.appendString(string)
        } else if element.isEqualToString("citire") {
            citire.appendString(string)
        }
    }
    
    
}
