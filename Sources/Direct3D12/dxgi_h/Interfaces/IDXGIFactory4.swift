/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public extension DGIFactory {
    
    /// Provides an adapter which can be provided to D3D12CreateDevice to use the WARP renderer.
    func enumWarpAdapter() throws -> DGIAdapter {
        return try perform(as: RawValue.self) {pThis in
            var riid = DGIAdapter.interfaceID
            var ppvAdapter: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.EnumWarpAdapter(pThis, &riid, &ppvAdapter).checkResult()
            guard let v = DGIAdapter(winSDKPointer: ppvAdapter) else {throw Error(.invalidArgument)}
            return v
        }
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIFactory")
public typealias IDXGIFactory4 = DGIFactory 

public extension DGIFactory {
    @available(*, unavailable, renamed: "enumWarpAdapter()")
    func EnumWarpAdapter(_ riid: Any,
                         _ ppvAdapter: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
