/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */
 
import WinSDK

/// Defines constants that specify render/compute GPU operations.
public enum AutoBreadcrumbOP {
    case setMarker
    case beginEvent
    case endEvent
    case drawDrawIstanced
    case drawIndexedInstanced
    case executeIndirect
    case dispatch
    case copyBufferRegion
    case copyTextureRegion
    case copyResource
    case copyTiles
    case resolveSubResource
    case clearRenderTargetView
    case clearUnorderedAccessView
    case clearDepthStencilView
    case resourceBarrier
    case executeBundle
    case present
    case resolveQueryData
    case beginSubmission
    case endSubmission
    case decodeFrame
    case processFrames
    case automicCopyBufferUINT
    case automicCopyBufferINT64
    case resolveSubResourceRegion
    case writeBufferImmediate
    case decodeFrame1
    case setProtectedResourceSession
    case decodeFrame2
    case processFrames1
    case buildRayTracingAccelerationStructure
    case emitRayTracingAccelerationStructurePostBuildInfo
    case copyRayTracingAccelerationStructure
    case dispatchRays
    case initializeMetaCommand
    case executeMetaCommand
    case estimateMotion
    case resolveMotionVectorHeap
    case setPipelineState1
    case initializeExtensionCommand
    case executeExtensionCommand
    case dispatchMesh
    /// This only occurse if there was no implementation for the wrapped rawValue.
    /// This can happen if d3d12 is expanded but this Swift package is not yet updated.
    case undefined(_ rawValue: RawValue)
}

extension AutoBreadcrumbOP: RawRepresentable {
    public typealias RawValue = WinSDK.D3D12_AUTO_BREADCRUMB_OP
    public var rawValue: RawValue {
        switch self {
        case .setMarker: 
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETMARKER
        case .beginEvent:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_BEGINEVENT
        case .endEvent:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_ENDEVENT
        case .drawDrawIstanced:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DRAWINSTANCED
        case .drawIndexedInstanced:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DRAWINDEXEDINSTANCED
        case .executeIndirect:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEINDIRECT
        case .dispatch:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCH
        case .copyBufferRegion:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYBUFFERREGION
        case .copyTextureRegion:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYTEXTUREREGION
        case .copyResource:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYRESOURCE
        case .copyTiles:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYTILES
        case .resolveSubResource:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCE
        case .clearRenderTargetView:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARRENDERTARGETVIEW
        case .clearUnorderedAccessView:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARUNORDEREDACCESSVIEW
        case .clearDepthStencilView:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARDEPTHSTENCILVIEW
        case .resourceBarrier:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOURCEBARRIER
        case .executeBundle:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEBUNDLE
        case .present:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_PRESENT
        case .resolveQueryData:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVEQUERYDATA
        case .beginSubmission:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_BEGINSUBMISSION
        case .endSubmission:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_ENDSUBMISSION
        case .decodeFrame:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME
        case .processFrames:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES
        case .automicCopyBufferUINT:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT
        case .automicCopyBufferINT64:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT64
        case .resolveSubResourceRegion:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCEREGION
        case .writeBufferImmediate:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_WRITEBUFFERIMMEDIATE
        case .decodeFrame1:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME1
        case .setProtectedResourceSession:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETPROTECTEDRESOURCESESSION
        case .decodeFrame2:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME2
        case .processFrames1:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES1
        case .buildRayTracingAccelerationStructure:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_BUILDRAYTRACINGACCELERATIONSTRUCTURE
        case .emitRayTracingAccelerationStructurePostBuildInfo:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO
        case .copyRayTracingAccelerationStructure:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYRAYTRACINGACCELERATIONSTRUCTURE
        case .dispatchRays:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCHRAYS
        case .initializeMetaCommand:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_INITIALIZEMETACOMMAND
        case .executeMetaCommand:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEMETACOMMAND
        case .estimateMotion:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_ESTIMATEMOTION
        case .resolveMotionVectorHeap:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVEMOTIONVECTORHEAP
        case .setPipelineState1:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETPIPELINESTATE1
        case .initializeExtensionCommand:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_INITIALIZEEXTENSIONCOMMAND
        case .executeExtensionCommand:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEEXTENSIONCOMMAND
        case .dispatchMesh:
            return WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCHMESH
        case let .undefined(rawValue):
            return rawValue
        }
    }
    public init(rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETMARKER: 
            self = .setMarker
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_BEGINEVENT:
            self = .beginEvent 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_ENDEVENT:
            self = .endEvent 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DRAWINSTANCED:
            self = .drawDrawIstanced 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DRAWINDEXEDINSTANCED:
            self = .drawIndexedInstanced 
        case  WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEINDIRECT:
            self = .executeIndirect
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCH:
            self = .dispatch 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYBUFFERREGION:
            self = .copyBufferRegion 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYTEXTUREREGION:
            self = .copyTextureRegion 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYRESOURCE:
            self = .copyResource 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYTILES:
            self = .copyTiles 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCE:
            self = .resolveSubResource 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARRENDERTARGETVIEW:
            self = .clearRenderTargetView 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARUNORDEREDACCESSVIEW:
            self = .clearUnorderedAccessView 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_CLEARDEPTHSTENCILVIEW:
            self = .clearDepthStencilView 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOURCEBARRIER:
            self = .resourceBarrier 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEBUNDLE:
            self = .executeBundle 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_PRESENT:
            self = .present 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVEQUERYDATA:
            self = .resolveQueryData 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_BEGINSUBMISSION:
            self = .beginSubmission 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_ENDSUBMISSION:
            self = .endSubmission 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME:
            self = .decodeFrame 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES:
            self = .processFrames 
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT:
            self = .automicCopyBufferUINT
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT64:
            self = .automicCopyBufferINT64
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCEREGION:
            self = .resolveSubResourceRegion
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_WRITEBUFFERIMMEDIATE:
            self = .writeBufferImmediate
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME1:
            self = .decodeFrame1
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETPROTECTEDRESOURCESESSION:
            self = .setProtectedResourceSession
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME2:
            self = .decodeFrame2
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES1:
            self = .processFrames1
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_BUILDRAYTRACINGACCELERATIONSTRUCTURE:
            self = .buildRayTracingAccelerationStructure
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO:
            self = .emitRayTracingAccelerationStructurePostBuildInfo
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_COPYRAYTRACINGACCELERATIONSTRUCTURE:
            self = .copyRayTracingAccelerationStructure
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCHRAYS:
            self = .dispatchRays
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_INITIALIZEMETACOMMAND:
            self = .initializeMetaCommand
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEMETACOMMAND:
            self = .executeMetaCommand
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_ESTIMATEMOTION:
            self = .estimateMotion
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_RESOLVEMOTIONVECTORHEAP:
            self = .resolveMotionVectorHeap
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_SETPIPELINESTATE1:
            self = .setPipelineState1
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_INITIALIZEEXTENSIONCOMMAND:
            self = .initializeExtensionCommand
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_EXECUTEEXTENSIONCOMMAND:
            self = .executeExtensionCommand
        case WinSDK.D3D12_AUTO_BREADCRUMB_OP_DISPATCHMESH:
            self = .dispatchMesh
        default:
            self = .undefined(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "AutoBreadcrumbOP")
public typealias D3D12_AUTO_BREADCRUMB_OP = AutoBreadcrumbOP


@available(*, deprecated, renamed: "setMarker")
let D3D12_AUTO_BREADCRUMB_OP_SETMARKER: AutoBreadcrumbOP = .setMarker

@available(*, deprecated, renamed: "beginEvent")
let D3D12_AUTO_BREADCRUMB_OP_BEGINEVENT: AutoBreadcrumbOP = .beginEvent

@available(*, deprecated, renamed: "endEvent")
let D3D12_AUTO_BREADCRUMB_OP_ENDEVENT: AutoBreadcrumbOP = .endEvent

@available(*, deprecated, renamed: "drawDrawIstanced")
let D3D12_AUTO_BREADCRUMB_OP_DRAWINSTANCED: AutoBreadcrumbOP = .drawDrawIstanced

@available(*, deprecated, renamed: "drawIndexedInstanced")
let D3D12_AUTO_BREADCRUMB_OP_DRAWINDEXEDINSTANCED: AutoBreadcrumbOP = .drawIndexedInstanced

@available(*, deprecated, renamed: "executeIndirect")
let D3D12_AUTO_BREADCRUMB_OP_EXECUTEINDIRECT: AutoBreadcrumbOP = .executeIndirect

@available(*, deprecated, renamed: "dispatch")
let D3D12_AUTO_BREADCRUMB_OP_DISPATCH: AutoBreadcrumbOP = .dispatch

@available(*, deprecated, renamed: "copyBufferRegion")
let D3D12_AUTO_BREADCRUMB_OP_COPYBUFFERREGION: AutoBreadcrumbOP = .copyBufferRegion

@available(*, deprecated, renamed: "copyTextureRegion")
let D3D12_AUTO_BREADCRUMB_OP_COPYTEXTUREREGION: AutoBreadcrumbOP = .copyTextureRegion

@available(*, deprecated, renamed: "copyResource")
let D3D12_AUTO_BREADCRUMB_OP_COPYRESOURCE: AutoBreadcrumbOP = .copyResource

@available(*, deprecated, renamed: "copyTiles")
let D3D12_AUTO_BREADCRUMB_OP_COPYTILES: AutoBreadcrumbOP = .copyTiles

@available(*, deprecated, renamed: "resolveSubResource")
let D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCE: AutoBreadcrumbOP = .resolveSubResource

@available(*, deprecated, renamed: "clearRenderTargetView")
let D3D12_AUTO_BREADCRUMB_OP_CLEARRENDERTARGETVIEW: AutoBreadcrumbOP = .clearRenderTargetView

@available(*, deprecated, renamed: "clearUnorderedAccessView")
let D3D12_AUTO_BREADCRUMB_OP_CLEARUNORDEREDACCESSVIEW: AutoBreadcrumbOP = .clearUnorderedAccessView

@available(*, deprecated, renamed: "clearDepthStencilView")
let D3D12_AUTO_BREADCRUMB_OP_CLEARDEPTHSTENCILVIEW: AutoBreadcrumbOP = .clearDepthStencilView

@available(*, deprecated, renamed: "resourceBarrier")
let D3D12_AUTO_BREADCRUMB_OP_RESOURCEBARRIER: AutoBreadcrumbOP = .resourceBarrier

@available(*, deprecated, renamed: "executeBundle")
let D3D12_AUTO_BREADCRUMB_OP_EXECUTEBUNDLE: AutoBreadcrumbOP = .executeBundle

@available(*, deprecated, renamed: "present")
let D3D12_AUTO_BREADCRUMB_OP_PRESENT: AutoBreadcrumbOP = .present

@available(*, deprecated, renamed: "resolveQueryData")
let D3D12_AUTO_BREADCRUMB_OP_RESOLVEQUERYDATA: AutoBreadcrumbOP = .resolveQueryData

@available(*, deprecated, renamed: "beginSubmission")
let D3D12_AUTO_BREADCRUMB_OP_BEGINSUBMISSION: AutoBreadcrumbOP = .beginSubmission

@available(*, deprecated, renamed: "endSubmission")
let D3D12_AUTO_BREADCRUMB_OP_ENDSUBMISSION: AutoBreadcrumbOP = .endSubmission

@available(*, deprecated, renamed: "decodeFrame")
let D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME: AutoBreadcrumbOP = .decodeFrame

@available(*, deprecated, renamed: "processFrames")
let D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES: AutoBreadcrumbOP = .processFrames

@available(*, deprecated, renamed: "automicCopyBufferUINT")
let D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT: AutoBreadcrumbOP = .automicCopyBufferUINT

@available(*, deprecated, renamed: "automicCopyBufferINT64")
let D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT64: AutoBreadcrumbOP = .automicCopyBufferINT64

@available(*, deprecated, renamed: "resolveSubResourceRegion")
let D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCEREGION: AutoBreadcrumbOP = .resolveSubResourceRegion

@available(*, deprecated, renamed: "writeBufferImmediate")
let D3D12_AUTO_BREADCRUMB_OP_WRITEBUFFERIMMEDIATE: AutoBreadcrumbOP = .writeBufferImmediate

@available(*, deprecated, renamed: "decodeFrame1")
let D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME1: AutoBreadcrumbOP = .decodeFrame1

@available(*, deprecated, renamed: "setProtectedResourceSession")
let D3D12_AUTO_BREADCRUMB_OP_SETPROTECTEDRESOURCESESSION: AutoBreadcrumbOP = .setProtectedResourceSession

@available(*, deprecated, renamed: "decodeFrame2")
let D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME2: AutoBreadcrumbOP = .decodeFrame2

@available(*, deprecated, renamed: "processFrames1")
let D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES1: AutoBreadcrumbOP = .processFrames1

@available(*, deprecated, renamed: "buildRayTracingAccelerationStructure")
let D3D12_AUTO_BREADCRUMB_OP_BUILDRAYTRACINGACCELERATIONSTRUCTURE: AutoBreadcrumbOP = .buildRayTracingAccelerationStructure

@available(*, deprecated, renamed: "emitRayTracingAccelerationStructurePostBuildInfo")
let D3D12_AUTO_BREADCRUMB_OP_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO: AutoBreadcrumbOP = .emitRayTracingAccelerationStructurePostBuildInfo

@available(*, deprecated, renamed: "copyRayTracingAccelerationStructure")
let D3D12_AUTO_BREADCRUMB_OP_COPYRAYTRACINGACCELERATIONSTRUCTURE: AutoBreadcrumbOP = .copyRayTracingAccelerationStructure

@available(*, deprecated, renamed: "dispatchRays")
let D3D12_AUTO_BREADCRUMB_OP_DISPATCHRAYS: AutoBreadcrumbOP = .dispatchRays

@available(*, deprecated, renamed: "initializeMetaCommand")
let D3D12_AUTO_BREADCRUMB_OP_INITIALIZEMETACOMMAND: AutoBreadcrumbOP = .initializeMetaCommand

@available(*, deprecated, renamed: "initializeMetaCommand")
let D3D12_AUTO_BREADCRUMB_OP_EXECUTEMETACOMMAND: AutoBreadcrumbOP = .executeMetaCommand

@available(*, deprecated, renamed: "estimateMotion")
let D3D12_AUTO_BREADCRUMB_OP_ESTIMATEMOTION: AutoBreadcrumbOP = .estimateMotion

@available(*, deprecated, renamed: "resolveMotionVectorHeap")
let D3D12_AUTO_BREADCRUMB_OP_RESOLVEMOTIONVECTORHEAP: AutoBreadcrumbOP = .resolveMotionVectorHeap

@available(*, deprecated, renamed: "setPipelineState1")
let D3D12_AUTO_BREADCRUMB_OP_SETPIPELINESTATE1: AutoBreadcrumbOP = .setPipelineState1

@available(*, deprecated, renamed: "initializeExtensionCommand")
let D3D12_AUTO_BREADCRUMB_OP_INITIALIZEEXTENSIONCOMMAND: AutoBreadcrumbOP = .initializeExtensionCommand

@available(*, deprecated, renamed: "executeExtensionCommand")
let D3D12_AUTO_BREADCRUMB_OP_EXECUTEEXTENSIONCOMMAND: AutoBreadcrumbOP = .executeExtensionCommand

@available(*, deprecated, renamed: "dispatchMesh")
let D3D12_AUTO_BREADCRUMB_OP_DISPATCHMESH: AutoBreadcrumbOP = .dispatchMesh

#endif
