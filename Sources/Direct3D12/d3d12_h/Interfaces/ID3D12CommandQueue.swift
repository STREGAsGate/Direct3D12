/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

public class CommandQueue: Pageable {

    /** 
    Copies mappings from a source reserved resource to a destination reserved resource.
    - parameter srcResource: A pointer to the source reserved resource.
    - parameter sourceStartCoord: A pointer to a D3D12_TILED_RESOURCE_COORDINATE structure that describes the starting coordinates of the source reserved resource.
    - parameter dstResource: A pointer to the destination reserved resource.
    - parameter destinationStartCoord: A pointer to a D3D12_TILED_RESOURCE_COORDINATE structure that describes the starting coordinates of the destination reserved resource.
    - parameter regionSize: A pointer to a D3D12_TILE_REGION_SIZE structure that describes the size of the reserved region.
    - parameter flags: One member of D3D12_TILE_MAPPING_FLAGS.
    */
    public func copyTileMappings(from srcResource: Resource, sourceStartCoord: TiledResourceCoordinate, 
                                 to dstResource: Resource, destinationStartCoord: TiledResourceCoordinate, 
                                 regionSize: TileRegionSize, flags: TileMappingFlags) throws {
        try self.perform(as: RawValue.self) {(com) in
            let dstResource = try dstResource.perform(as: Resource.RawValue.self) {$0.pThis}
            var dstCoord = destinationStartCoord.rawValue
            let srcResource = try srcResource.perform(as: Resource.RawValue.self) {$0.pThis}
            var srcCoord = sourceStartCoord.rawValue
            var regionSize = regionSize.rawValue
            let flags = TileMappingFlags.RawType(rawValue: flags.rawValue)
            com.this.lpVtbl.pointee.CopyTileMappings(com.pThis, dstResource, &dstCoord, srcResource, &srcCoord, &regionSize,  flags)
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
    @available(*, unavailable, message: "Not intended to be called directly.  Use the PIX event runtime to insert events into a command queue.")
    func BeginEvent(_ metadata: UInt32, _ pData: UnsafeRawPointer?, _ size: UInt32) {fatalError("This API is here to make migration easier. There is no implimnetation.")}

    @available(*, unavailable, renamed: "copyTileMappings")
    func CopyTileMappings(_ pDstResource: UnsafeMutablePointer<Resource.RawValue>?, _ pDstRegionStartCoordinate: UnsafeMutablePointer<TiledResourceCoordinate.RawValue>?, 
                          _ pSrcResource: UnsafeMutablePointer<Resource.RawValue>?, _ pSrcRegionStartCoordinate: UnsafeMutablePointer<TiledResourceCoordinate.RawValue>?, 
                          _ pRegionSize: UnsafePointer<TileRegionSize.RawValue>, _ Flags: TileMappingFlags.RawType) {
        fatalError("This API is here to make migration easier. There is no implimnetation.")
    }
}

#endif
