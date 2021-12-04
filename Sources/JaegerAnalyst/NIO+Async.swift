
import NIO

@available(macOS 12, *)
extension EventLoopFuture {

    internal var value: Value {
        get async throws {
            try await result.get()
        }
    }

    internal var result: Result<Value, Error> {
        get async throws {
            await withCheckedContinuation { continuation in
                self.whenComplete { continuation.resume(returning: $0) }
            }
        }
    }

}
