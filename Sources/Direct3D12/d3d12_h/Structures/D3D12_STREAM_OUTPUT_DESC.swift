/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes a streaming output buffer.
public struct D3DStreamOutputDescription {
    public typealias RawValue =  WinSDK.D3D12_STREAM_OUTPUT_DESC
    internal var rawValue: RawValue

    /// An array of D3D12_SO_DECLARATION_ENTRY structures. Can't be NULL if NumEntries > 0.
    public var declarationEntries: [D3DStreamOutputDeclarationEntry] {
        get {
            let buffer = UnsafeBufferPointer(start: rawValue.pSODeclaration, count: Int(rawValue.NumEntries))
            return buffer.map({D3DStreamOutputDeclarationEntry($0)})
        }
        set {
            newValue.map({$0.rawValue}).withUnsafeBufferPointer {
                rawValue.pSODeclaration = $0.baseAddress!
            }
            rawValue.NumEntries = UInt32(newValue.count)
        }
    }

    /// An array of buffer strides; each stride is the size of an element for that buffer.
    public var bufferStrides: [UInt32] {
        get {
            let buffer = UnsafeBufferPointer(start: rawValue.pBufferStrides, count: Int(rawValue.NumStrides))
            return Array(buffer)
        }
        set {
            newValue.withUnsafeBufferPointer {
                rawValue.pBufferStrides = $0.baseAddress!
            }
            rawValue.NumStrides = UInt32(newValue.count)
        }
    }

    /// The index number of the stream to be sent to the rasterizer stage.
    public var rasterizedStream: UInt32 {
        get {
            return rawValue.RasterizedStream
        }
        set {
            rawValue.RasterizedStream = newValue
        }
    }

    /** Describes a streaming output buffer.
    - parameter declarationEntries: An array of D3D12_SO_DECLARATION_ENTRY structures. Can't be NULL if NumEntries > 0.
    - parameter bufferStrides: An array of buffer strides; each stride is the size of an element for that buffer.
    - parameter rasterizedStream: The index number of the stream to be sent to the rasterizer stage.
    */
    public init(declarationEntries: [D3DStreamOutputDeclarationEntry], bufferStrides: [UInt32], rasterizedStream: UInt32) {
        self.rawValue = RawValue()
        self.declarationEntries = declarationEntries
        self.bufferStrides = bufferStrides
        self.rasterizedStream = rasterizedStream
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DStreamOutputDescription")
public typealias D3D12_STREAM_OUTPUT_DESC = D3DStreamOutputDescription

#endif
