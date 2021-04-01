/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the layout of a root signature version 1.0.
public struct D3DRootSignatureDescription {
    public typealias RawValue = WinSDK.D3D12_ROOT_SIGNATURE_DESC
    internal var rawValue: RawValue

    /// An array of D3D12_ROOT_PARAMETER structures for the slots in the root signature.    
    public var parameters: [D3DRootParameter] {
        get {
            guard rawValue.NumParameters > 0 else {return []}
            let buffer = UnsafeBufferPointer(start: rawValue.pParameters, count: Int(rawValue.NumParameters))
            return buffer.map({D3DRootParameter($0)})
        }
        set {
            parametersRef = newValue.map({$0.rawValue})
            parametersRef.withUnsafeBufferPointer {
                rawValue.pParameters = $0.baseAddress
            }
            rawValue.NumParameters = UInt32(newValue.count)
        }
    }
    #warning("Need to refactor all array setters like this...")
    private var parametersRef: [D3DRootParameter.RawValue]! = nil 

    /// Pointer to one or more D3D12_STATIC_SAMPLER_DESC structures.
    public var staticSamplers: [D3DStaticSamplerDecsription]? {
        get {
            guard rawValue.NumStaticSamplers > 0 else {return nil}
            return withUnsafePointer(to: rawValue.pStaticSamplers) {p in
                let buffer = UnsafeBufferPointer(start: p, count: Int(rawValue.NumStaticSamplers))
                return buffer.map({D3DStaticSamplerDecsription($0!.pointee)})
            }
        }
        set {
            if let newValue = newValue, newValue.isEmpty == false {
                let rawValues = newValue.map({$0.rawValue})
                rawValues.withUnsafeBufferPointer {
                    rawValue.pStaticSamplers = $0.baseAddress!
                }
                rawValue.NumStaticSamplers = UInt32(newValue.count)
            }else{
                rawValue.pStaticSamplers = nil
                rawValue.NumStaticSamplers = 0
            }
        }
    }

    /// A combination of D3D12_ROOT_SIGNATURE_FLAGS-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the root signature layout.
    public var flags: D3DRootSignatureFlags {
        get {
            return D3DRootSignatureFlags(rawValue.Flags)
        }
        set {
            rawValue.Flags = newValue.rawType
        }
    }

    /** Describes the layout of a root signature version 1.0.
    - parameter parameters: An array of D3D12_ROOT_PARAMETER structures for the slots in the root signature.
    - parameter staticSamplers: Pointer to one or more D3D12_STATIC_SAMPLER_DESC structures.
    - parameter flags: A combination of D3D12_ROOT_SIGNATURE_FLAGS-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the root signature layout.
    */
    public init(parameters: [D3DRootParameter], staticSamplers: [D3DStaticSamplerDecsription]?, flags: D3DRootSignatureFlags) {
        self.rawValue = RawValue()
        self.parameters = parameters
        self.staticSamplers = staticSamplers
        self.flags = flags
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRootSignatureDescription")
public typealias D3D12_ROOT_SIGNATURE_DESC = D3DRootSignatureDescription

#endif
