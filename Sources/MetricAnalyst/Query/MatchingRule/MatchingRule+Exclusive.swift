
public struct ExclusiveMatchingRule: MatchingRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension MatchingRule where Self == ExclusiveMatchingRule {

    public static func `on`(_ labels: String...) -> ExclusiveMatchingRule {
        .init(labels: labels)
    }

    public static func `on`(_ labels: [String]) -> ExclusiveMatchingRule {
        .init(labels: labels)
    }

}
