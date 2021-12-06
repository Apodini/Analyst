
public struct DefaultMatchingGroupingRule: MatchingGroupingRule {
    public init() {}
}

extension MatchingGroupingRule where Self == DefaultMatchingGroupingRule {
    public static var `default`: DefaultMatchingGroupingRule {
        .init()
    }
}
