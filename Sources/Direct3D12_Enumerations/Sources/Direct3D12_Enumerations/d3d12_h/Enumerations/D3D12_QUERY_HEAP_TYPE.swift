/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of query heap to create.
public enum QueryHeapType {
    ///	This returns a binary 0/1 result: 0 indicates that no samples passed depth and stencil testing, 1 indicates that at least one sample passed depth and stencil testing. This enables occlusion queries to not interfere with any GPU performance optimization associated with depth/stencil testing.
    case occlusion
    ///	Indicates that the heap is for high-performance timing data.
    case timestamp
    ///	Indicates the heap is to contain pipeline data. Refer to D3D12_QUERY_DATA_PIPELINE_STATISTICS.
    case pipelineStatistics
    ///	Indicates the heap is to contain stream output data. Refer to D3D12_QUERY_DATA_SO_STATISTICS.
    case streamOutputStatistics
    /**
    Indicates the heap is to contain video decode statistics data. Refer to D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS.

    Video decode statistics can only be queried from video decode command lists (D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE). See D3D12_QUERY_TYPE_DECODE_STATISTICS for more details.
    */
    case videoDecodeStatistics
    /**	
    Indicates the heap is to contain timestamp queries emitted exclusively by copy command lists. Copy queue timestamps can only be queried from a copy command list, and a copy command list can not emit to a regular timestamp query Heap.

    Support for this query heap type is not universal. You must use CheckFeatureSupport with D3D12_FEATUREWinSDK_OPTIONS3 to determine whether the adapter supports copy queue timestamp queries.
    */
    case copyQueueTimestamps

    internal var rawValue: WinSDK.D3D12_QUERY_HEAP_TYPE {
        switch self {
        case .occlusion:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_OCCLUSION
        case .timestamp:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_TIMESTAMP
        case .pipelineStatistics:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_PIPELINE_STATISTICS
        case .streamOutputStatistics:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_SO_STATISTICS
        case .videoDecodeStatistics:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_VIDEO_DECODE_STATISTICS
        case .copyQueueTimestamps:
            return WinSDK.D3D12_QUERY_HEAP_TYPE_COPY_QUEUE_TIMESTAMP
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "QueryHeapType")
public typealias D3D12_QUERY_HEAP_TYPE = QueryHeapType

public extension QueryHeapType  {
    @available(*, deprecated, renamed: "occlusion")
    static let D3D12_QUERY_HEAP_TYPE_OCCLUSION = Self.occlusion

    @available(*, deprecated, renamed: "timestamp")
    static let D3D12_QUERY_HEAP_TYPE_TIMESTAMP = Self.timestamp

    @available(*, deprecated, renamed: "pipelineStatistics")
    static let D3D12_QUERY_HEAP_TYPE_PIPELINE_STATISTICS = Self.pipelineStatistics

    @available(*, deprecated, renamed: "streamOutputStatistics")
    static let D3D12_QUERY_HEAP_TYPE_SO_STATISTICS = Self.streamOutputStatistics

    @available(*, deprecated, renamed: "videoDecodeStatistics")
    static let D3D12_QUERY_HEAP_TYPE_VIDEO_DECODE_STATISTICS = Self.videoDecodeStatistics

    @available(*, deprecated, renamed: "copyQueueTimestamps")
    static let D3D12_QUERY_HEAP_TYPE_COPY_QUEUE_TIMESTAMP = Self.copyQueueTimestamps
}

#endif
