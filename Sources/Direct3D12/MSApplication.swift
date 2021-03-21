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

public final class MSApplication {
    public private(set) var delegate: MSApplicationDelegate? = nil
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
            if self.windowCount == 0 {
                PostQuitMessage(0)
            }
            self.run()
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
