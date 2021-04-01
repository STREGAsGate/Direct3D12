/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the root signature 1.0 layout of a descriptor table as a collection of descriptor ranges that are all relative to a single base descriptor handle.
public struct D3DRootDescriptorTable {
    public typealias RawValue = WinSDK.D3D12_ROOT_DESCRIPTOR_TABLE

    /// An array of D3D12_DESCRIPTOR_RANGE structures that describe the descriptor ranges.
    public var descriptorRanges: [D3DDescriptorRange]

    /** Describes the root signature 1.0 layout of a descriptor table as a collection of descriptor ranges that are all relative to a single base descriptor handle.
    - parameter descriptorRanges: An array of D3D12_DESCRIPTOR_RANGE structures that describe the descriptor ranges.
    */
    public init(descriptorRanges: [D3DDescriptorRange]) {
        self.descriptorRanges = descriptorRanges
    }

    internal func withUnsafeRawValue<ResultType>(_ body: (RawValue)->ResultType) -> ResultType {
        descriptorRanges.map({$0.rawValue}).withUnsafeBufferPointer {
            let rawValue = RawValue(NumDescriptorRanges: UInt32(descriptorRanges.count), pDescriptorRanges: $0.baseAddress)
            return body(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRootDescriptorTable")
public typealias D3D12_ROOT_DESCRIPTOR_TABLE = D3DRootDescriptorTable

#endif
