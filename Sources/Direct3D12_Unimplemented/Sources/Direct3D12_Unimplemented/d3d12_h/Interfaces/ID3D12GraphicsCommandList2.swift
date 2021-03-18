/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.16299)
public extension GraphicsCommandList {
    
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "GraphicsCommandList")
public typealias ID3D12GraphicsCommandList2 = GraphicsCommandList 

@available(Windows, introduced: 10.0.16299)
public extension  GraphicsCommandList {

}

#endif
