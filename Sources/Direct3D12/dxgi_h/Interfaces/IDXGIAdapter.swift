/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIAdapter: DGIObject {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIAdapter {
    typealias RawValue = WinSDK.IDXGIAdapter
}
extension DGIAdapter.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIAdapter}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DGIAdapter")
public typealias IDXGIAdapter = DGIAdapter

#endif
