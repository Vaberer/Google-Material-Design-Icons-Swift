//
//  ViewController.swift
//  GMD Swift
//
//  Created by Patrik Vaberer on 8/29/15.
//  Copyright © 2015 Patrik Vaberer. All rights reserved.
//

//
//  ViewController.swift
//  Google Material Design Icons Swift
//
//  Created by Patrik Vaberer on 7/13/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bGithub: UIBarButtonItem!
    @IBOutlet weak var bTwitter: UIBarButtonItem!
    var filteredData = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.delegate = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.barTintColor = UIColor.blueColor()
            controller.searchBar.placeholder = "Type Icon Name"
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        
        bGithub.GMDIcon = GMDType.GMDPublic
        bTwitter.GMDIcon = GMDType.GMDPerson


    
    }
    
    
    //MARK: UITableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let c = tableView.dequeueReusableCellWithIdentifier("IconCell") as! IconCell
        
        c.lFont.text = resultSearchController.active ? filteredData[indexPath.row] : helper[indexPath.row]
        
        let icon = resultSearchController.active ? GMDType(rawValue: helper.indexOf(filteredData[indexPath.row])!) : GMDType(rawValue: indexPath.row)
        c.lSmall.GMDIcon = icon
        c.lMedium.GMDIcon = icon
        c.lBig.GMDIcon = icon
        
        return c
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultSearchController.active ? filteredData.count :  GMDType.count
    }
    
    
    //MARK: Search
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredData = []
        filterContentForSearchText(searchController.searchBar.text!.lowercaseString)
        self.tableView.reloadData()
    }
    
    @IBAction func bGithubPressed(sender: UIBarButtonItem) {
        
        if let requestUrl = NSURL(string: "https://github.com/Vaberer/Google-Material-Design-Icons-Swift") {
            UIApplication.sharedApplication().openURL(requestUrl)
        }
    }
    
    @IBAction func bTwitterPressed(sender: UIBarButtonItem) {
        
        if let twitterURL = NSURL(string: "twitter://user?id=2271666416") {
            
            if UIApplication.sharedApplication().canOpenURL(twitterURL) {
                
                UIApplication.sharedApplication().openURL(twitterURL)
            }
        }
    }
    
    //MARK: Helpers
    func filterContentForSearchText(searchText: String) {
        
        for f in helper {
            if f.lowercaseString.rangeOfString(searchText.lowercaseString) != nil {
                filteredData.append(f)
            }
        }
    }
    
    let helper = ["GMD3DRotation", "GMDAccessibility", "GMDAccountBalance", "GMDAccountBalanceWallet", "GMDAccountBox", "GMDAccountCircle", "GMDAddShoppingCart", "GMDAlarm", "GMDAlarmAdd", "GMDAlarmOff", "GMDAlarmOn", "GMDAndroid", "GMDAnnouncement", "GMDAspectRatio", "GMDAssessment", "GMDAssignment", "GMDAssignmentInd", "GMDAssignmentLate", "GMDAssignmentReturn", "GMDAssignmentReturned", "GMDAssignmentTurnedIn", "GMDAutorenew", "GMDBackup", "GMDBook", "GMDBookmark", "GMDBookmarkBorder", "GMDBugReport", "GMDBuild", "GMDCached", "GMDCameraEnhance", "GMDCardGiftcard", "GMDCardMembership", "GMDCardTravel", "GMDChangeHistory", "GMDCheckCircle", "GMDChromeReaderMode", "GMDClass", "GMDCode", "GMDCreditCard", "GMDDashboard", "GMDDelete", "GMDDescription", "GMDDns", "GMDDone", "GMDDoneAll", "GMDEject", "GMDEvent", "GMDEventSeat", "GMDExitToApp", "GMDExplore", "GMDExtension", "GMDFace", "GMDFavorite", "GMDFavoriteBorder", "GMDFeedback", "GMDFindInPage", "GMDFindReplace", "GMDFlightLand", "GMDFlightTakeoff", "GMDFlipToBack", "GMDFlipToFront", "GMDGetApp", "GMDGif", "GMDGrade", "GMDGroupWork", "GMDHelp", "GMDHelpOutline", "GMDHighlightOff", "GMDHistory", "GMDHome", "GMDHourglassEmpty", "GMDHourglassFull", "GMDHttp", "GMDHttps", "GMDInfo", "GMDInfoOutline", "GMDInput", "GMDInvertColors", "GMDLabel", "GMDLabelOutline", "GMDLanguage", "GMDLaunch", "GMDList", "GMDLock", "GMDLockOpen", "GMDLockOutline", "GMDLoyalty", "GMDMarkunreadMailbox", "GMDNoteAdd", "GMDOfflinePin", "GMDOpenInBrowser", "GMDOpenInNew", "GMDOpenWith", "GMDPageview", "GMDPayment", "GMDPermCameraMic", "GMDPermContactCalendar", "GMDPermDataSetting", "GMDPermDeviceInformation", "GMDPermIdentity", "GMDPermMedia", "GMDPermPhoneMsg", "GMDPermScanWifi", "GMDPictureInPicture", "GMDPlayForWork", "GMDPolymer", "GMDPowerSettingsNew", "GMDPrint", "GMDQueryBuilder", "GMDQuestionAnswer", "GMDReceipt", "GMDRedeem", "GMDReorder", "GMDReportProblem", "GMDRestore", "GMDRoom", "GMDSchedule", "GMDSearch", "GMDSettings", "GMDSettingsApplications", "GMDSettingsBackupRestore", "GMDSettingsBluetooth", "GMDSettingsBrightness", "GMDSettingsCell", "GMDSettingsEthernet", "GMDSettingsInputAntenna", "GMDSettingsInputComponent", "GMDSettingsInputComposite", "GMDSettingsInputHdmi", "GMDSettingsInputSvideo", "GMDSettingsOverscan", "GMDSettingsPhone", "GMDSettingsPower", "GMDSettingsRemote", "GMDSettingsVoice", "GMDShop", "GMDShopTwo", "GMDShoppingBasket", "GMDShoppingCart", "GMDSpeakerNotes", "GMDSpellcheck", "GMDStarRate", "GMDStars", "GMDStore", "GMDSubject", "GMDSupervisorAccount", "GMDSwapHoriz", "GMDSwapVert", "GMDSwapVerticalCircle", "GMDSystemUpdateAlt", "GMDTab", "GMDTabUnselected", "GMDTheaters", "GMDThumbDown", "GMDThumbUp", "GMDThumbsUpDown", "GMDToc", "GMDToday", "GMDToll", "GMDTrackChanges", "GMDTranslate", "GMDTrendingDown", "GMDTrendingFlat", "GMDTrendingUp", "GMDTurnedIn", "GMDTurnedInNot", "GMDVerifiedUser", "GMDViewAgenda", "GMDViewArray", "GMDViewCarousel", "GMDViewColumn", "GMDViewDay", "GMDViewHeadline", "GMDViewList", "GMDViewModule", "GMDViewQuilt", "GMDViewStream", "GMDViewWeek", "GMDVisibility", "GMDVisibilityOff", "GMDWork", "GMDYoutubeSearchedFor", "GMDZoomIn", "GMDZoomOut", "GMDAddAlert", "GMDError", "GMDErrorOutline", "GMDWarning", "GMDAirplay", "GMDAlbum", "GMDAvTimer", "GMDClosedCaption", "GMDEqualizer", "GMDExplicit", "GMDFastForward", "GMDFastRewind", "GMDForward10", "GMDForward30", "GMDForward5", "GMDGames", "GMDHd", "GMDHearing", "GMDHighQuality", "GMDLibraryAdd", "GMDLibraryBooks", "GMDLibraryMusic", "GMDLoop", "GMDMic", "GMDMicNone", "GMDMicOff", "GMDMovie", "GMDNewReleases", "GMDNotInterested", "GMDPause", "GMDPauseCircleFilled", "GMDPauseCircleOutline", "GMDPlayArrow", "GMDPlayCircleFilled", "GMDPlayCircleOutline", "GMDPlaylistAdd", "GMDQueue", "GMDQueueMusic", "GMDRadio", "GMDRecentActors", "GMDRepeat", "GMDRepeatOne", "GMDReplay", "GMDReplay10", "GMDReplay30", "GMDReplay5", "GMDShuffle", "GMDSkipNext", "GMDSkipPrevious", "GMDSnooze", "GMDSortByAlpha", "GMDStop", "GMDSubtitles", "GMDSurroundSound", "GMDVideoLibrary", "GMDVideocam", "GMDVideocamOff", "GMDVolumeDown", "GMDVolumeMute", "GMDVolumeOff", "GMDVolumeUp", "GMDWeb", "GMDBusiness", "GMDCall", "GMDCallEnd", "GMDCallMade", "GMDCallMerge", "GMDCallMissed", "GMDCallReceived", "GMDCallSplit", "GMDChat", "GMDChatBubble", "GMDChatBubbleOutline", "GMDClearAll", "GMDComment", "GMDContactPhone", "GMDContacts", "GMDDialerSip", "GMDDialpad", "GMDEmail", "GMDForum", "GMDImportExport", "GMDInvertColorsOff", "GMDLiveHelp", "GMDLocationOff", "GMDLocationOn", "GMDMessage", "GMDNoSim", "GMDPhone", "GMDPhonelinkErase", "GMDPhonelinkLock", "GMDPhonelinkRing", "GMDPhonelinkSetup", "GMDPortableWifiOff", "GMDPresentToAll", "GMDRingVolume", "GMDSpeakerPhone", "GMDStayCurrentLandscape", "GMDStayCurrentPortrait", "GMDStayPrimaryLandscape", "GMDStayPrimaryPortrait", "GMDSwapCalls", "GMDTextsms", "GMDVoicemail", "GMDVpnKey", "GMDAdd", "GMDAddBox", "GMDAddCircle", "GMDAddCircleOutline", "GMDArchive", "GMDBackspace", "GMDBlock", "GMDClear", "GMDContentCopy", "GMDContentCut", "GMDContentPaste", "GMDCreate", "GMDDrafts", "GMDFilterList", "GMDFlag", "GMDFontDownload", "GMDForward", "GMDGesture", "GMDInbox", "GMDLink", "GMDMail", "GMDMarkunread", "GMDRedo", "GMDRemove", "GMDRemoveCircle", "GMDRemoveCircleOutline", "GMDReply", "GMDReplyAll", "GMDReport", "GMDSave", "GMDSelectAll", "GMDSend", "GMDSort", "GMDTextFormat", "GMDUndo", "GMDAccessAlarm", "GMDAccessAlarms", "GMDAccessTime", "GMDAddAlarm", "GMDAirplanemodeActive", "GMDAirplanemodeInactive", "GMDBatteryAlert", "GMDBatteryChargingFull", "GMDBatteryFull", "GMDBatteryStd", "GMDBatteryUnknown", "GMDBluetooth", "GMDBluetoothConnected", "GMDBluetoothDisabled", "GMDBluetoothSearching", "GMDBrightnessAuto", "GMDBrightnessHigh", "GMDBrightnessLow", "GMDBrightnessMedium", "GMDDataUsage", "GMDDeveloperMode", "GMDDevices", "GMDDvr", "GMDGpsFixed", "GMDGpsNotFixed", "GMDGpsOff", "GMDGraphicEq", "GMDLocationDisabled", "GMDLocationSearching", "GMDNetworkCell", "GMDNetworkWifi", "GMDNfc", "GMDScreenLockLandscape", "GMDScreenLockPortrait", "GMDScreenLockRotation", "GMDScreenRotation", "GMDSdStorage", "GMDSettingsSystemDaydream", "GMDSignalCellular4Bar", "GMDSignalCellularConnectedNoInternet4Bar", "GMDSignalCellularNoSim", "GMDSignalCellularNull", "GMDSignalCellularOff", "GMDSignalWifi4Bar", "GMDSignalWifi4BarLock", "GMDSignalWifiOff", "GMDStorage", "GMDUsb", "GMDWallpaper", "GMDWidgets", "GMDWifiLock", "GMDWifiTethering", "GMDAttachFile", "GMDAttachMoney", "GMDBorderAll", "GMDBorderBottom", "GMDBorderClear", "GMDBorderColor", "GMDBorderHorizontal", "GMDBorderInner", "GMDBorderLeft", "GMDBorderOuter", "GMDBorderRight", "GMDBorderStyle", "GMDBorderTop", "GMDBorderVertical", "GMDFormatAlignCenter", "GMDFormatAlignJustify", "GMDFormatAlignLeft", "GMDFormatAlignRight", "GMDFormatBold", "GMDFormatClear", "GMDFormatColorFill", "GMDFormatColorReset", "GMDFormatColorText", "GMDFormatIndentDecrease", "GMDFormatIndentIncrease", "GMDFormatItalic", "GMDFormatLineSpacing", "GMDFormatListBulleted", "GMDFormatListNumbered", "GMDFormatPaint", "GMDFormatQuote", "GMDFormatSize", "GMDFormatStrikethrough", "GMDFormatTextdirectionLToR", "GMDFormatTextdirectionRToL", "GMDFormatUnderlined", "GMDFunctions", "GMDInsertChart", "GMDInsertComment", "GMDInsertDriveFile", "GMDInsertEmoticon", "GMDInsertInvitation", "GMDInsertLink", "GMDInsertPhoto", "GMDMergeType", "GMDModeComment", "GMDModeEdit", "GMDMoneyOff", "GMDPublish", "GMDSpaceBar", "GMDStrikethroughS", "GMDVerticalAlignBottom", "GMDVerticalAlignCenter", "GMDVerticalAlignTop", "GMDWrapText", "GMDAttachment", "GMDCloud", "GMDCloudCircle", "GMDCloudDone", "GMDCloudDownload", "GMDCloudOff", "GMDCloudQueue", "GMDCloudUpload", "GMDFileDownload", "GMDFileUpload", "GMDFolder", "GMDFolderOpen", "GMDFolderShared", "GMDCast", "GMDCastConnected", "GMDComputer", "GMDDesktopMac", "GMDDesktopWindows", "GMDDeveloperBoard", "GMDDeviceHub", "GMDDock", "GMDGamepad", "GMDHeadset", "GMDHeadsetMic", "GMDKeyboard", "GMDKeyboardArrowDown", "GMDKeyboardArrowLeft", "GMDKeyboardArrowRight", "GMDKeyboardArrowUp", "GMDKeyboardBackspace", "GMDKeyboardCapslock", "GMDKeyboardHide", "GMDKeyboardReturn", "GMDKeyboardTab", "GMDKeyboardVoice", "GMDLaptop", "GMDLaptopChromebook", "GMDLaptopMac", "GMDLaptopWindows", "GMDMemory", "GMDMouse", "GMDPhoneAndroid", "GMDPhoneIphone", "GMDPhonelink", "GMDPhonelinkOff", "GMDPowerInput", "GMDRouter", "GMDScanner", "GMDSecurity", "GMDSimCard", "GMDSmartphone", "GMDSpeaker", "GMDSpeakerGroup", "GMDTablet", "GMDTabletAndroid", "GMDTabletMac", "GMDToys", "GMDTv", "GMDWatch", "GMDAddToPhotos", "GMDAdjust", "GMDAssistant", "GMDAssistantPhoto", "GMDAudiotrack", "GMDBlurCircular", "GMDBlurLinear", "GMDBlurOff", "GMDBlurOn", "GMDBrightness1", "GMDBrightness2", "GMDBrightness3", "GMDBrightness4", "GMDBrightness5", "GMDBrightness6", "GMDBrightness7", "GMDBrokenImage", "GMDBrush", "GMDCamera", "GMDCameraAlt", "GMDCameraFront", "GMDCameraRear", "GMDCameraRoll", "GMDCenterFocusStrong", "GMDCenterFocusWeak", "GMDCollections", "GMDCollectionsBookmark", "GMDColorLens", "GMDColorize", "GMDCompare", "GMDControlPoint", "GMDControlPointDuplicate", "GMDCrop", "GMDCrop169", "GMDCrop32", "GMDCrop54", "GMDCrop75", "GMDCropDin", "GMDCropFree", "GMDCropLandscape", "GMDCropOriginal", "GMDCropPortrait", "GMDCropSquare", "GMDDehaze", "GMDDetails", "GMDEdit", "GMDExposure", "GMDExposureNeg1", "GMDExposureNeg2", "GMDExposurePlus1", "GMDExposurePlus2", "GMDExposureZero", "GMDFilter", "GMDFilter1", "GMDFilter2", "GMDFilter3", "GMDFilter4", "GMDFilter5", "GMDFilter6", "GMDFilter7", "GMDFilter8", "GMDFilter9", "GMDFilter9Plus", "GMDFilterBAndW", "GMDFilterCenterFocus", "GMDFilterDrama", "GMDFilterFrames", "GMDFilterHdr", "GMDFilterNone", "GMDFilterTiltShift", "GMDFilterVintage", "GMDFlare", "GMDFlashAuto", "GMDFlashOff", "GMDFlashOn", "GMDFlip", "GMDGradient", "GMDGrain", "GMDGridOff", "GMDGridOn", "GMDHdrOff", "GMDHdrOn", "GMDHdrStrong", "GMDHdrWeak", "GMDHealing", "GMDImage", "GMDImageAspectRatio", "GMDIso", "GMDLandscape", "GMDLeakAdd", "GMDLeakRemove", "GMDLens", "GMDLooks", "GMDLooks3", "GMDLooks4", "GMDLooks5", "GMDLooks6", "GMDLooksOne", "GMDLooksTwo", "GMDLoupe", "GMDMonochromePhotos", "GMDMovieCreation", "GMDMusicNote", "GMDNature", "GMDNaturePeople", "GMDNavigateBefore", "GMDNavigateNext", "GMDPalette", "GMDPanorama", "GMDPanoramaFishEye", "GMDPanoramaHorizontal", "GMDPanoramaVertical", "GMDPanoramaWideAngle", "GMDPhoto", "GMDPhotoAlbum", "GMDPhotoCamera", "GMDPhotoLibrary", "GMDPhotoSizeSelectActual", "GMDPhotoSizeSelectLarge", "GMDPhotoSizeSelectSmall", "GMDPictureAsPdf", "GMDPortrait", "GMDRemoveRedEye", "GMDRotate90DegreesCcw", "GMDRotateLeft", "GMDRotateRight", "GMDSlideshow", "GMDStraighten", "GMDStyle", "GMDSwitchCamera", "GMDSwitchVideo", "GMDTagFaces", "GMDTexture", "GMDTimelapse", "GMDTimer", "GMDTimer10", "GMDTimer3", "GMDTimerOff", "GMDTonality", "GMDTransform", "GMDTune", "GMDViewComfy", "GMDViewCompact", "GMDVignette", "GMDWbAuto", "GMDWbCloudy", "GMDWbIncandescent", "GMDWbIridescent", "GMDWbSunny", "GMDBeenhere", "GMDDirections", "GMDDirectionsBike", "GMDDirectionsBoat", "GMDDirectionsBus", "GMDDirectionsCar", "GMDDirectionsRailway", "GMDDirectionsRun", "GMDDirectionsSubway", "GMDDirectionsTransit", "GMDDirectionsWalk", "GMDFlight", "GMDHotel", "GMDLayers", "GMDLayersClear", "GMDLocalActivity", "GMDLocalAirport", "GMDLocalAtm", "GMDLocalBar", "GMDLocalCafe", "GMDLocalCarWash", "GMDLocalConvenienceStore", "GMDLocalDining", "GMDLocalDrink", "GMDLocalFlorist", "GMDLocalGasStation", "GMDLocalGroceryStore", "GMDLocalHospital", "GMDLocalHotel", "GMDLocalLaundryService", "GMDLocalLibrary", "GMDLocalMall", "GMDLocalMovies", "GMDLocalOffer", "GMDLocalParking", "GMDLocalPharmacy", "GMDLocalPhone", "GMDLocalPizza", "GMDLocalPlay", "GMDLocalPostOffice", "GMDLocalPrintshop", "GMDLocalSee", "GMDLocalShipping", "GMDLocalTaxi", "GMDMap", "GMDMyLocation", "GMDNavigation", "GMDPersonPin", "GMDPinDrop", "GMDPlace", "GMDRateReview", "GMDRestaurantMenu", "GMDSatellite", "GMDStoreMallDirectory", "GMDTerrain", "GMDTraffic", "GMDApps", "GMDArrowBack", "GMDArrowDropDown", "GMDArrowDropDownCircle", "GMDArrowDropUp", "GMDArrowForward", "GMDCancel", "GMDCheck", "GMDChevronLeft", "GMDChevronRight", "GMDClose", "GMDExpandLess", "GMDExpandMore", "GMDFullscreen", "GMDFullscreenExit", "GMDMenu", "GMDMoreHoriz", "GMDMoreVert", "GMDRefresh", "GMDAdb", "GMDAirlineSeatFlat", "GMDAirlineSeatFlatAngled", "GMDAirlineSeatIndividualSuite", "GMDAirlineSeatLegroomExtra", "GMDAirlineSeatLegroomNormal", "GMDAirlineSeatLegroomReduced", "GMDAirlineSeatReclineExtra", "GMDAirlineSeatReclineNormal", "GMDBluetoothAudio", "GMDConfirmationNumber", "GMDDiscFull", "GMDDoNotDisturb", "GMDDoNotDisturbAlt", "GMDDriveEta", "GMDEventAvailable", "GMDEventBusy", "GMDEventNote", "GMDFolderSpecial", "GMDLiveTv", "GMDMms", "GMDMore", "GMDNetworkLocked", "GMDOndemandVideo", "GMDPersonalVideo", "GMDPhoneBluetoothSpeaker", "GMDPhoneForwarded", "GMDPhoneInTalk", "GMDPhoneLocked", "GMDPhoneMissed", "GMDPhonePaused", "GMDPower", "GMDSdCard", "GMDSimCardAlert", "GMDSms", "GMDSmsFailed", "GMDSync", "GMDSyncDisabled", "GMDSyncProblem", "GMDSystemUpdate", "GMDTapAndPlay", "GMDTimeToLeave", "GMDVibration", "GMDVoiceChat", "GMDVpnLock", "GMDWc", "GMDWifi", "GMDCake", "GMDDomain", "GMDGroup", "GMDGroupAdd", "GMDLocationCity", "GMDMood", "GMDMoodBad", "GMDNotifications", "GMDNotificationsActive", "GMDNotificationsNone", "GMDNotificationsOff", "GMDNotificationsPaused", "GMDPages", "GMDPartyMode", "GMDPeople", "GMDPeopleOutline", "GMDPerson", "GMDPersonAdd", "GMDPersonOutline", "GMDPlusOne", "GMDPoll", "GMDPublic", "GMDSchool", "GMDShare", "GMDWhatshot", "GMDCheckBox", "GMDCheckBoxOutlineBlank", "GMDIndeterminateCheckBox", "GMDRadioButtonChecked", "GMDRadioButtonUnchecked", "GMDStar", "GMDStarBorder", "GMDStarHalf"]
}
