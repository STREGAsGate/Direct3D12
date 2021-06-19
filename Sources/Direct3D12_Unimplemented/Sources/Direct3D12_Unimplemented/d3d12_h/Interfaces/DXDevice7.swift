/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.19041)
public extension Device {

    /** Incrementally add to an existing state object. This incurs lower CPU overhead than creating a state object from scratch that is a superset of an existing one (for example, adding a few more shaders).
    - parameter object: Existing state object, which can be in use (for example, active raytracing) during this operation. The existing state object must not be of type Collection.
    - parameter addition: Description of state object contents to add to existing state object. To help generate this see the CD3D12_STATE_OBJECT_DESC helper in class in d3dx12.h.
    - returns: Returned state object.
    Behavior is undefined if shader identifiers are retrieved for new shaders from this call and they are accessed via shader tables by any already existing or in-flight command list that references some older state object. Use of the new shaders added to the state object can occur only from commands (such as DispatchRays or ExecuteIndirect calls) recorded in a command list after the call to AddToStateObject.
    */
    func addToStateObject(_ object: StateObject, addition: StateObjectDescription) throws -> StateObject {
        return try perform(as: RawValue7.self) {pThis in 
            var pAddition = addition.rawValue
            let pStateObjectToGrowFrom = try object.perform(as: StateObject.RawValue.self) {$0}
            var riid = StateObject.interfaceID
            var ppNewStateObject: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.AddToStateObject(pThis, &pAddition, pStateObjectToGrowFrom, &riid, &ppNewStateObject).checkResult(self, #function)
            guard let p = ppNewStateObject else {throw Error(.invalidArgument)}
            return StateObject(win32Pointer: p)
        }
    }

    /** CreateProtectedResourceSession1 revises the ID3D12Device4::CreateProtectedResourceSession method with provision (in the structure passed via the pDesc parameter) for a globally unique identifier (GUID) that indicates the type of protected resource session.
    - parameter description: A pointer to a constant D3D12_PROTECTED_RESOURCE_SESSION_DESC1 structure, describing the session to create.
    - returns: A pointer to a memory block that receives a pointer to the session for the given protected session (the specific interface type returned depends on riid).
    */
    func createProtectedResourceSession(description: ProtectedResourceSessionDescription1) throws -> ProtectedResourceSession {
        return try perform(as: RawValue7.self) {pThis in
            var pDesc = description.rawValue
            var riid = ProtectedResourceSession.interfaceID
            var ppSession: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateProtectedResourceSession1(pThis, &pDesc, &riid, &ppSession).checkResult(self, #function)
            guard let p = ppSession else {throw Error(.invalidArgument)}
            return ProtectedResourceSession(win32Pointer: p)
        }
    }

}

@available(Windows, introduced: 10.0.19041)
extension Device {
    typealias RawValue7 = WinSDK.ID3D12Device7
    convenience init(_ rawValue: inout RawValue7) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.19041)
extension Device.RawValue7 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device7}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device7 = Device

@available(Windows, introduced: 10.0.19041)
public extension Device {
    @available(*, unavailable, renamed: "addToStateObject")
    func AddToStateObject(_ pAddition: Any,
                          _ pStateObjectToGrowFrom: Any,
                          _ riid: Any,
                          _ ppNewStateObject: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createProtectedResourceSession")
    func CreateProtectedResourceSession1(_ pDesc: Any,
                                         _ riid: Any,
                                         _ ppSession: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

}

#endif
