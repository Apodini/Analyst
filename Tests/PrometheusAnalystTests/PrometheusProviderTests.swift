//
//  File.swift
//  
//
//  Created by Paul Kraft on 04.12.21.
//

import Foundation
import PrometheusAnalyst
import XCTest

@available(macOS 12, *)
final class PrometheusProviderTests: XCTestCase {

    // MARK: Stored Properties

    private static var process: Process!
    private static let url = URL(string: "http://localhost:9090/")!

    // MARK: Computed Properties

    private class var folderURL: URL! {
        Bundle.module.resourceURL?.appendingPathComponent("prometheus")
    }

    private class var configurationURL: URL! {
        folderURL?.appendingPathComponent("prometheus.yml")
    }

    private class var executableURL: URL! {
        folderURL?.appendingPathComponent("prometheus")
    }

    // MARK: Overrides

    override class func setUp() {
        super.setUp()

        process = try! startPrometheus()
        Thread.sleep(forTimeInterval: 1)
        MetricsSystem.provide(from: url, using: .shared)
    }

    override class func tearDown() {
        super.tearDown()

        process.terminate()
        Thread.sleep(forTimeInterval: 1)
    }

    // MARK: Tests

    func testConfiguration() async throws {
        let configuration = try await MetricsSystem.fetchConfiguration()
        let configurationFileContent = try Data(contentsOf: Self.configurationURL)
        XCTAssertEqual(configuration, String(data: configurationFileContent, encoding: .utf8))
    }

    func testFlags() async throws {
        let flags = try await MetricsSystem.fetchFlags()
        XCTAssertGreaterThan(flags.count, 0)
    }

    func testLabels() async throws {
        let labels = try await MetricsSystem.fetchLabels(matching: "prometheus_target_interval_length_seconds")

        let actualSet = Set(labels)
        let requiredSet = Set(["__name__", "instance", "interval", "job", "quantile"])
        XCTAssert(requiredSet.subtracting(actualSet).isEmpty)
    }

    func testVectorQuery() async throws {
        let response = try await MetricsSystem.fetch(vector: 2 * "prometheus_target_interval_length_seconds")
        print(response)
    }

    // MARK: Helpers

    private class func startPrometheus() throws -> Process {
        let process = Process()
        process.executableURL = executableURL
        process.arguments = ["--config.file=" + configurationURL.path]
        process.standardOutput = pipe(label: "prometheus-std")
        process.standardError = pipe(label: "prometheus-err")
        try process.run()
        return process
    }

    private class func pipe(label: String) -> Pipe {
        let pipe = Pipe()
        pipe.fileHandleForReading.readabilityHandler = { pipe in
            let data = pipe.availableData
            guard !data.isEmpty, let string = String(data: data, encoding: .utf8) else {
                return
            }
            print("[\(label)]:", string, terminator: "")
        }
        return pipe
    }

}

