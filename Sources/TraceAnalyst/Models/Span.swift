
import Foundation

public struct Span {

    // MARK: Stored Properties

    public let name: String
    public let context: Span.Context
    public let references: [Span.Reference]
    public let startTime: Date
    public let endTime: Date
    public let tags: [Tag.Key: Tag.Value]
    public let logs: [Log]
    public let process: Process
    public let warnings: [String]

    // MARK: Initialization

    public init(name: String,
                context: Span.Context,
                references: [Span.Reference],
                startTime: Date,
                endTime: Date,
                tags: [Tag.Key: Tag.Value],
                logs: [Log],
                process: Process,
                warnings: [String]) {

        self.name = name
        self.context = context
        self.references = references
        self.startTime = startTime
        self.endTime = endTime
        self.tags = tags
        self.logs = logs
        self.process = process
        self.warnings = warnings
    }

}

// MARK: - Nested Types

extension Span {

    public struct Context: Hashable {

        // MARK: Stored Properties

        public let traceID: UUID
        public let spanID: UUID

        // MARK: Initialization

        public init(traceID: UUID, spanID: UUID) {
            self.traceID = traceID
            self.spanID = spanID
        }

    }

    public struct Reference: Hashable {

        // MARK: Nested Types

        public enum Kind: String {
            case childOf
            case followsFrom
        }

        // MARK: Stored Properties

        public let kind: Reference.Kind
        public let context: Span.Context

        // MARK: Factory Functions

        public static func child(of parent: Span.Context) -> Reference {
            .init(kind: .childOf, context: parent)
        }

        public static func follows(from parent: Span.Context) -> Reference {
            .init(kind: .followsFrom, context: parent)
        }

    }

}

// MARK: - CustomStringConvertible

extension Span: CustomStringConvertible {

    public var description: String {
        "Span(name: \"\(name)\", context: \(context), references: \(references), startTime: \(startTime), endTime: \(endTime), tags: \(tags), logs: \(logs), process: \(process), warnings: \(warnings))"
    }

}

extension Span.Context: CustomStringConvertible {

    public var description: String {
        "Context(traceID: \"\(traceID)\", spanID: \"\(spanID)\")"
    }

}

extension Span.Reference: CustomStringConvertible {

    public var description: String {
        switch kind {
        case .childOf:
            return ".child(of: \(context))"
        case .followsFrom:
            return ".follows(from: \(context))"
        }
    }

}
