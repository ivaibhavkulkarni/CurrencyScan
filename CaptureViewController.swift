//
//  CaptureViewController.swift
//  Currency Conversion and Detection
//
//  Created by Vaibhav kulkarni on 21/02/25.
//

import UIKit
import AVFoundation
import Vision

class CaptureViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var bufferSize: CGSize = .zero
    var rootlayer: CALayer! = nil
    
    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer! = nil
    private let videoDataOutput = AVCaptureVideoDataOutput()
    
    private let videoDataOutputQueue = DispatchQueue(
        label: "VideoDataOutput",
        qos: .userInteractive,
        attributes: [],
        autoreleaseFrequency: .workItem
    )
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Implement frame processing logic here
    }
    
    func setupAVCapture(_ previewView: UIView) {
        var deviceInput: AVCaptureDeviceInput!
        
        // Select a video device and make an input
        guard let videoDevice = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back
        ).devices.first else {
            print("No video device found")
            return
        }
        
        do {
            deviceInput = try AVCaptureDeviceInput(device: videoDevice)
        } catch {
            print("Could not create video device input: \(error)")
            return
        }
        
        session.beginConfiguration()
        session.sessionPreset = .vga640x480
        
        // Add a video input
        guard session.canAddInput(deviceInput) else {
            print("Could not add video device input to the session")
            session.commitConfiguration()
            return
        }
        session.addInput(deviceInput)
        
        if session.canAddOutput(videoDataOutput) {
            session.addOutput(videoDataOutput)
            videoDataOutput.alwaysDiscardsLateVideoFrames = true
            videoDataOutput.videoSettings = [
                kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
            ]
            videoDataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            print("Could not add video data output to the session")
            session.commitConfiguration()
            return
        }
        
        let captureConnection = videoDataOutput.connection(with: .video)
        captureConnection?.isEnabled = true
        
        do {
            try videoDevice.lockForConfiguration()
            let dimensions = CMVideoFormatDescriptionGetDimensions(videoDevice.activeFormat.formatDescription)
            bufferSize.width = CGFloat(dimensions.width)
            bufferSize.height = CGFloat(dimensions.height)
            videoDevice.unlockForConfiguration()
        } catch {
            print("Error configuring video device: \(error)")
        }
        
        session.commitConfiguration()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        rootlayer = previewView.layer
        previewLayer.frame = rootlayer.bounds
        rootlayer.addSublayer(previewLayer)
    }
    
    func startCaptureSession() {
        session.startRunning()
    }
    
    func teardownAVCapture() {
        previewLayer.removeFromSuperlayer()
        previewLayer = nil
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Implement frame processing logic here
    }
    
    public func reqOrientationFromDeviceOrientation() -> CGImagePropertyOrientation {
        let curDeviceOrientation = UIDevice.current.orientation
        switch curDeviceOrientation {
        case .portraitUpsideDown:
            return .left
        case .landscapeLeft:
            return .upMirrored
        case .landscapeRight:
            return .down
        case .portrait:
            return .up
        default:
            return .up
        }
    }
}
