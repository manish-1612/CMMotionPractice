//
//  ViewController.swift
//  CMMotionPractice
//
//  Created by Manish Kumar on 18/05/16.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var testImageView: UIImageView!
    
    
    
    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createMotionManager()
    }
    
    override func viewWillAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewWillDisappear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidDisappear(animated: Bool) {
        //do as per your desire
    }
    
    // MARK :- Memory warning handling
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createMotionManager(){
        
        let manager = CMMotionManager()
        if manager.gyroAvailable{
            print("manager : \(manager)")
            
            if manager.deviceMotionAvailable {
                let queue = NSOperationQueue()
                manager.deviceMotionUpdateInterval = 0.01
                manager.startDeviceMotionUpdatesToQueue(queue, withHandler:
                    {data, error in
                        if data != nil{
                            let rotation = atan2(data!.gravity.x, data!.gravity.y) - M_PI
                            self.testImageView.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
                        }else{
                            return
                        }
                    })
                }
            }else{
                print("gyro not available")
        }
    }
}

