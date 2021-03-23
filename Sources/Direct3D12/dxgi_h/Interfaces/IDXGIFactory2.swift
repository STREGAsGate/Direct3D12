/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public extension DGIFactory {
    
    /** Creates a swap chain that is associated with an HWND handle to the output window for the swap chain.
    - parameter description: A pointer to a DXGI_SWAP_CHAIN_DESC1 structure for the swap-chain description. This parameter cannot be NULL.
    - parameter window: The HWND handle that is associated with the swap chain that CreateSwapChainForHwnd creates. This parameter cannot be NULL.
    - parameter fullScreen: A pointer to a DXGI_SWAP_CHAIN_FULLSCREEN_DESC structure for the description of a full-screen swap chain. You can optionally set this parameter to create a full-screen swap chain. Set it to NULL to create a windowed swap chain.
    - parameter commandQueue: For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue). This parameter cannot be NULL.
    - returns: A pointer to a variable that receives a pointer to the IDXGISwapChain1 interface for the swap chain that CreateSwapChainForHwnd creates.
    */
    func createSwapChain(description: DGISwapChainDescription1, 
                         window: HWND,
                         fullScreen: DGISwapChainFullscreenDescription?, 
                         commandQueue: D3DCommandQueue) throws -> DGISwapChain {
        return try perform(as: RawValue.self) {pThis in 
            let pDevice = try commandQueue.perform(as: IUnknown.RawValue.self) {$0}
            let hWnd = window
            var pDesc = description.rawValue
            
            var ppSwapChain: UnsafeMutablePointer<DGISwapChain.RawValue>?
            if var pFullscreenDesc = fullScreen?.rawValue {
                try pThis.pointee.lpVtbl.pointee.CreateSwapChainForHwnd(pThis, pDevice, hWnd, &pDesc, &pFullscreenDesc, nil, &ppSwapChain).checkResult()
            }else{
                try pThis.pointee.lpVtbl.pointee.CreateSwapChainForHwnd(pThis, pDevice, hWnd, &pDesc, nil, nil, &ppSwapChain).checkResult()
            }
            guard let v = DGISwapChain(win32Pointer: ppSwapChain) else {throw Error(.invalidArgument)}
            return v
        }
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIFactory")
public typealias IDXGIFactory2 = DGIFactory 

public extension DGIFactory {
    @available(*, unavailable, renamed: "createSwapChain(destiption:window:fullScreen:commandQueue:)")
    func CreateSwapChainForHwnd(_ pDevice: Any,
                                _ hWnd: Any,
                                _ pDesc: Any,
                                _ pFullscreenDesc: Any?,
                                _ pRestrictToOutput: Any,
                                _ ppSwapChain: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
