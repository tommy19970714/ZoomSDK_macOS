//
//  ViewController.swift
//  ZoomTestApp
//
//  Created by Toshiki Tomihira on 2021/09/06.
//

import Cocoa
import ZoomSDK

class ViewController: NSViewController {
    
    @IBOutlet weak var meetingNumberTextField: NSTextField!
    @IBOutlet weak var meetingPasswordTextField: NSTextField!
    @IBOutlet weak var displayNameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = ZoomSDKInitParams()
        params.needCustomizedUI = false // true
        params.teamIdentifier = nil
        ZoomSDK.shared().initSDK(with: params)
        ZoomSDK.shared().zoomDomain = "https://zoom.us"
        
        let kZoomSDKKey = "SDK_API_KEY"
        let kZoomSDKSecret = "SDK_API_SECRET"
        if let auth = ZoomSDK.shared().getAuthService() {
            auth.delegate = self
            let sdkErr = auth.sdkAuth(kZoomSDKKey, appSecret: kZoomSDKSecret)
            print(sdkErr)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func tappedJoinButton(sender: NSButton) {
        guard let meetingNumber = Int64(meetingNumberTextField.stringValue) else {
            return
        }
        
        let joinParams = ZoomSDKJoinMeetingElements()
        joinParams.userType = ZoomSDKUserType_WithoutLogin
        joinParams.webinarToken = nil
        joinParams.customerKey = nil
        joinParams.meetingNumber = meetingNumber
        joinParams.displayName = displayNameTextField.stringValue
        joinParams.password = meetingPasswordTextField.stringValue
        joinParams.isDirectShare = false
        joinParams.displayID = 0
        joinParams.isNoVideo = false
        joinParams.isNoAuido = false
        joinParams.vanityID = nil
        joinParams.zak = nil
        
        if let meetingService = ZoomSDK.shared().getMeetingService() {
            meetingService.delegate = self
            let actionController = meetingService.getMeetingActionController()
            actionController?.delegate = self
            let err = meetingService.joinMeeting(joinParams)
        }
    }
}

extension ViewController: ZoomSDKAuthDelegate {
    func onZoomSDKAuthReturn(_ returnValue: ZoomSDKAuthError) {
        print(returnValue)
    }
    
    func onZoomAuthIdentityExpired() {
        print("Expired")
    }
}

extension ViewController: ZoomSDKMeetingServiceDelegate, ZoomSDKMeetingActionControllerDelegate {
    func onUserAudioStatusChange(_ userAudioStatusArray: [Any]!) {
        
    }
    
    func onChatMessageNotification(_ chatInfo: ZoomSDKChatInfo!) {
        
    }
    
    func onUserJoin(_ array: [Any]!) {
        
    }
    
    func onUserLeft(_ array: [Any]!) {
        
    }
    
    func onUserInfoUpdate(_ userID: UInt32) {
        
    }
    
    func onHostChange(_ userID: UInt32) {
        
    }
    
    func onCoHostChange(_ userID: UInt32) {
        
    }
    
    func onSpotlightVideoUserChange(_ spotlightedUserList: [Any]!) {
        
    }
    
    func onVideoStatusChange(_ videoStatus: ZoomSDKVideoStatus, userID: UInt32) {
        
    }
    
    func onLowOrRaiseHandStatusChange(_ raise: Bool, userID: UInt32) {
        
    }
    
    func onJoinMeetingResponse(_ joinMeetingHelper: ZoomSDKJoinMeetingHelper!) {
        
    }
    
    func onMulti(toSingleShareNeedConfirm confirmHandle: ZoomSDKMultiToSingleShareConfirmHandler!) {
        
    }
    
    func onActiveVideoUserChanged(_ userID: UInt32) {
        
    }
    
    func onActiveSpeakerVideoUserChanged(_ userID: UInt32) {
        
    }
    
    func onHostAskUnmute() {
        
    }
    
    func onHostAskStartVideo() {
        
    }
    
    func onUserActiveAudioChange(_ useridArray: [Any]!) {
        
    }
    
    func onUserNameChanged(_ userid: UInt32, userName: String!) {
        
    }
    
    func onInvalidReclaimHostKey() {
        
    }
    
    func onMeetingStatusChange(_ state: ZoomSDKMeetingStatus, meetingError error: ZoomSDKMeetingError, end reason: EndMeetingReason) {
        print(state)
    }
}
