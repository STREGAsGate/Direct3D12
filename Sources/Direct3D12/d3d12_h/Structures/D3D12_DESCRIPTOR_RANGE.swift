/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes a descriptor range.
public struct D3DDescriptorRange {
    public typealias RawValue = WinSDK.D3D12_DESCRIPTOR_RANGE
    internal var rawValue: RawValue

    /// A D3D12_DESCRIPTOR_RANGE_TYPE-typed value that specifies the type of descriptor range.
    public var `type`: D3DDescriptorRangeType {
        get {
            return D3DDescriptorRangeType(rawValue.RangeType)
        }
        set {
            rawValue.RangeType = newValue.rawValue
        }
    }

    /// The number of descriptors in the range. Use -1 or UINT_MAX to specify an unbounded size. If a given descriptor range is unbounded, then it must either be the last range in the table definition, or else the following range in the table definition must have a value for OffsetInDescriptorsFromTableStart that is not D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND.
    public var descriptorCount: UInt32 {
        get {
            return rawValue.NumDescriptors
        }
        set {
            rawValue.NumDescriptors = newValue
        }
    }

    /// The base shader register in the range. For example, for shader-resource views (SRVs), 3 maps to ": register(t3);" in HLSL.
    public var baseShaderRegister: UInt32 {
        get {
            return rawValue.BaseShaderRegister
        }
        set {
            rawValue.BaseShaderRegister = newValue
        }
    }

    /// The register space. Can typically be 0, but allows multiple descriptor arrays of unknown size to not appear to overlap. For example, for SRVs, by extending the example in the BaseShaderRegister member description, 5 maps to ": register(t3,space5);" in HLSL.
    public var registerSpace: UInt32 {
        get {
            return rawValue.RegisterSpace
        }
        set {
            rawValue.RegisterSpace = newValue
        }
    }

    /// The offset in descriptors, from the start of the descriptor table which was set as the root argument value for this parameter slot. This value can be D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND, which indicates this range should immediately follow the preceding range.
    public var offsetInDescriptorsFromTableStart: UInt32 {
        get {
            return rawValue.OffsetInDescriptorsFromTableStart
        }
        set {
            rawValue.OffsetInDescriptorsFromTableStart = newValue
        }
    }

    /** Describes a descriptor range.
    - parameter type: A D3D12_DESCRIPTOR_RANGE_TYPE-typed value that specifies the type of descriptor range.
    - parameter descriptorCount: The number of descriptors in the range. Use -1 or UINT_MAX to specify an unbounded size. If a given descriptor range is unbounded, then it must either be the last range in the table definition, or else the following range in the table definition must have a value for OffsetInDescriptorsFromTableStart that is not D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND.
    - parameter baseShaderRegister: The base shader register in the range. For example, for shader-resource views (SRVs), 3 maps to ": register(t3);" in HLSL.
    - parameter offsetInDescriptorsFromTableStart: The offset in descriptors, from the start of the descriptor table which was set as the root argument value for this parameter slot. This value can be D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND, which indicates this range should immediately follow the preceding range.
    */
    public init(type: D3DDescriptorRangeType, 
                descriptorCount: UInt32,
                baseShaderRegister: UInt32,
                offsetInDescriptorsFromTableStart: UInt32) {
        self.rawValue = RawValue()
        self.descriptorCount = descriptorCount
        self.baseShaderRegister = baseShaderRegister
        self.offsetInDescriptorsFromTableStart = offsetInDescriptorsFromTableStart
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDescriptorRange")
public typealias D3D12_DESCRIPTOR_RANGE = D3DDescriptorRange

#endif
