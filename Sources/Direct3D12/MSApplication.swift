/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

public protocol MSApplicationDelegate: AnyObject {
    func application(_ application: MSApplication, didFinishLaunchingWithOption options: Dictionary<String,Any>)
    func applicationWillQuit(_ application: MSApplication)
}

public struct DirectX {
    public let factory: DGIFactory
    public let device: D3DDevice

    internal init() {
        do {
            self.factory = try DGIFactory()
            self.device = try D3DDevice(minimumFeatureLevel: .v9_3)
        }catch{
            print(error)
            fatalError("A DGIFactory and D3DDevice are required but one could not be created.")
        }
    }
}

public final class MSApplication {
    public private(set) var delegate: MSApplicationDelegate? = nil

    public var quitOnLastWindowClosed: Bool = true

    public let directX = DirectX()

    private init() {}

    private var windowCount = 0
    internal func incrementWindowCount() {
        DispatchQueue.main.async {
            self.windowCount += 1
        }
    }

    internal func decrementWindowCount() {
        DispatchQueue.main.async {
            self.windowCount -= 1
        }
    }

    private func run() {
        DispatchQueue.main.async {
            if self.quitOnLastWindowClosed && self.windowCount == 0 {
                PostQuitMessage(0)
                
                DispatchQueue.main.async {
                    self.delegate?.applicationWillQuit(self)
                    
                    //Give everything a moment to respond to quit
                    DispatchQueue.main.async {
                        exit(0)
                    }
                }
            }else{
                self.run()
            }
        }
    }

    public private(set) static var shared: MSApplication = MSApplication()
    public class func run(withDelegate delegate: MSApplicationDelegate) -> Never {
        MSApplication.shared.delegate = delegate
        DispatchQueue.main.async {
            MSApplication.shared.delegate?.application(MSApplication.shared, didFinishLaunchingWithOption: [:])
            MSApplication.shared.run()
        }
        return dispatchMain()
    }
}
