/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct AutoBreadcrumbNode {
    public let rawValue: WinSDK.D3D12_AUTO_BREADCRUMB_NODE
    
    /// A pointer to the ID3D12GraphicsCommandList interface representing the outstanding command list at the time of execution.
    public var commandList: CommandList? {
        guard let p = rawValue.pCommandList?.pointee else {return nil}
        return GraphicsCommandList(p)
    }

    /// A pointer to the ID3D12CommandQueue interface representing the outstanding command queue.
    public var commandQueue: CommandQueue? {
        guard let p = rawValue.pCommandQueue?.pointee else {return nil}
        return CommandQueue(p)
    }

    /// A pointer to a constant UINT32 containing the index (within the array pointed to by pCommandHistory) of the last render/compute operation that was completed by the GPU while executing the associated command list.
    public var lastOperation: AutoBreadcrumbOP? {
        guard let index = rawValue.pLastBreadcrumbValue?.pointee else {return nil}
        return commandHistory[Int(index)]
    }

    /// A pointer to a constant array of D3D12_AUTO_BREADCRUMB_OP values representing all of the render/compute operations recorded into the associated command list.
    public var commandHistory: [AutoBreadcrumbOP] {
        UnsafeBufferPointer(start: rawValue.pCommandHistory, count: Int(rawValue.BreadcrumbCount)).compactMap({AutoBreadcrumbOP($0)})
    }

    /// A pointer to a constant D3D12_AUTO_BREADCRUMB_NODE representing the next auto-breadcrumb node in the list, or nullptr if this is the last node.
    public var nextNode: Self? {
        guard let p = rawValue.pNext?.pointee else {return nil}
        return AutoBreadcrumbNode(p)
    }
    
    public init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "AutoBreadcrumbNode")
public typealias D3D12_AUTO_BREADCRUMB_NODE = AutoBreadcrumbNode 

public extension AutoBreadcrumbNode {
//   const char                       *pCommandListDebugNameA;
//   const wchar_t                    *pCommandListDebugNameW;
//   const char                       *pCommandQueueDebugNameA;
//   const wchar_t                    *pCommandQueueDebugNameW;
    @available(*, deprecated, renamed: "commandList")
    var pCommandList: UnsafeMutablePointer<WinSDK.ID3D12GraphicsCommandList>? {rawValue.pCommandList}

    @available(*, deprecated, renamed: "commandQueue")
    var pCommandQueue: UnsafeMutablePointer<WinSDK.ID3D12CommandQueue>? {rawValue.pCommandQueue}

    @available(*, deprecated, message: "Use lastOperation instead.")
    var BreadcrumbCount: UInt32 {rawValue.BreadcrumbCount}

    @available(*, deprecated, message: "Use lastOperation instead.")
    var pLastBreadcrumbValue: UnsafePointer<UInt32>? {rawValue.pLastBreadcrumbValue}

    @available(*, deprecated, renamed: "commandHistory")
    var pCommandHistory: UnsafePointer<AutoBreadcrumbOP.RawValue>? {rawValue.pCommandHistory}

    @available(*, deprecated, renamed: "nextNode")
    var pNext: Self? {nextNode}
}

#endif
