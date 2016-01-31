//
//  ViewController.swift
//  Graph
//
//  Created by Franklin Schrans on 31/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nodes = [UIView]()
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: self.view.frame.height*2, height: self.view.frame.width*2)
        view.addSubview(scrollView)
        
        addNode(x: view.bounds.width/2, y: view.bounds.height/2)
    }
        
    func addNode(x x: CGFloat, y: CGFloat) {
        let frame = CGRectMake(x, y, 30, 30)
        random()
        
        let node = UIView(frame: frame)
        node.layer.cornerRadius = node.frame.width/2
        node.backgroundColor = UIColor.blackColor()
        scrollView.addSubview(node)
        
        if let lastNode = nodes.last {
            drawLine(node, lastNode)
        }
        
        nodes.append(node)
    }
    
    func drawLine(node1: UIView, _ node2: UIView) {
        let frame = CGRectMake(node1.frame.origin.x, node1.frame.origin.y, 10, <#T##height: CGFloat##CGFloat#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

