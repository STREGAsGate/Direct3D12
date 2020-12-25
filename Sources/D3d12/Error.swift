
import SwiftCOM
import _d3d12

extension Error {
    public enum Kind {
        case unknownError
        case pUnkFailed
        case hresult(HRESULT)
        case text(String)
    }
}

public struct Error: Swift.Error {
    let kind: Kind
    internal init(_ kind: Kind) {
        self.kind = kind
    }
}

extension Error: CustomStringConvertible {
    public var description: String {
        switch kind {
        case let .hresult(hr):
            //SwiftCOM already handles parsing HRESULT errors, so use it.
            return SwiftCOM.COMError(hr: hr).description
        case let .text(text):
            return text
        case .pUnkFailed:
            return "Unable to retrieve a pointer from COM."
        default:
            return "\(kind)"
        }
    }
}

extension Error: CustomDebugStringConvertible {
    public var debugDescription: String {
        return description
    }
}