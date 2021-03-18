/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.14393)
public class VersionedRootSignatureDeserializer: IUnknown {
    
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.14393)
@available(*, unavailable, renamed: "VersionedRootSignatureDeserializer")
public typealias ID3D12VersionedRootSignatureDeserializer = VersionedRootSignatureDeserializer

@available(Windows, introduced: 10.0.14393)
public extension VersionedRootSignatureDeserializer {

}

#endif