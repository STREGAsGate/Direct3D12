/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

public enum LaunchOption: Int, Hashable, Equatable {
    /// Nothing. This won't ever be in the options dictionary. Delete once there is an option
    case none = 0
}

public protocol MSApplicationDelegate: AnyObject {
    func application(_ application: MSApplication, didFinishLaunchingWithOptions options: Dictionary<LaunchOption, Any>)
    func applicationWillQuit(_ application: MSApplication)
}

public struct DirectX {
    public let factory: DGIFactory
    public let device: D3DDevice

    internal init() {
        do {
            #if DEBUG
            try D3DDebug().enableDebugLayer()
            #endif

            self.factory = try DGIFactory()
            self.device = try factory.createDefaultDevice()
        }catch{
            print(error)
            fatalError("A DGIFactory and D3DDevice are required but one could not be created.")
        }
    }
}

public final class MSApplication {
    public private(set) var delegate: MSApplicationDelegate? = nil

    public var quitOnLastWindowClosed: Bool = true

    public lazy var directX = DirectX()

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
                    //Give everything an extra loop to respond to the quit message
                    DispatchQueue.main.async {
                        exit(0)
                    }
                }
            }else{
                self.run()
            }
        }
    }

    public static let shared: MSApplication = MSApplication()
    public class func run(withDelegate delegate: MSApplicationDelegate) -> Never {
        DispatchQueue.main.async {
            _ = SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2)
            MSApplication.shared.delegate = delegate
            MSApplication.shared.delegate?.application(MSApplication.shared, didFinishLaunchingWithOptions: [:])
            MSApplication.shared.run()
        }
        return dispatchMain()
    }
}
