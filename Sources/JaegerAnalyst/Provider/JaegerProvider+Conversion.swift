
extension JaegerProvider {

    func span(for span: JaegerSpan) -> Span? {
        Span(
            name: span.operationName,
            context: .init(traceID: UUID(data: span.traceID), spanID: UUID(data: span.spanID)),
            references: span.references.compactMap(spanReference),
            startTime: span.startTime.date,
            endTime: span.startTime.date.addingTimeInterval(span.duration.timeInterval),
            tags: tags(from: span.tags),
            logs: logs(from: span.logs),
            process: process(for: span.process),
            warnings: span.warnings
        )
    }

    private func spanReference(from reference: JaegerSpanReference) -> Span.Reference? {

        let context = Span.Context(
            traceID: UUID(data: reference.traceID),
            spanID: UUID(data: reference.spanID)
        )

        switch reference.refType {
        case .childOf:
            return .child(of: context)
        case .followsFrom:
            return .follows(from: context)
        case .UNRECOGNIZED:
            return nil
        }

    }

    private func logs(from logs: [JaegerLog]) -> [Log] {
        logs.map { log in
            Log(
                date: log.timestamp.date,
                tags: tags(from: log.fields)
            )
        }
    }

    private func tags(from tags: [JaegerTag]) -> [Tag.Key: Tag.Value] {
        Dictionary(grouping: tags, by: { $0.key })
        .compactMapValues { $0.first.flatMap(tagValue) }
    }

    private func tagValue(for tag: JaegerTag) -> Tag.Value? {
        switch tag.vType {
        case .string:
            return .string(tag.vStr)
        case .bool:
            return .boolean(tag.vBool)
        case .int64:
            return .integer(Int(tag.vInt64))
        case .float64:
            return .double(tag.vFloat64)
        case .binary:
            return .data(tag.vBinary)
        case .UNRECOGNIZED:
            return nil
        }
    }

    private func process(for process: JaegerProcess) -> Process {
        Process(service: process.serviceName, tags: tags(from: process.tags))
    }

}

extension UUID {

    fileprivate init(data: Data) {
        guard data.count >= MemoryLayout<uuid_t>.size else {
            self = UUID(data: Data(repeating: 0, count: MemoryLayout<uuid_t>.size - data.count) + data)
            return
        }
        var uuid = UUID().uuid
        uuid.0 = data[0]
        uuid.1 = data[1]
        uuid.2 = data[2]
        uuid.3 = data[3]
        uuid.4 = data[4]
        uuid.5 = data[5]
        uuid.6 = data[6]
        uuid.7 = data[7]
        uuid.8 = data[8]
        uuid.9 = data[9]
        uuid.10 = data[10]
        uuid.11 = data[11]
        uuid.12 = data[12]
        uuid.13 = data[13]
        uuid.14 = data[14]
        uuid.15 = data[15]
        self = UUID(uuid: uuid)
    }

}
