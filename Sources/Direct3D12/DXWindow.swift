/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public protocol DXWindowDelegate: MSWindowDelegate {
    
}

open class DXWindow: MSWindow {
    public var device: D3DDevice {
        return MSApplication.shared.directX.device
    }
    internal var commandQueue: D3DCommandQueue! = nil
    internal var commandAllocator: D3DCommandAllocator! = nil
    internal var commandList: D3DCommandList! = nil
    internal var swapChain: DGISwapChain! = nil

    public required init(frame: MSRect, style: MSWindowStyle = .standard) {
        super.init(frame: frame, style: style)
        do {
            try prepareDirectX()
        }catch{
            print(error)
            do {
                try self.device.checkDeviceRemovedReason()
            }catch{
                print(error)
            }
            fatalError()
        }
    }

    private func prepareDirectX() throws {
        self.commandQueue = try device.createCommandQueue(type: .direct, priority: .normal)
        self.commandAllocator = try device.createCommandAllocator(type: .direct)
        self.commandList = try device.createCommandList(type: .direct, commandAllocator: self.commandAllocator)

        let factory = MSApplication.shared.directX.factory
        let refreshRate = DGIRational(numerator: 60, denominator: 1)
        self.swapChain = try factory.createSwapChain(window: hWnd,
                                                     format: .r8g8b8a8Unorm,
                                                     bufferCount: 2,
                                                     refreshRate: refreshRate,
                                                     commandQueue: commandQueue)
    }

    private func reshape() {

    }

    internal var dxWindowDelegate: DXWindowDelegate? {delegate as? DXWindowDelegate}
}
