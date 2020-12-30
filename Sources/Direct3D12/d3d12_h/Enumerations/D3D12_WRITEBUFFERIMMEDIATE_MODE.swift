/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the mode used by a WriteBufferImmediate operation.
public enum WriteBufferImmediateMode {
    ///	The write operation behaves the same as normal copy-write operations.
    case `default`
    ///	The write operation is guaranteed to occur after all preceding commands in the command stream have started, including previous WriteBufferImmediate operations.
    case markerIn
    ///	The write operation is deferred until all previous commands in the command stream have completed through the GPU pipeline, including previous WriteBufferImmediate operations. Write operations that specify D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_OUT don't block subsequent operations from starting. If there are no previous operations in the command stream, then the write operation behaves as if D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_IN was specified.
    case markerOut

    internal var rawValue: _d3d12.D3D12_WRITEBUFFERIMMEDIATE_MODE {
        switch self {
        case .default:
            return _d3d12.D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT
        case .markerIn:
            return _d3d12.D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_IN
        case .markerOut:
            return _d3d12.D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_OUT
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "WriteBufferImmediateMode")
public typealias D3D12_WRITEBUFFERIMMEDIATE_MODE = WriteBufferImmediateMode

public extension WriteBufferImmediateMode  {
    @available(*, deprecated, renamed: "default")
    static let D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT = Self.default
    
    @available(*, deprecated, renamed: "markerIn")
    static let D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_IN = Self.markerIn
    
    @available(*, deprecated, renamed: "markerOut")
    static let D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_OUT = Self.markerOut
}

#endif
