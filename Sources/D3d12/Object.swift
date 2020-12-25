
import SwiftCOM
import _d3d12

///Gets application-defined data from a device object.
open class Object: SwiftCOM.IUnknown {
    override public class var IID: IID { IID_ID3D12Object }
}
