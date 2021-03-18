/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK.DirectX
import Direct3D12_Enumerations

public class CommandQueue: Pageable {

    /** Copies mappings from a source reserved resource to a destination reserved resource.
    - parameter srcResource: A pointer to the source reserved resource.
    - parameter sourceRegionStartCoord: A pointer to a D3D12_TILED_RESOURCE_COORDINATE structure that describes the starting coordinates of the source reserved resource.
    - parameter dstResource: A pointer to the destination reserved resource.
    - parameter destinationRegionStartCoord: A pointer to a D3D12_TILED_RESOURCE_COORDINATE structure that describes the starting coordinates of the destination reserved resource.
    - parameter regionSize: A pointer to a D3D12_TILE_REGION_SIZE structure that describes the size of the reserved region.
    - parameter flags: One member of D3D12_TILE_MAPPING_FLAGS.
    */
    public func copyTileMappings(from srcResource: Resource, sourceRegionStartCoord: TiledResourceCoordinate, 
                                 to dstResource: Resource, destinationRegionStartCoord: TiledResourceCoordinate, 
                                 regionSize: TileRegionSize, flags: TileMappingFlags = []) {
        performFatally(as: RawValue.self) {pThis in
            let dstResource = dstResource.performFatally(as: Resource.RawValue.self) {$0}
            var dstCoord = destinationRegionStartCoord.rawValue
            let srcResource = srcResource.performFatally(as: Resource.RawValue.self) {$0}
            var srcCoord = sourceRegionStartCoord.rawValue
            var regionSize = regionSize.rawValue
            let flags = TileMappingFlags.RawType(rawValue: flags.rawValue)
            pThis.pointee.lpVtbl.pointee.CopyTileMappings(pThis, dstResource, &dstCoord, srcResource, &srcCoord, &regionSize,  flags)
        }
    }

    /** Submits an array of command lists for execution.
    - parameter commandLists: The array of ID3D12CommandList command lists to be executed.
    */
    public func executeCommandLists(_ commandLists: [CommandList]) {
        performFatally(as: RawValue.self) {pThis in
            let pCommandLists = commandLists.map({$0.performFatally(as: CommandList.RawValue.self){Optional($0)}})
            pThis.pointee.lpVtbl.pointee.ExecuteCommandLists(pThis, UInt32(commandLists.count), pCommandLists)
        }
    }

    /// This method samples the CPU and GPU timestamp counters at the same moment in time.
    public func clockCalibration() throws -> (cpuTimestampCount: UInt64, gpuTimestampCount: UInt64) {
        return try perform(as: RawValue.self) {pThis in
            var gpuTimestamp: UInt64 = 0
            var cpuTimestamp: UInt64 = 0
            try pThis.pointee.lpVtbl.pointee.GetClockCalibration(pThis, &gpuTimestamp, &cpuTimestamp).checkResult()
            return (gpuTimestamp, cpuTimestamp)
        }
    }

    /// Gets the description of the command queue.
    public var commandQueueDescription: CommandQueueDescription {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
            return CommandQueueDescription(v)
        }
    }

    /// This method is used to determine the rate at which the GPU timestamp counter increments.
    public func timestampFrequency() throws -> UInt64 {
        return try perform(as: RawValue.self) {pThis in
            var frequency: UInt64 = 0
            try pThis.pointee.lpVtbl.pointee.GetTimestampFrequency(pThis, &frequency).checkResult()
            return frequency
        }
    }

    /** Updates a fence to a specified value.
    - parameter fence: A pointer to the ID3D12Fence object.
    - parameter value: The value to set the fence to.
    */
    public func signal(fence: Fence, value: UInt64) throws {
        try perform(as: RawValue.self) {pThis in
            let pFence = try fence.perform(as: Fence.RawValue.self) {$0}
            try pThis.pointee.lpVtbl.pointee.Signal(pThis, pFence, value).checkResult()
        }
    }

    /** Updates mappings of tile locations in reserved resources to memory locations in a resource heap.
    - parameter resource: A pointer to the reserved resource.
    - parameter coordinate: An array of D3D12_TILED_RESOURCE_COORDINATE structures that describe the starting coordinates of the reserved resource regions. The NumResourceRegions parameter specifies the number of D3D12_TILED_RESOURCE_COORDINATE structures in the array.
    - parameter size: An array of D3D12_TILE_REGION_SIZE structures that describe the sizes of the reserved resource regions. The NumResourceRegions parameter specifies the number of D3D12_TILE_REGION_SIZE structures in the array.
    - parameter rangeFlags: A pointer to an array of D3D12_TILE_RANGE_FLAGS values that describes each tile range. The NumRanges parameter specifies the number of values in the array.
    - parameter offset: An array of offsets into the resource heap. These are 0-based tile offsets, counting in tiles (not bytes).
    - parameter tileCount: An array of values that specify the number of tiles in each tile range. The NumRanges parameter specifies the number of values in the array.
    - parameter resourceHeap: A pointer to the resource heap.
    - parameter flags: A combination of D3D12_TILE_MAPPING_FLAGS values that are combined by using a bitwise OR operation.
    */
    public func updateTileMappings(for resource: Resource,
                                   resourceRegionStartCoordinates: [TiledResourceCoordinate]?,
                                   resourceRegionSizes: [TileRegionSize]?,
                                   heap: Heap,
                                   rangeFlags: [TileRangeFlags]?,
                                   heapRangeStartOffsets: [UInt32]?,
                                   rangeTileCounts: [UInt32]?,
                                   flags: TileMappingFlags = []) {
        performFatally(as: RawValue.self) {pThis in
            let resource = resource.performFatally(as: Resource.RawValue.self) {$0}
            let numResourceRegions = UInt32(resourceRegionStartCoordinates?.count ?? resourceRegionSizes?.count ?? 0)
            let pResourceRegionStartCoordinates = resourceRegionStartCoordinates?.map({$0.rawValue})
            let pResourceRegionSizes = resourceRegionSizes?.map({$0.rawValue})
            let pHeap = heap.performFatally(as: Heap.RawValue.self) {$0}
            let numRanges = UInt32(rangeFlags?.count ?? rangeTileCounts?.count ?? heapRangeStartOffsets?.count ?? 0)
            let pRangeFlags = rangeFlags?.map({TileRangeFlags.RawType($0.rawValue)})
            let pHeapRangeStartOffsets = heapRangeStartOffsets
            let pRangeTileCounts = rangeTileCounts
            let flags = TileMappingFlags.RawType(rawValue: flags.rawValue)
            pThis.pointee.lpVtbl.pointee.UpdateTileMappings(pThis, resource, numResourceRegions, pResourceRegionStartCoordinates, pResourceRegionSizes, pHeap, numRanges, pRangeFlags, pHeapRangeStartOffsets, pRangeTileCounts, flags)
        }
    }

    /** Queues a GPU-side wait, and returns immediately. A GPU-side wait is where the GPU waits until the specified fence reaches or exceeds the specified value.
    - parameter fence: A pointer to the ID3D12Fence object.
    - parameter value: The value that the command queue is waiting for the fence to reach or exceed. So when ID3D12Fence::GetCompletedValue is greater than or equal to Value, the wait is terminated.
    */
    public func wait(fence: Fence, value: UInt64) throws {
        try perform(as: RawValue.self) {pThis in
            let pFence = try fence.perform(as: Fence.RawValue.self) {$0}
            try pThis.pointee.lpVtbl.pointee.Wait(pThis, pFence, value).checkResult()
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension CommandQueue {
    typealias RawValue = WinSDK.ID3D12CommandQueue
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension CommandQueue.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12CommandQueue}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "CommandQueue")
public typealias ID3D12CommandQueue = CommandQueue 

public extension CommandQueue {
    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func BeginEvent(_ metadata: UInt32, _ pData: UnsafeRawPointer?, _ size: UInt32) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyTileMappings")
    func CopyTileMappings(_ pDstResource: UnsafeMutablePointer<Resource.RawValue>?, _ pDstRegionStartCoordinate: UnsafeMutablePointer<TiledResourceCoordinate.RawValue>?, 
                          _ pSrcResource: UnsafeMutablePointer<Resource.RawValue>?, _ pSrcRegionStartCoordinate: UnsafeMutablePointer<TiledResourceCoordinate.RawValue>?, 
                          _ pRegionSize: UnsafePointer<TileRegionSize.RawValue>, _ Flags: TileMappingFlags.RawType) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func EndEvent(_ Metadata: UInt32, _ pData: UnsafeRawPointer?, _ size: UInt32) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "executeCommandLists")
    func ExecuteCommandLists(_ NumCommandLists: UInt32, ppCommandLists: UnsafePointer<UnsafeMutablePointer<CommandList>?>?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clockCalibration")
    func GetClockCalibration(_ pGpuTimestamp: inout UInt64, _ pCpuTimestamp: inout UInt64) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "commandQueueDescription")
    func GetDesc() -> CommandQueueDescription {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "timestampFrequency")
    func GetTimestampFrequency(_ pFrequency: inout UInt64) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func SetMarker(_ Metadata: UInt32, _ pData: UnsafeRawPointer?, _ size: UInt32) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "signal")
    func Signal(_ pFence: Fence, _ Value: UInt32) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "updateTileMappings")
    func UpdateTileMappings(_ pResource: UnsafeMutablePointer<Resource>?, 
                            _ NumResourceRegions: UInt32, 
                            _ pResourceRegionStartCoordinates: UnsafePointer<TiledResourceCoordinate>?, 
                            _ pResourceRegionSizes: UnsafePointer<TileRegionSize>?, 
                            _ pHeap: UnsafeMutablePointer<Heap>?, 
                            _ NumRanges: UInt32,
                            _ pRangeFlags: UnsafePointer<TileRangeFlags>?,
                            _ pHeapRangeStartOffsets: UnsafePointer<UInt32>?,
                            _ pRangeTileCounts: UnsafePointer<UInt32>?,
                            _ Flags: TileMappingFlags) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "signal")
    func Wait(_ pFence: Fence, _ Value: UInt32) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
