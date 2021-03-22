/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIFactory: DGIObject {
    
    public init() throws {
        var riid = DGIFactory.interfaceID
        var ppFactory: UnsafeMutableRawPointer?
        try WinSDK.CreateDXGIFactory1(&riid, &ppFactory).checkResult()
        guard let p = ppFactory else {throw Error(.invalidArgument)}
        super.init(win32Pointer: p)
    }
    override init(win32Pointer pointer: UnsafeMutableRawPointer?) {
        super.init(win32Pointer: pointer)
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIFactory {// Always use Factory2
    typealias RawValue = WinSDK.IDXGIFactory2
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DGIFactory.RawValue {// Always use Factory2
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIFactory2}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIFactory")
public typealias IDXGIFactory = DGIFactory

public extension DGIFactory {
    @available(*, unavailable, renamed: "createSwapChain(destiption:window:fullScreen:commandQueue:)")
    func CreateSwapChain(_ pDevice: Any,
                         _ pDesc: Any,
                         _ ppSwapChain: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
