
public struct DefaultMatchingRule: MatchingRule {
    public init() {}
}

extension MatchingRule where Self == DefaultMatchingRule {
    public static var `default`: DefaultMatchingRule {
        .init()
    }
}
