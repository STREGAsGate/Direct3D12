/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK
import SwiftCOM

//TODO: Replace these with the equivalent implimentation from SwiftCOM

fileprivate var E_INVALIDARG: HRESULT {
    HRESULT(bitPattern: 0x80070057)
}

public typealias IUnknown = SwiftCOM.IUnknown

public extension IUnknown {
    struct ComManager<WinSDKType> {
        public let pThis: UnsafeMutablePointer<WinSDKType>
        public var this: WinSDKType {
            return pThis.pointee
        }

        fileprivate init(comObject: IUnknown, sdkType: WinSDKType.Type) throws {
            guard let pUnk = UnsafeMutableRawPointer(comObject.pUnk) else {
                throw COMError(hr: E_INVALIDARG)
            }
            pThis = pUnk.bindMemory(to: sdkType, capacity: 1)
        }

        public func pointer<T>(to comObject: IUnknown, as pType: T.Type) throws -> UnsafeMutablePointer<T> {
            guard let pUnk = UnsafeMutableRawPointer(comObject.pUnk) else {
                throw COMError(hr: E_INVALIDARG)
            }
            return pUnk.bindMemory(to: pType, capacity: 1)
        }

        public func checkResult(isMemberOf passable: Set<HRESULT>, _ body: @autoclosure () -> HRESULT) throws {
            let hr: HRESULT = body()
            guard passable.contains(hr) else { throw COMError(hr: hr) }
        }
        public func checkResult(is passable: HRESULT = S_OK, _ body: @autoclosure () -> HRESULT) throws {
            let hr: HRESULT = body()
            guard hr == passable else { throw COMError(hr: hr) }
        }
    }

    func perform<Type, ResultType>(as type: Type.Type, _ body: (_ com: ComManager<Type>) throws -> ResultType) throws -> ResultType {
        let com = try ComManager(comObject: self, sdkType: type)
        return try body(com)
    }

    func performFatally<Type, ResultType>(as type: Type.Type, _ body: (_ com: ComManager<Type>) throws -> ResultType) -> ResultType {
        do {
            let com = try ComManager(comObject: self, sdkType: type)
            return try body(com)
        }catch let error as SwiftCOM.COMError {
            fatalError(error.description)
        }catch let error as Error {
            fatalError(error.description)
        }catch{
            fatalError("\(error)")
        }
    }
}