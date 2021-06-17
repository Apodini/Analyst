
public struct Dependency {

    // MARK: Stored Properties

    public let parent: String
    public let child: String
    public let callCount: Int
    public let source: String

    // MARK: Initialization

    public init(parent: String, child: String, callCount: Int, source: String) {
        self.parent = parent
        self.child = child
        self.callCount = callCount
        self.source = source
    }

}
