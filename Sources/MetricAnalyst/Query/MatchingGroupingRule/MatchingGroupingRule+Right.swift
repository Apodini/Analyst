
public struct RightMatchingGroupingRule: MatchingGroupingRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension MatchingGroupingRule where Self == RightMatchingGroupingRule {

    public static func right(_ labels: String...) -> RightMatchingGroupingRule {
        .init(labels: labels)
    }

    public static func right(_ labels: [String]) -> RightMatchingGroupingRule {
        .init(labels: labels)
    }

}
