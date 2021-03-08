/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Congruent with, and numerically equivalent to, [3D12DDI_HANDLETYPE](https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/content/d3d12umddi/ne-d3d12umddi-d3d12ddi_handletype) enumeration values.
public enum DredAllocationType {
    case commandQueue	
    case commandAllocator	
    case pipelineState	
    case commandList	
    case fence	
    case descriptorHeap	
    case heap	
    case queryHeap	
    case commandSignature	
    case pipelineLibrary	
    case videoDecoder	
    case videoProcessor	
    case resource	
    case pass	
    case cryptoSession
    case cryptoSessionPolicy	
    case portectedResourceSession	
    case videoDecoderHeap	
    case commandPool	
    case commandRecorder	
    case stateObeject	
    case metaCommand	
    case schedulingGroup	
    case videoMotionEstimator	
    case motionVectorHeap	
    case videoExtensionCommand	
    case invalid

    internal var rawValue: WinSDK.D3D12_DRED_ALLOCATION_TYPE {
        switch self {
        case .commandQueue:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_QUEUE
        case .commandAllocator:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_ALLOCATOR
        case .pipelineState:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_PIPELINE_STATE
        case .commandList:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_LIST
        case .fence:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_FENCE
        case .descriptorHeap:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_DESCRIPTOR_HEAP
        case .heap:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_HEAP
        case .queryHeap:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_QUERY_HEAP
        case .commandSignature:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_SIGNATURE
        case .pipelineLibrary:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_PIPELINE_LIBRARY
        case .videoDecoder:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER
        case .videoProcessor:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_PROCESSOR
        case .resource:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_RESOURCE
        case .pass:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_PASS
        case .cryptoSession:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSION
        case .cryptoSessionPolicy:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSIONPOLICY
        case .portectedResourceSession:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_PROTECTEDRESOURCESESSION
        case .videoDecoderHeap:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER_HEAP
        case .commandPool:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_POOL
        case .commandRecorder:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_COMMAND_RECORDER
        case .stateObeject:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_STATE_OBJECT
        case .metaCommand:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_METACOMMAND
        case .schedulingGroup:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_SCHEDULINGGROUP
        case .videoMotionEstimator:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_ESTIMATOR
        case .motionVectorHeap:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_VECTOR_HEAP
        case .videoExtensionCommand:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_VIDEO_EXTENSION_COMMAND
        case .invalid:
            return WinSDK.D3D12_DRED_ALLOCATION_TYPE_INVALID
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DredAllocationType")
public typealias D3D12_DRED_ALLOCATION_TYPE = DredAllocationType

public extension DredAllocationType {
    @available(*, deprecated, renamed: "commandQueue")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_QUEUE = Self.commandQueue

    @available(*, deprecated, renamed: "commandAllocator")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_ALLOCATOR = Self.commandAllocator

    @available(*, deprecated, renamed: "pipelineState")
    static let D3D12_DRED_ALLOCATION_TYPE_PIPELINE_STATE = Self.pipelineState

    @available(*, deprecated, renamed: "commandList")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_LIST = Self.commandList

    @available(*, deprecated, renamed: "fence")
    static let D3D12_DRED_ALLOCATION_TYPE_FENCE = Self.fence

    @available(*, deprecated, renamed: "descriptorHeap")
    static let D3D12_DRED_ALLOCATION_TYPE_DESCRIPTOR_HEAP = Self.descriptorHeap

    @available(*, deprecated, renamed: "heap")
    static let D3D12_DRED_ALLOCATION_TYPE_HEAP = Self.heap

    @available(*, deprecated, renamed: "queryHeap")
    static let D3D12_DRED_ALLOCATION_TYPE_QUERY_HEAP = Self.queryHeap

    @available(*, deprecated, renamed: "commandSignature")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_SIGNATURE = Self.commandSignature

    @available(*, deprecated, renamed: "pipelineLibrary")
    static let D3D12_DRED_ALLOCATION_TYPE_PIPELINE_LIBRARY = Self.pipelineLibrary

    @available(*, deprecated, renamed: "videoDecoder")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER = Self.videoDecoder

    @available(*, deprecated, renamed: "videoProcessor")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_PROCESSOR = Self.videoProcessor

    @available(*, deprecated, renamed: "resource")
    static let D3D12_DRED_ALLOCATION_TYPE_RESOURCE = Self.resource

    @available(*, deprecated, renamed: "pass")
    static let D3D12_DRED_ALLOCATION_TYPE_PASS = Self.pass

    @available(*, deprecated, renamed: "cryptoSession")
    static let D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSION = Self.cryptoSession

    @available(*, deprecated, renamed: "cryptoSessionPolicy")
    static let D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSIONPOLICY = Self.cryptoSessionPolicy

    @available(*, deprecated, renamed: "portectedResourceSession")
    static let D3D12_DRED_ALLOCATION_TYPE_PROTECTEDRESOURCESESSION = Self.portectedResourceSession

    @available(*, deprecated, renamed: "videoDecoderHeap")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER_HEAP = Self.videoDecoderHeap

    @available(*, deprecated, renamed: "commandPool")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_POOL = Self.commandPool

    @available(*, deprecated, renamed: "commandRecorder")
    static let D3D12_DRED_ALLOCATION_TYPE_COMMAND_RECORDER = Self.commandRecorder

    @available(*, deprecated, renamed: "stateObeject")
    static let D3D12_DRED_ALLOCATION_TYPE_STATE_OBJECT = Self.stateObeject

    @available(*, deprecated, renamed: "metaCommand")
    static let D3D12_DRED_ALLOCATION_TYPE_METACOMMAND = Self.metaCommand

    @available(*, deprecated, renamed: "schedulingGroup")
    static let D3D12_DRED_ALLOCATION_TYPE_SCHEDULINGGROUP = Self.schedulingGroup

    @available(*, deprecated, renamed: "videoMotionEstimator")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_ESTIMATOR = Self.videoMotionEstimator

    @available(*, deprecated, renamed: "motionVectorHeap")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_VECTOR_HEAP = Self.motionVectorHeap

    @available(*, deprecated, renamed: "videoExtensionCommand")
    static let D3D12_DRED_ALLOCATION_TYPE_VIDEO_EXTENSION_COMMAND = Self.videoExtensionCommand
    
    @available(*, deprecated, renamed: "invalid")
    static let D3D12_DRED_ALLOCATION_TYPE_INVALID = Self.invalid
}

#endif
