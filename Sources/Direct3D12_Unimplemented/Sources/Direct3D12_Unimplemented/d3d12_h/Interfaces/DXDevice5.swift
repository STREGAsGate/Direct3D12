/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.17763)
public extension Device {

    /** Reports the compatibility of serialized data, such as a serialized raytracing acceleration structure resulting from a call to CopyRaytracingAccelerationStructure with mode D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_SERIALIZE, with the current device/driver.
    - parameter type: The type of the serialized data. For more information, see D3D12_SERIALIZED_DATA_TYPE.
    - parameter identifier: Identifier from the header of the serialized data to check with the driver. For more information, see D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.
    */
    func checkDriverMatchingIdentifier(type: SerializedDataType, identifier: SerializedDataDriverMatchingIdentifier) -> DriverMatchingIdentifierStatus {
        return performFatally(as: RawValue5.self) {pThis in
            let SerializedDataType = type.rawValue
            var pIdentifierToCheck = identifier.rawValue
            let v = pThis.pointee.lpVtbl.pointee.CheckDriverMatchingIdentifier(pThis, SerializedDataType, &pIdentifierToCheck)
            return DriverMatchingIdentifierStatus(v)
        }
    }

    /** Creates a lifetime tracker associated with an application-defined callback; the callback receives notifications when the lifetime of a tracked object is changed.
    - parameter owner: A pointer to an ID3D12LifetimeOwner interface representing the application-defined callback.
    - retruns: A pointer to a memory block that receives the requested interface pointer to the created object.
    */
    func createLifetimeTracker(with owner: LifetimeOwner) throws -> LifetimeTracker {
        return try perform(as: RawValue5.self) {pThis in
            let pOwner = try owner.perform(as: LifetimeOwner.RawValue.self) {$0}
            var riid = LifetimeTracker.interfaceID
            var ppvTracker: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateLifetimeTracker(pThis, pOwner, &riid, &ppvTracker).checkResult(self, #function)
            guard let p = ppvTracker else {throw Error(.invalidArgument)}
            return LifetimeTracker(win32Pointer: p)
        }
    }

    /** Creates an instance of the specified meta command.
    - parameter multipleAdapterNodeMask: For single-adapter operation, set this to zero. If there are multiple adapter nodes, set a bit to identify the node (one of the device's physical adapters) to which the meta command applies. Each bit in the mask corresponds to a single node. Only one bit must be set. See Multi-adapter systems.
    - parameter parameters: An optional pointer to a constant structure containing the values of the parameters for creating the meta command.
    */
    func createMetaCommand(wihtID id: GUID,
                           multipleAdapterNodeMask: UInt32 = 0,
                           parameters: Any?) throws -> MetaCommand {
        return try perform(as: RawValue5.self) {pThis in
            var CommandId = id
            let NodeMask = multipleAdapterNodeMask
            var pCreationParametersData = parameters
            let CreationParametersDataSizeInBytes = UInt64(MemoryLayout.size(ofValue: parameters))
            var riid = MetaCommand.interfaceID
            var ppMetaCommand: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateMetaCommand(pThis, &CommandId, NodeMask, &pCreationParametersData, CreationParametersDataSizeInBytes, &riid, &ppMetaCommand).checkResult(self, #function)
            guard let p = ppMetaCommand else {throw Error(.invalidArgument)}
            return MetaCommand(win32Pointer: p)
        }
    }

    /** Creates an ID3D12StateObject.
    - parameter description: The description of the state object to create.
    */
    func createStateObject(description: StateObjectDescription) throws -> StateObject {
        return try perform(as: RawValue5.self) {pThis in
            var pDesc = description.rawValue
            var riid = StateObject.interfaceID
            var ppStateObject: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateStateObject(pThis, &pDesc, &riid, &ppStateObject).checkResult(self, #function)
            guard let p = ppStateObject else {throw Error(.invalidArgument)}
            return StateObject(win32Pointer: p)
        }
    }

    /** No implementation

    */
    func enumerateMetaCommandParameters(forID id: GUID,
                                        stage: MetaCommandParameterStage,
                                        totalStructureSize: UInt32?) throws -> [MetaCommandParameterDescription] {
        return try perform(as: RawValue5.self) {pThis in
            var CommandId = id
            let Stage = stage.rawValue
            var pTotalStructureSizeInBytes = totalStructureSize ?? 0
            var pParameterCount: UInt32 = 0
            try pThis.pointee.lpVtbl.pointee.EnumerateMetaCommandParameters(pThis, &CommandId, Stage, &pTotalStructureSizeInBytes, &pParameterCount, nil).checkResult(self, #function)
            let pParameterDescs = UnsafeMutableBufferPointer<MetaCommandParameterDescription.RawValue>(start: nil, count: Int(pParameterCount))
            try pThis.pointee.lpVtbl.pointee.EnumerateMetaCommandParameters(pThis, &CommandId, Stage, &pTotalStructureSizeInBytes, &pParameterCount, pParameterDescs.baseAddress).checkResult(self, #function)
            return pParameterDescs.map({MetaCommandParameterDescription($0)})
        }
    }

    /** No implementation

    */
    func enumerateMetaCommands() throws -> [MetaCommandDescription] {
        // https://docs.microsoft.com/en-us/windows/win32/api/d3d12/nf-d3d12-id3d12device5-enumeratemetacommandparameters
        fatalError("no implementation")
    }

    /** Query the driver for resource requirements to build an acceleration structure.
    - parameter description: Description of the acceleration structure build. This structure is shared with BuildRaytracingAccelerationStructure. For more information, see D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS. The implementation is allowed to look at all the CPU parameters in this struct and nested structs. It may not inspect/dereference any GPU virtual addresses, other than to check to see if a pointer is NULL or not, such as the optional transform in D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC, without dereferencing it. In other words, the calculation of resource requirements for the acceleration structure does not depend on the actual geometry data (such as vertex positions), rather it can only depend on overall properties, such as the number of triangles, number of instances etc.
    */
    func raytracingAccelerationStructurePrebuildInfo(description: BuildRaytracingAccelerationStructureInputs) -> RaytracingAccelerationStructurePrebuildInfo {
        return performFatally(as: RawValue5.self) {pThis in
            var pDesc = description.rawValue
            var pInfo = RaytracingAccelerationStructurePrebuildInfo.RawValue()
            pThis.pointee.lpVtbl.pointee.GetRaytracingAccelerationStructurePrebuildInfo(pThis, &pDesc, &pInfo)
            return RaytracingAccelerationStructurePrebuildInfo(pInfo)
        }
    }

    /// You can call RemoveDevice to indicate to the Direct3D 12 runtime that the GPU device encountered a problem, and can no longer be used. Doing so will cause all devices' monitored fences to be signaled. Your application typically doesn't need to explicitly call RemoveDevice.
    func remove() {
        performFatally(as: RawValue5.self) {pThis in
            pThis.pointee.lpVtbl.pointee.RemoveDevice(pThis)
        }
    }
}

@available(Windows, introduced: 10.0.17763)
extension Device {
    typealias RawValue5 = WinSDK.ID3D12Device5
    convenience init(_ rawValue: inout RawValue5) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.17763)
extension Device.RawValue5 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device5}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device5 = Device

@available(Windows, introduced: 10.0.17763)
extension Device {
    @available(*, unavailable, renamed: "checkDriverMatchingIdentifier")
    func CheckDriverMatchingIdentifier(_ SerializedDataType: Any,
                                       _ pIdentifierToCheck: Any) -> DriverMatchingIdentifierStatus.RawValue {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createLifetimeTracker")
    func createLifetimeTracker(_ pOwner: Any,
                               _ riid: Any,
                               _ ppvTracker: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createMetaCommand")
    func CreateMetaCommand(_ CommandId: Any,
                           _ NodeMask: Any,
                           _ pCreationParametersData: Any,
                           _ CreationParametersDataSizeInBytes: Any,
                           _ riid: Any,
                           _ ppMetaCommand: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createStateObject")
    func CreateStateObject(_ pDesc: Any,
                           _ riid: Any,
                           _ ppStateObject: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "enumerateMetaCommandParameters")
    func EnumerateMetaCommandParameters(_ CommandId: Any,
                                        _ Stage: Any,
                                        _ pTotalStructureSizeInBytes: Any,
                                        _ pParameterCount: Any,
                                        _ pParameterDescs: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "enumerateMetaCommands")
    func EnumerateMetaCommands(_ pNumMetaCommands: inout Any,
                               _ pDescs: inout Any?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
    
    @available(*, unavailable, renamed: "raytracingAccelerationStructurePrebuildInfo")
    func GetRaytracingAccelerationStructurePrebuildInfo(_ pDesc: Any,
                                                        _ pInfo: inout Any?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "remove")
    func RemoveDevice() {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
