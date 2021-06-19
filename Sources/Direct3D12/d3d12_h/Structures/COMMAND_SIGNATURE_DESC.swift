/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the arguments (parameters) of a command signature.
public struct D3DCommandSignatureDescription {
    public typealias RawValue = WinSDK.D3D12_COMMAND_SIGNATURE_DESC
    internal var rawValue: RawValue

    /// An array of D3D12_INDIRECT_ARGUMENT_DESC structures, containing details of the arguments, including whether the argument is a vertex buffer, constant, constant buffer view, shader resource view, or unordered access view.
    public var argumentDescriptors: [D3DIndirectArgumentDescription] {
        get {
            guard rawValue.NumArgumentDescs > 0 else {return []}
            return withUnsafePointer(to: rawValue.pArgumentDescs) {p in
                let buffer = UnsafeBufferPointer(start: p, count: Int(rawValue.NumArgumentDescs))
                return buffer.map({D3DIndirectArgumentDescription($0!.pointee)})
            }
        }
        set {
            self.rawValue.ByteStride = UInt32(MemoryLayout<D3DIndirectArgumentDescription.RawValue>.stride)
            self.rawValue.NumArgumentDescs = UInt32(newValue.count)
            _argumentDescriptors = newValue.map({$0.rawValue})
            _argumentDescriptors.withUnsafeBufferPointer {pArgumentDescs in
                self.rawValue.pArgumentDescs = pArgumentDescs.baseAddress
            }
        }
    }
    private var _argumentDescriptors: [D3DIndirectArgumentDescription.RawValue]! = nil

    /// For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to Multi-adapter systems.
    public var multipleAdapterNodeMask: UInt32 {
        get {
            return self.rawValue.NodeMask
        }
        set {
            self.rawValue.NodeMask = newValue
        }
    }

    /** Describes the arguments (parameters) of a command signature.
    - parameter argumentDescriptors: An array of D3D12_INDIRECT_ARGUMENT_DESC structures, containing details of the arguments, including whether the argument is a vertex buffer, constant, constant buffer view, shader resource view, or unordered access view.
    - parameter multipleAdapterNodeMask: For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the device's physical adapters) for which the command signature is to apply. Each bit in the mask corresponds to a single node. Refer to Multi-adapter systems.
    */
    public init(argumentDescriptors: [D3DIndirectArgumentDescription], multipleAdapterNodeMask: UInt32 = 0) {
        self.rawValue = RawValue()
        self.argumentDescriptors = argumentDescriptors
        self.multipleAdapterNodeMask = multipleAdapterNodeMask
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DCommandSignatureDescription")
public typealias D3D12_COMMAND_SIGNATURE_DESC = D3DCommandSignatureDescription 

#endif
