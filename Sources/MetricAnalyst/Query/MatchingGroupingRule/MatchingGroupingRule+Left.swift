
public struct LeftMatchingGroupingRule: MatchingGroupingRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension MatchingGroupingRule where Self == LeftMatchingGroupingRule {

    public static func left(_ labels: String...) -> LeftMatchingGroupingRule {
        .init(labels: labels)
    }

    public static func left(_ labels: [String]) -> LeftMatchingGroupingRule {
        .init(labels: labels)
    }

}
