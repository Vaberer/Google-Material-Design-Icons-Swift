import Foundation
import UIKit

public extension UIButton {
    
    /**
    To set an icon, use i.e. `buttonName.setGMDIcon(GMDType.GMBPublic, forState: .Normal)`
    */
    func setGMDIcon(_ icon: GMDType, forState state: UIControlState = .normal, iconSize:CGFloat? = nil) {
        
        if let titleLabel = titleLabel {
            
            FontLoader.loadFontIfNeeded()
            let font = UIFont(name: GMDStruct.FontName, size: iconSize ?? titleLabel.font.pointSize)
            assert(font != nil, GMDStruct.ErrorAnnounce)
            titleLabel.font = font!
            setTitle(icon.text, for: state)
        }
    }
}

public extension UILabel {
    
    /**
    To set an icon, use i.e. `labelName.GMDIcon = GMDType.GMDAdjust`
    */
    var GMDIcon: GMDType? {
        
        set {
            
            if let newValue = newValue {
                
                FontLoader.loadFontIfNeeded()
                let googleMaterialDesignFont = UIFont(name: GMDStruct.FontName, size: self.font.pointSize)
                assert(googleMaterialDesignFont != nil, GMDStruct.ErrorAnnounce)
                font = googleMaterialDesignFont!
                text = newValue.text
            }
        }
        
        get {
            if let text = text {
                
                if let index =  GMDIcons.index(of: text) {
                    return GMDType(rawValue: index)
                }
            }
            return nil
        }
    }
}

public extension UIBarButtonItem {
    
    /**
    To set an icon, use i.e. `barName.GMDIcon = GMDType.GMDPublic`
    */
    func setGMDIcon(_ icon: GMDType, iconSize: CGFloat) {
        
        FontLoader.loadFontIfNeeded()
        let font = UIFont(name: GMDStruct.FontName, size: iconSize)
        
        assert(font != nil, GMDStruct.ErrorAnnounce)
        setTitleTextAttributes([NSAttributedStringKey.font: font!], for: UIControlState())
        title = icon.text
    }
    
    /**
    To set an icon, use i.e. `barName.setGMDIcon(GMDType.GMDPublic, iconSize: 35)`
    */
    var GMDIcon: GMDType? {
        set {
            
            FontLoader.loadFontIfNeeded()
            let font = UIFont(name: GMDStruct.FontName, size: 23)
            assert(font != nil,GMDStruct.ErrorAnnounce)
            setTitleTextAttributes([NSAttributedStringKey.font: font!], for: UIControlState())
            title = newValue?.text
        }
        
        get {
            if let title = title {
                
                if let index =  GMDIcons.index(of: title) {
                    return GMDType(rawValue: index)
                }
            }
            return nil
        }
    }
}

private struct GMDStruct {
    
    static let FileFontName = "GMDIcons"
    static let FontName = "MaterialIcons-Regular"
    static let ErrorAnnounce = "****** GOOGLE MATERIAL DESIGN ICONS SWIFT - Google Material Design icons font not found in the bundle or not associated with Info.plist when manual installation was performed. ******"
}


private class FontLoader {
    
    private static var __once: () = {
                let bundle = Bundle(for: FontLoader.self)
                var fontURL:URL!
                let identifier = bundle.bundleIdentifier
                
                if identifier?.hasPrefix("org.cocoapods") == true {
                    
                    fontURL = bundle.url(forResource: GMDStruct.FileFontName, withExtension: "ttf", subdirectory: "Google-Material-Design-Icons-Swift.bundle")!
                } else {
                    
                    fontURL = bundle.url(forResource: GMDStruct.FileFontName, withExtension: "ttf")!
                }
                let data = try! Data(contentsOf: fontURL)
                
                let provider = CGDataProvider(data: data as CFData)!
                let font = CGFont(provider)!
                
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(font, &error) {
                    
                    let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
                    let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
                    NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
                }
            }()
    
    struct Static {
        static var onceToken : Int = 0
    }
    
    static func loadFontIfNeeded() {
        if (UIFont.fontNames(forFamilyName: GMDStruct.FontName).count == 0) {
            
            _ = FontLoader.__once
        }
    }
}



/**
List of all icons in Google Material Design Font
*/
public enum GMDType: Int {
    
    static var count: Int {
        
        return GMDIcons.count
    }
    
    public var text: String? {
        
        return GMDIcons[rawValue]
    }
    
    case gmd3DRotation, gmdAccessibility, gmdAccountBalance, gmdAccountBalanceWallet, gmdAccountBox, gmdAccountCircle, gmdAddShoppingCart, gmdAlarm, gmdAlarmAdd, gmdAlarmOff, gmdAlarmOn, gmdAndroid, gmdAnnouncement, gmdAspectRatio, gmdAssessment, gmdAssignment, gmdAssignmentInd, gmdAssignmentLate, gmdAssignmentReturn, gmdAssignmentReturned, gmdAssignmentTurnedIn, gmdAutorenew, gmdBackup, gmdBook, gmdBookmark, gmdBookmarkBorder, gmdBugReport, gmdBuild, gmdCached, gmdCameraEnhance, gmdCardGiftcard, gmdCardMembership, gmdCardTravel, gmdChangeHistory, gmdCheckCircle, gmdChromeReaderMode, gmdClass, gmdCode, gmdCreditCard, gmdDashboard, gmdDelete, gmdDescription, gmdDns, gmdDone, gmdDoneAll, gmdEject, gmdEvent, gmdEventSeat, gmdExitToApp, gmdExplore, gmdExtension, gmdFace, gmdFavorite, gmdFavoriteBorder, gmdFeedback, gmdFindInPage, gmdFindReplace, gmdFlightLand, gmdFlightTakeoff, gmdFlipToBack, gmdFlipToFront, gmdGetApp, gmdGif, gmdGrade, gmdGroupWork, gmdHelp, gmdHelpOutline, gmdHighlightOff, gmdHistory, gmdHome, gmdHourglassEmpty, gmdHourglassFull, gmdHttp, gmdHttps, gmdInfo, gmdInfoOutline, gmdInput, gmdInvertColors, gmdLabel, gmdLabelOutline, gmdLanguage, gmdLaunch, gmdList, gmdLock, gmdLockOpen, gmdLockOutline, gmdLoyalty, gmdMarkunreadMailbox, gmdNoteAdd, gmdOfflinePin, gmdOpenInBrowser, gmdOpenInNew, gmdOpenWith, gmdPageview, gmdPayment, gmdPermCameraMic, gmdPermContactCalendar, gmdPermDataSetting, gmdPermDeviceInformation, gmdPermIdentity, gmdPermMedia, gmdPermPhoneMsg, gmdPermScanWifi, gmdPictureInPicture, gmdPlayForWork, gmdPolymer, gmdPowerSettingsNew, gmdPrint, gmdQueryBuilder, gmdQuestionAnswer, gmdReceipt, gmdRedeem, gmdReorder, gmdReportProblem, gmdRestore, gmdRoom, gmdSchedule, gmdSearch, gmdSettings, gmdSettingsApplications, gmdSettingsBackupRestore, gmdSettingsBluetooth, gmdSettingsBrightness, gmdSettingsCell, gmdSettingsEthernet, gmdSettingsInputAntenna, gmdSettingsInputComponent, gmdSettingsInputComposite, gmdSettingsInputHdmi, gmdSettingsInputSvideo, gmdSettingsOverscan, gmdSettingsPhone, gmdSettingsPower, gmdSettingsRemote, gmdSettingsVoice, gmdShop, gmdShopTwo, gmdShoppingBasket, gmdShoppingCart, gmdSpeakerNotes, gmdSpellcheck, gmdStarRate, gmdStars, gmdStore, gmdSubject, gmdSupervisorAccount, gmdSwapHoriz, gmdSwapVert, gmdSwapVerticalCircle, gmdSystemUpdateAlt, gmdTab, gmdTabUnselected, gmdTheaters, gmdThumbDown, gmdThumbUp, gmdThumbsUpDown, gmdToc, gmdToday, gmdToll, gmdTrackChanges, gmdTranslate, gmdTrendingDown, gmdTrendingFlat, gmdTrendingUp, gmdTurnedIn, gmdTurnedInNot, gmdVerifiedUser, gmdViewAgenda, gmdViewArray, gmdViewCarousel, gmdViewColumn, gmdViewDay, gmdViewHeadline, gmdViewList, gmdViewModule, gmdViewQuilt, gmdViewStream, gmdViewWeek, gmdVisibility, gmdVisibilityOff, gmdWork, gmdYoutubeSearchedFor, gmdZoomIn, gmdZoomOut, gmdAddAlert, gmdError, gmdErrorOutline, gmdWarning, gmdAirplay, gmdAlbum, gmdAvTimer, gmdClosedCaption, gmdEqualizer, gmdExplicit, gmdFastForward, gmdFastRewind, gmdForward10, gmdForward30, gmdForward5, gmdGames, gmdHd, gmdHearing, gmdHighQuality, gmdLibraryAdd, gmdLibraryBooks, gmdLibraryMusic, gmdLoop, gmdMic, gmdMicNone, gmdMicOff, gmdMovie, gmdNewReleases, gmdNotInterested, gmdPause, gmdPauseCircleFilled, gmdPauseCircleOutline, gmdPlayArrow, gmdPlayCircleFilled, gmdPlayCircleOutline, gmdPlaylistAdd, gmdQueue, gmdQueueMusic, gmdRadio, gmdRecentActors, gmdRepeat, gmdRepeatOne, gmdReplay, gmdReplay10, gmdReplay30, gmdReplay5, gmdShuffle, gmdSkipNext, gmdSkipPrevious, gmdSnooze, gmdSortByAlpha, gmdStop, gmdSubtitles, gmdSurroundSound, gmdVideoLibrary, gmdVideocam, gmdVideocamOff, gmdVolumeDown, gmdVolumeMute, gmdVolumeOff, gmdVolumeUp, gmdWeb, gmdBusiness, gmdCall, gmdCallEnd, gmdCallMade, gmdCallMerge, gmdCallMissed, gmdCallReceived, gmdCallSplit, gmdChat, gmdChatBubble, gmdChatBubbleOutline, gmdClearAll, gmdComment, gmdContactPhone, gmdContacts, gmdDialerSip, gmdDialpad, gmdEmail, gmdForum, gmdImportExport, gmdInvertColorsOff, gmdLiveHelp, gmdLocationOff, gmdLocationOn, gmdMessage, gmdNoSim, gmdPhone, gmdPhonelinkErase, gmdPhonelinkLock, gmdPhonelinkRing, gmdPhonelinkSetup, gmdPortableWifiOff, gmdPresentToAll, gmdRingVolume, gmdSpeakerPhone, gmdStayCurrentLandscape, gmdStayCurrentPortrait, gmdStayPrimaryLandscape, gmdStayPrimaryPortrait, gmdSwapCalls, gmdTextsms, gmdVoicemail, gmdVpnKey, gmdAdd, gmdAddBox, gmdAddCircle, gmdAddCircleOutline, gmdArchive, gmdBackspace, gmdBlock, gmdClear, gmdContentCopy, gmdContentCut, gmdContentPaste, gmdCreate, gmdDrafts, gmdFilterList, gmdFlag, gmdFontDownload, gmdForward, gmdGesture, gmdInbox, gmdLink, gmdMail, gmdMarkunread, gmdRedo, gmdRemove, gmdRemoveCircle, gmdRemoveCircleOutline, gmdReply, gmdReplyAll, gmdReport, gmdSave, gmdSelectAll, gmdSend, gmdSort, gmdTextFormat, gmdUndo, gmdAccessAlarm, gmdAccessAlarms, gmdAccessTime, gmdAddAlarm, gmdAirplanemodeActive, gmdAirplanemodeInactive, gmdBatteryAlert, gmdBatteryChargingFull, gmdBatteryFull, gmdBatteryStd, gmdBatteryUnknown, gmdBluetooth, gmdBluetoothConnected, gmdBluetoothDisabled, gmdBluetoothSearching, gmdBrightnessAuto, gmdBrightnessHigh, gmdBrightnessLow, gmdBrightnessMedium, gmdDataUsage, gmdDeveloperMode, gmdDevices, gmdDvr, gmdGpsFixed, gmdGpsNotFixed, gmdGpsOff, gmdGraphicEq, gmdLocationDisabled, gmdLocationSearching, gmdNetworkCell, gmdNetworkWifi, gmdNfc, gmdScreenLockLandscape, gmdScreenLockPortrait, gmdScreenLockRotation, gmdScreenRotation, gmdSdStorage, gmdSettingsSystemDaydream, gmdSignalCellular4Bar, gmdSignalCellularConnectedNoInternet4Bar, gmdSignalCellularNoSim, gmdSignalCellularNull, gmdSignalCellularOff, gmdSignalWifi4Bar, gmdSignalWifi4BarLock, gmdSignalWifiOff, gmdStorage, gmdUsb, gmdWallpaper, gmdWidgets, gmdWifiLock, gmdWifiTethering, gmdAttachFile, gmdAttachMoney, gmdBorderAll, gmdBorderBottom, gmdBorderClear, gmdBorderColor, gmdBorderHorizontal, gmdBorderInner, gmdBorderLeft, gmdBorderOuter, gmdBorderRight, gmdBorderStyle, gmdBorderTop, gmdBorderVertical, gmdFormatAlignCenter, gmdFormatAlignJustify, gmdFormatAlignLeft, gmdFormatAlignRight, gmdFormatBold, gmdFormatClear, gmdFormatColorFill, gmdFormatColorReset, gmdFormatColorText, gmdFormatIndentDecrease, gmdFormatIndentIncrease, gmdFormatItalic, gmdFormatLineSpacing, gmdFormatListBulleted, gmdFormatListNumbered, gmdFormatPaint, gmdFormatQuote, gmdFormatSize, gmdFormatStrikethrough, gmdFormatTextdirectionLToR, gmdFormatTextdirectionRToL, gmdFormatUnderlined, gmdFunctions, gmdInsertChart, gmdInsertComment, gmdInsertDriveFile, gmdInsertEmoticon, gmdInsertInvitation, gmdInsertLink, gmdInsertPhoto, gmdMergeType, gmdModeComment, gmdModeEdit, gmdMoneyOff, gmdPublish, gmdSpaceBar, gmdStrikethroughS, gmdVerticalAlignBottom, gmdVerticalAlignCenter, gmdVerticalAlignTop, gmdWrapText, gmdAttachment, gmdCloud, gmdCloudCircle, gmdCloudDone, gmdCloudDownload, gmdCloudOff, gmdCloudQueue, gmdCloudUpload, gmdFileDownload, gmdFileUpload, gmdFolder, gmdFolderOpen, gmdFolderShared, gmdCast, gmdCastConnected, gmdComputer, gmdDesktopMac, gmdDesktopWindows, gmdDeveloperBoard, gmdDeviceHub, gmdDock, gmdGamepad, gmdHeadset, gmdHeadsetMic, gmdKeyboard, gmdKeyboardArrowDown, gmdKeyboardArrowLeft, gmdKeyboardArrowRight, gmdKeyboardArrowUp, gmdKeyboardBackspace, gmdKeyboardCapslock, gmdKeyboardHide, gmdKeyboardReturn, gmdKeyboardTab, gmdKeyboardVoice, gmdLaptop, gmdLaptopChromebook, gmdLaptopMac, gmdLaptopWindows, gmdMemory, gmdMouse, gmdPhoneAndroid, gmdPhoneIphone, gmdPhonelink, gmdPhonelinkOff, gmdPowerInput, gmdRouter, gmdScanner, gmdSecurity, gmdSimCard, gmdSmartphone, gmdSpeaker, gmdSpeakerGroup, gmdTablet, gmdTabletAndroid, gmdTabletMac, gmdToys, gmdTv, gmdWatch, gmdAddToPhotos, gmdAdjust, gmdAssistant, gmdAssistantPhoto, gmdAudiotrack, gmdBlurCircular, gmdBlurLinear, gmdBlurOff, gmdBlurOn, gmdBrightness1, gmdBrightness2, gmdBrightness3, gmdBrightness4, gmdBrightness5, gmdBrightness6, gmdBrightness7, gmdBrokenImage, gmdBrush, gmdCamera, gmdCameraAlt, gmdCameraFront, gmdCameraRear, gmdCameraRoll, gmdCenterFocusStrong, gmdCenterFocusWeak, gmdCollections, gmdCollectionsBookmark, gmdColorLens, gmdColorize, gmdCompare, gmdControlPoint, gmdControlPointDuplicate, gmdCrop, gmdCrop169, gmdCrop32, gmdCrop54, gmdCrop75, gmdCropDin, gmdCropFree, gmdCropLandscape, gmdCropOriginal, gmdCropPortrait, gmdCropSquare, gmdDehaze, gmdDetails, gmdEdit, gmdExposure, gmdExposureNeg1, gmdExposureNeg2, gmdExposurePlus1, gmdExposurePlus2, gmdExposureZero, gmdFilter, gmdFilter1, gmdFilter2, gmdFilter3, gmdFilter4, gmdFilter5, gmdFilter6, gmdFilter7, gmdFilter8, gmdFilter9, gmdFilter9Plus, gmdFilterBAndW, gmdFilterCenterFocus, gmdFilterDrama, gmdFilterFrames, gmdFilterHdr, gmdFilterNone, gmdFilterTiltShift, gmdFilterVintage, gmdFlare, gmdFlashAuto, gmdFlashOff, gmdFlashOn, gmdFlip, gmdGradient, gmdGrain, gmdGridOff, gmdGridOn, gmdHdrOff, gmdHdrOn, gmdHdrStrong, gmdHdrWeak, gmdHealing, gmdImage, gmdImageAspectRatio, gmdIso, gmdLandscape, gmdLeakAdd, gmdLeakRemove, gmdLens, gmdLooks, gmdLooks3, gmdLooks4, gmdLooks5, gmdLooks6, gmdLooksOne, gmdLooksTwo, gmdLoupe, gmdMonochromePhotos, gmdMovieCreation, gmdMusicNote, gmdNature, gmdNaturePeople, gmdNavigateBefore, gmdNavigateNext, gmdPalette, gmdPanorama, gmdPanoramaFishEye, gmdPanoramaHorizontal, gmdPanoramaVertical, gmdPanoramaWideAngle, gmdPhoto, gmdPhotoAlbum, gmdPhotoCamera, gmdPhotoLibrary, gmdPhotoSizeSelectActual, gmdPhotoSizeSelectLarge, gmdPhotoSizeSelectSmall, gmdPictureAsPdf, gmdPortrait, gmdRemoveRedEye, gmdRotate90DegreesCcw, gmdRotateLeft, gmdRotateRight, gmdSlideshow, gmdStraighten, gmdStyle, gmdSwitchCamera, gmdSwitchVideo, gmdTagFaces, gmdTexture, gmdTimelapse, gmdTimer, gmdTimer10, gmdTimer3, gmdTimerOff, gmdTonality, gmdTransform, gmdTune, gmdViewComfy, gmdViewCompact, gmdVignette, gmdWbAuto, gmdWbCloudy, gmdWbIncandescent, gmdWbIridescent, gmdWbSunny, gmdBeenhere, gmdDirections, gmdDirectionsBike, gmdDirectionsBoat, gmdDirectionsBus, gmdDirectionsCar, gmdDirectionsRailway, gmdDirectionsRun, gmdDirectionsSubway, gmdDirectionsTransit, gmdDirectionsWalk, gmdFlight, gmdHotel, gmdLayers, gmdLayersClear, gmdLocalActivity, gmdLocalAirport, gmdLocalAtm, gmdLocalBar, gmdLocalCafe, gmdLocalCarWash, gmdLocalConvenienceStore, gmdLocalDining, gmdLocalDrink, gmdLocalFlorist, gmdLocalGasStation, gmdLocalGroceryStore, gmdLocalHospital, gmdLocalHotel, gmdLocalLaundryService, gmdLocalLibrary, gmdLocalMall, gmdLocalMovies, gmdLocalOffer, gmdLocalParking, gmdLocalPharmacy, gmdLocalPhone, gmdLocalPizza, gmdLocalPlay, gmdLocalPostOffice, gmdLocalPrintshop, gmdLocalSee, gmdLocalShipping, gmdLocalTaxi, gmdMap, gmdMyLocation, gmdNavigation, gmdPersonPin, gmdPinDrop, gmdPlace, gmdRateReview, gmdRestaurantMenu, gmdSatellite, gmdStoreMallDirectory, gmdTerrain, gmdTraffic, gmdApps, gmdArrowBack, gmdArrowDropDown, gmdArrowDropDownCircle, gmdArrowDropUp, gmdArrowForward, gmdCancel, gmdCheck, gmdChevronLeft, gmdChevronRight, gmdClose, gmdExpandLess, gmdExpandMore, gmdFullscreen, gmdFullscreenExit, gmdMenu, gmdMoreHoriz, gmdMoreVert, gmdRefresh, gmdAdb, gmdAirlineSeatFlat, gmdAirlineSeatFlatAngled, gmdAirlineSeatIndividualSuite, gmdAirlineSeatLegroomExtra, gmdAirlineSeatLegroomNormal, gmdAirlineSeatLegroomReduced, gmdAirlineSeatReclineExtra, gmdAirlineSeatReclineNormal, gmdBluetoothAudio, gmdConfirmationNumber, gmdDiscFull, gmdDoNotDisturb, gmdDoNotDisturbAlt, gmdDriveEta, gmdEventAvailable, gmdEventBusy, gmdEventNote, gmdFolderSpecial, gmdLiveTv, gmdMms, gmdMore, gmdNetworkLocked, gmdOndemandVideo, gmdPersonalVideo, gmdPhoneBluetoothSpeaker, gmdPhoneForwarded, gmdPhoneInTalk, gmdPhoneLocked, gmdPhoneMissed, gmdPhonePaused, gmdPower, gmdSdCard, gmdSimCardAlert, gmdSms, gmdSmsFailed, gmdSync, gmdSyncDisabled, gmdSyncProblem, gmdSystemUpdate, gmdTapAndPlay, gmdTimeToLeave, gmdVibration, gmdVoiceChat, gmdVpnLock, gmdWc, gmdWifi, gmdCake, gmdDomain, gmdGroup, gmdGroupAdd, gmdLocationCity, gmdMood, gmdMoodBad, gmdNotifications, gmdNotificationsActive, gmdNotificationsNone, gmdNotificationsOff, gmdNotificationsPaused, gmdPages, gmdPartyMode, gmdPeople, gmdPeopleOutline, gmdPerson, gmdPersonAdd, gmdPersonOutline, gmdPlusOne, gmdPoll, gmdPublic, gmdSchool, gmdShare, gmdWhatshot, gmdCheckBox, gmdCheckBoxOutlineBlank, gmdIndeterminateCheckBox, gmdRadioButtonChecked, gmdRadioButtonUnchecked, gmdStar, gmdStarBorder, gmdStarHalf
    
}

private let GMDIcons = ["\u{e84d}", "\u{e84e}", "\u{e84f}", "\u{e850}", "\u{e851}", "\u{e853}", "\u{e854}", "\u{e855}", "\u{e856}", "\u{e857}", "\u{e858}", "\u{e859}", "\u{e85a}", "\u{e85b}", "\u{e85c}", "\u{e85d}", "\u{e85e}", "\u{e85f}", "\u{e860}", "\u{e861}", "\u{e862}", "\u{e863}", "\u{e864}", "\u{e865}", "\u{e866}", "\u{e867}", "\u{e868}", "\u{e869}", "\u{e86a}", "\u{e8fc}", "\u{e8f6}", "\u{e8f7}", "\u{e8f8}", "\u{e86b}", "\u{e86c}", "\u{e86d}", "\u{e86e}", "\u{e86f}", "\u{e870}", "\u{e871}", "\u{e872}", "\u{e873}", "\u{e875}", "\u{e876}", "\u{e877}", "\u{e8fb}", "\u{e878}", "\u{e903}", "\u{e879}", "\u{e87a}", "\u{e87b}", "\u{e87c}", "\u{e87d}", "\u{e87e}", "\u{e87f}", "\u{e880}", "\u{e881}", "\u{e904}", "\u{e905}", "\u{e882}", "\u{e883}", "\u{e884}", "\u{e908}", "\u{e885}", "\u{e886}", "\u{e887}", "\u{e8fd}", "\u{e888}", "\u{e889}", "\u{e88a}", "\u{e88b}", "\u{e88c}", "\u{e902}", "\u{e88d}", "\u{e88e}", "\u{e88f}", "\u{e890}", "\u{e891}", "\u{e892}", "\u{e893}", "\u{e894}", "\u{e895}", "\u{e896}", "\u{e897}", "\u{e898}", "\u{e899}", "\u{e89a}", "\u{e89b}", "\u{e89c}", "\u{e90a}", "\u{e89d}", "\u{e89e}", "\u{e89f}", "\u{e8a0}", "\u{e8a1}", "\u{e8a2}", "\u{e8a3}", "\u{e8a4}", "\u{e8a5}", "\u{e8a6}", "\u{e8a7}", "\u{e8a8}", "\u{e8a9}", "\u{e8aa}", "\u{e906}", "\u{e8ab}", "\u{e8ac}", "\u{e8ad}", "\u{e8ae}", "\u{e8af}", "\u{e8b0}", "\u{e8b1}", "\u{e8fe}", "\u{e8b2}", "\u{e8b3}", "\u{e8b4}", "\u{e8b5}", "\u{e8b6}", "\u{e8b8}", "\u{e8b9}", "\u{e8ba}", "\u{e8bb}", "\u{e8bd}", "\u{e8bc}", "\u{e8be}", "\u{e8bf}", "\u{e8c0}", "\u{e8c1}", "\u{e8c2}", "\u{e8c3}", "\u{e8c4}", "\u{e8c5}", "\u{e8c6}", "\u{e8c7}", "\u{e8c8}", "\u{e8c9}", "\u{e8ca}", "\u{e8cb}", "\u{e8cc}", "\u{e8cd}", "\u{e8ce}", "\u{e8cf}", "\u{e8d0}", "\u{e8d1}", "\u{e8d2}", "\u{e8d3}", "\u{e8d4}", "\u{e8d5}", "\u{e8d6}", "\u{e8d7}", "\u{e8d8}", "\u{e8d9}", "\u{e8da}", "\u{e8db}", "\u{e8dc}", "\u{e8dd}", "\u{e8de}", "\u{e8df}", "\u{e8e0}", "\u{e8e1}", "\u{e8e2}", "\u{e8e3}", "\u{e8e4}", "\u{e8e5}", "\u{e8e6}", "\u{e8e7}", "\u{e8e8}", "\u{e8e9}", "\u{e8ea}", "\u{e8eb}", "\u{e8ec}", "\u{e8ed}", "\u{e8ee}", "\u{e8ef}", "\u{e8f0}", "\u{e8f1}", "\u{e8f2}", "\u{e8f3}", "\u{e8f4}", "\u{e8f5}", "\u{e8f9}", "\u{e8fa}", "\u{e8ff}", "\u{e900}", "\u{e003}", "\u{e000}", "\u{e001}", "\u{e002}", "\u{e055}", "\u{e019}", "\u{e01b}", "\u{e01c}", "\u{e01d}", "\u{e01e}", "\u{e01f}", "\u{e020}", "\u{e056}", "\u{e057}", "\u{e058}", "\u{e021}", "\u{e052}", "\u{e023}", "\u{e024}", "\u{e02e}", "\u{e02f}", "\u{e030}", "\u{e028}", "\u{e029}", "\u{e02a}", "\u{e02b}", "\u{e02c}", "\u{e031}", "\u{e033}", "\u{e034}", "\u{e035}", "\u{e036}", "\u{e037}", "\u{e038}", "\u{e039}", "\u{e03b}", "\u{e03c}", "\u{e03d}", "\u{e03e}", "\u{e03f}", "\u{e040}", "\u{e041}", "\u{e042}", "\u{e059}", "\u{e05a}", "\u{e05b}", "\u{e043}", "\u{e044}", "\u{e045}", "\u{e046}", "\u{e053}", "\u{e047}", "\u{e048}", "\u{e049}", "\u{e04a}", "\u{e04b}", "\u{e04c}", "\u{e04d}", "\u{e04e}", "\u{e04f}", "\u{e050}", "\u{e051}", "\u{e0af}", "\u{e0b0}", "\u{e0b1}", "\u{e0b2}", "\u{e0b3}", "\u{e0b4}", "\u{e0b5}", "\u{e0b6}", "\u{e0b7}", "\u{e0ca}", "\u{e0cb}", "\u{e0b8}", "\u{e0b9}", "\u{e0cf}", "\u{e0ba}", "\u{e0bb}", "\u{e0bc}", "\u{e0be}", "\u{e0bf}", "\u{e0c3}", "\u{e0c4}", "\u{e0c6}", "\u{e0c7}", "\u{e0c8}", "\u{e0c9}", "\u{e0cc}", "\u{e0cd}", "\u{e0db}", "\u{e0dc}", "\u{e0dd}", "\u{e0de}", "\u{e0ce}", "\u{e0df}", "\u{e0d1}", "\u{e0d2}", "\u{e0d3}", "\u{e0d4}", "\u{e0d5}", "\u{e0d6}", "\u{e0d7}", "\u{e0d8}", "\u{e0d9}", "\u{e0da}", "\u{e145}", "\u{e146}", "\u{e147}", "\u{e148}", "\u{e149}", "\u{e14a}", "\u{e14b}", "\u{e14c}", "\u{e14d}", "\u{e14e}", "\u{e14f}", "\u{e150}", "\u{e151}", "\u{e152}", "\u{e153}", "\u{e167}", "\u{e154}", "\u{e155}", "\u{e156}", "\u{e157}", "\u{e158}", "\u{e159}", "\u{e15a}", "\u{e15b}", "\u{e15c}", "\u{e15d}", "\u{e15e}", "\u{e15f}", "\u{e160}", "\u{e161}", "\u{e162}", "\u{e163}", "\u{e164}", "\u{e165}", "\u{e166}", "\u{e190}", "\u{e191}", "\u{e192}", "\u{e193}", "\u{e195}", "\u{e194}", "\u{e19c}", "\u{e1a3}", "\u{e1a4}", "\u{e1a5}", "\u{e1a6}", "\u{e1a7}", "\u{e1a8}", "\u{e1a9}", "\u{e1aa}", "\u{e1ab}", "\u{e1ac}", "\u{e1ad}", "\u{e1ae}", "\u{e1af}", "\u{e1b0}", "\u{e1b1}", "\u{e1b2}", "\u{e1b3}", "\u{e1b4}", "\u{e1b5}", "\u{e1b8}", "\u{e1b6}", "\u{e1b7}", "\u{e1b9}", "\u{e1ba}", "\u{e1bb}", "\u{e1be}", "\u{e1bf}", "\u{e1c0}", "\u{e1c1}", "\u{e1c2}", "\u{e1c3}", "\u{e1c8}", "\u{e1cd}", "\u{e1ce}", "\u{e1cf}", "\u{e1d0}", "\u{e1d8}", "\u{e1d9}", "\u{e1da}", "\u{e1db}", "\u{e1e0}", "\u{e1bc}", "\u{e1bd}", "\u{e1e1}", "\u{e1e2}", "\u{e226}", "\u{e227}", "\u{e228}", "\u{e229}", "\u{e22a}", "\u{e22b}", "\u{e22c}", "\u{e22d}", "\u{e22e}", "\u{e22f}", "\u{e230}", "\u{e231}", "\u{e232}", "\u{e233}", "\u{e234}", "\u{e235}", "\u{e236}", "\u{e237}", "\u{e238}", "\u{e239}", "\u{e23a}", "\u{e23b}", "\u{e23c}", "\u{e23d}", "\u{e23e}", "\u{e23f}", "\u{e240}", "\u{e241}", "\u{e242}", "\u{e243}", "\u{e244}", "\u{e245}", "\u{e246}", "\u{e247}", "\u{e248}", "\u{e249}", "\u{e24a}", "\u{e24b}", "\u{e24c}", "\u{e24d}", "\u{e24e}", "\u{e24f}", "\u{e250}", "\u{e251}", "\u{e252}", "\u{e253}", "\u{e254}", "\u{e25c}", "\u{e255}", "\u{e256}", "\u{e257}", "\u{e258}", "\u{e259}", "\u{e25a}", "\u{e25b}", "\u{e2bc}", "\u{e2bd}", "\u{e2be}", "\u{e2bf}", "\u{e2c0}", "\u{e2c1}", "\u{e2c2}", "\u{e2c3}", "\u{e2c4}", "\u{e2c6}", "\u{e2c7}", "\u{e2c8}", "\u{e2c9}", "\u{e307}", "\u{e308}", "\u{e30a}", "\u{e30b}", "\u{e30c}", "\u{e30d}", "\u{e335}", "\u{e30e}", "\u{e30f}", "\u{e310}", "\u{e311}", "\u{e312}", "\u{e313}", "\u{e314}", "\u{e315}", "\u{e316}", "\u{e317}", "\u{e318}", "\u{e31a}", "\u{e31b}", "\u{e31c}", "\u{e31d}", "\u{e31e}", "\u{e31f}", "\u{e320}", "\u{e321}", "\u{e322}", "\u{e323}", "\u{e324}", "\u{e325}", "\u{e326}", "\u{e327}", "\u{e336}", "\u{e328}", "\u{e329}", "\u{e32a}", "\u{e32b}", "\u{e32c}", "\u{e32d}", "\u{e32e}", "\u{e32f}", "\u{e330}", "\u{e331}", "\u{e332}", "\u{e333}", "\u{e334}", "\u{e39d}", "\u{e39e}", "\u{e39f}", "\u{e3a0}", "\u{e3a1}", "\u{e3a2}", "\u{e3a3}", "\u{e3a4}", "\u{e3a5}", "\u{e3a6}", "\u{e3a7}", "\u{e3a8}", "\u{e3a9}", "\u{e3aa}", "\u{e3ab}", "\u{e3ac}", "\u{e3ad}", "\u{e3ae}", "\u{e3af}", "\u{e3b0}", "\u{e3b1}", "\u{e3b2}", "\u{e3b3}", "\u{e3b4}", "\u{e3b5}", "\u{e3b6}", "\u{e431}", "\u{e3b7}", "\u{e3b8}", "\u{e3b9}", "\u{e3ba}", "\u{e3bb}", "\u{e3be}", "\u{e3bc}", "\u{e3bd}", "\u{e3bf}", "\u{e3c0}", "\u{e3c1}", "\u{e3c2}", "\u{e3c3}", "\u{e3c4}", "\u{e3c5}", "\u{e3c6}", "\u{e3c7}", "\u{e3c8}", "\u{e3c9}", "\u{e3ca}", "\u{e3cb}", "\u{e3cc}", "\u{e3cd}", "\u{e3ce}", "\u{e3cf}", "\u{e3d3}", "\u{e3d0}", "\u{e3d1}", "\u{e3d2}", "\u{e3d4}", "\u{e3d5}", "\u{e3d6}", "\u{e3d7}", "\u{e3d8}", "\u{e3d9}", "\u{e3da}", "\u{e3db}", "\u{e3dc}", "\u{e3dd}", "\u{e3de}", "\u{e3df}", "\u{e3e0}", "\u{e3e2}", "\u{e3e3}", "\u{e3e4}", "\u{e3e5}", "\u{e3e6}", "\u{e3e7}", "\u{e3e8}", "\u{e3e9}", "\u{e3ea}", "\u{e3eb}", "\u{e3ec}", "\u{e3ed}", "\u{e3ee}", "\u{e3f1}", "\u{e3f2}", "\u{e3f3}", "\u{e3f4}", "\u{e3f5}", "\u{e3f6}", "\u{e3f7}", "\u{e3f8}", "\u{e3f9}", "\u{e3fa}", "\u{e3fc}", "\u{e3fb}", "\u{e3fd}", "\u{e3fe}", "\u{e3ff}", "\u{e400}", "\u{e401}", "\u{e402}", "\u{e403}", "\u{e404}", "\u{e405}", "\u{e406}", "\u{e407}", "\u{e408}", "\u{e409}", "\u{e40a}", "\u{e40b}", "\u{e40c}", "\u{e40d}", "\u{e40e}", "\u{e40f}", "\u{e410}", "\u{e411}", "\u{e412}", "\u{e413}", "\u{e432}", "\u{e433}", "\u{e434}", "\u{e415}", "\u{e416}", "\u{e417}", "\u{e418}", "\u{e419}", "\u{e41a}", "\u{e41b}", "\u{e41c}", "\u{e41d}", "\u{e41e}", "\u{e41f}", "\u{e420}", "\u{e421}", "\u{e422}", "\u{e425}", "\u{e423}", "\u{e424}", "\u{e426}", "\u{e427}", "\u{e428}", "\u{e429}", "\u{e42a}", "\u{e42b}", "\u{e435}", "\u{e42c}", "\u{e42d}", "\u{e42e}", "\u{e436}", "\u{e430}", "\u{e52d}", "\u{e52e}", "\u{e52f}", "\u{e532}", "\u{e530}", "\u{e531}", "\u{e534}", "\u{e566}", "\u{e533}", "\u{e535}", "\u{e536}", "\u{e539}", "\u{e53a}", "\u{e53b}", "\u{e53c}", "\u{e53f}", "\u{e53d}", "\u{e53e}", "\u{e540}", "\u{e541}", "\u{e542}", "\u{e543}", "\u{e556}", "\u{e544}", "\u{e545}", "\u{e546}", "\u{e547}", "\u{e548}", "\u{e549}", "\u{e54a}", "\u{e54b}", "\u{e54c}", "\u{e54d}", "\u{e54e}", "\u{e54f}", "\u{e550}", "\u{e551}", "\u{e552}", "\u{e553}", "\u{e554}", "\u{e555}", "\u{e557}", "\u{e558}", "\u{e559}", "\u{e55b}", "\u{e55c}", "\u{e55d}", "\u{e55a}", "\u{e55e}", "\u{e55f}", "\u{e560}", "\u{e561}", "\u{e562}", "\u{e563}", "\u{e564}", "\u{e565}", "\u{e5c3}", "\u{e5c4}", "\u{e5c5}", "\u{e5c6}", "\u{e5c7}", "\u{e5c8}", "\u{e5c9}", "\u{e5ca}", "\u{e5cb}", "\u{e5cc}", "\u{e5cd}", "\u{e5ce}", "\u{e5cf}", "\u{e5d0}", "\u{e5d1}", "\u{e5d2}", "\u{e5d3}", "\u{e5d4}", "\u{e5d5}", "\u{e60e}", "\u{e630}", "\u{e631}", "\u{e632}", "\u{e633}", "\u{e634}", "\u{e635}", "\u{e636}", "\u{e637}", "\u{e60f}", "\u{e638}", "\u{e610}", "\u{e612}", "\u{e611}", "\u{e613}", "\u{e614}", "\u{e615}", "\u{e616}", "\u{e617}", "\u{e639}", "\u{e618}", "\u{e619}", "\u{e61a}", "\u{e63a}", "\u{e63b}", "\u{e61b}", "\u{e61c}", "\u{e61d}", "\u{e61e}", "\u{e61f}", "\u{e620}", "\u{e63c}", "\u{e623}", "\u{e624}", "\u{e625}", "\u{e626}", "\u{e627}", "\u{e628}", "\u{e629}", "\u{e62a}", "\u{e62b}", "\u{e62c}", "\u{e62d}", "\u{e62e}", "\u{e62f}", "\u{e63d}", "\u{e63e}", "\u{e7e9}", "\u{e7ee}", "\u{e7ef}", "\u{e7f0}", "\u{e7f1}", "\u{e7f2}", "\u{e7f3}", "\u{e7f4}", "\u{e7f7}", "\u{e7f5}", "\u{e7f6}", "\u{e7f8}", "\u{e7f9}", "\u{e7fa}", "\u{e7fb}", "\u{e7fc}", "\u{e7fd}", "\u{e7fe}", "\u{e7ff}", "\u{e800}", "\u{e801}", "\u{e80b}", "\u{e80c}", "\u{e80d}", "\u{e80e}", "\u{e834}", "\u{e835}", "\u{e909}", "\u{e837}", "\u{e836}", "\u{e838}", "\u{e83a}", "\u{e839}"]
