//
//  ViewController.swift
//  Float vs Double
//
//  Created by Kozma Benedek on 2018. 02. 08..
//  Copyright © 2018. Kozma Benedek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let count = 1_000_000
        let floatArray = ContiguousArray<(Float32, Float32)>(repeating: (Float32.pi, Float32(M_E)), count: count)
        let doubleArray = ContiguousArray<(Float64, Float64)>(repeating: (Float64.pi, Float64(M_E)), count: count)
        let time1 = DispatchTime.now()
        floatArray.forEach {
            $0 * $1
        }
        let time2 = DispatchTime.now()
        doubleArray.forEach({
            $0 * $1
        })
        let time3 = DispatchTime.now()
        let floatPerformance = Double(time2.rawValue - time1.rawValue)/Double(count)
        let doublePerformance = Double(time3.rawValue - time2.rawValue)/Double(count)
        print("Float32: ", floatPerformance)
        print("Float64: ", doublePerformance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

