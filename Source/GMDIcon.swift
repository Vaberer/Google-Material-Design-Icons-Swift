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
  
                if text?.utf16.count == 1 {
                    return GMDType(rawValue: Int(text!.utf16.first!))
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

                if title?.utf16.count == 1 {
                    return GMDType(rawValue: Int(title!.utf16.first!))
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
public enum GMDType: Int, CaseIterable {
    
    //See UpdatingNotes.txt for info on how to add missing glyphs

    
    case gmd3dRotation = 0xE84D
    case gmdAccessibility = 0xE84E
    case gmdAccessibilityNew = 0xE92C
    case gmdAccessible = 0xE914
    case gmdAccessibleForward = 0xE934
    case gmdAccountBalance = 0xE84F
    case gmdAccountBalanceWallet = 0xE850
    case gmdAccountBox = 0xE851
    case gmdAccountCircle = 0xE853
    case gmdAddShoppingCart = 0xE854
    case gmdAlarm = 0xE855
    case gmdAlarmAdd = 0xE856
    case gmdAlarmOff = 0xE857
    case gmdAlarmOn = 0xE858
    case gmdAllInbox = 0xE97F
    case gmdAllOut = 0xE90B
    case gmdAndroid = 0xE859
    case gmdAnnouncement = 0xE85A
    case gmdArrowRightAlt = 0xE8E4
    case gmdAspectRatio = 0xE85B
    case gmdAssessment = 0xE85C
    case gmdAssignment = 0xE85D
    case gmdAssignmentInd = 0xE85E
    case gmdAssignmentLate = 0xE85F
    case gmdAssignmentReturn = 0xE860
    case gmdAssignmentReturned = 0xE861
    case gmdAssignmentTurnedIn = 0xE862
    case gmdAutorenew = 0xE863
    case gmdBackup = 0xE864
    case gmdBook = 0xE865
    case gmdBookmark = 0xE866
    case gmdBookmarkBorder = 0xE867
    case gmdBookmarks = 0xE98B
    case gmdBugReport = 0xE868
    case gmdBuild = 0xE869
    case gmdCached = 0xE86A
    case gmdCalendarToday = 0xE935
    case gmdCalendarViewDay = 0xE936
    case gmdCameraEnhance = 0xE8FC
    case gmdCardGiftcard = 0xE8F6
    case gmdCardMembership = 0xE8F7
    case gmdCardTravel = 0xE8F8
    case gmdChangeHistory = 0xE86B
    case gmdCheckCircle = 0xE86C
    case gmdCheckCircleOutline = 0xE92D
    case gmdChromeReaderMode = 0xE86D
    case gmdClass = 0xE86E
    case gmdCode = 0xE86F
    case gmdCommute = 0xE940
    case gmdCompareArrows = 0xE915
    case gmdContactSupport = 0xE94C
    case gmdCopyright = 0xE90C
    case gmdCreditCard = 0xE870
    case gmdDashboard = 0xE871
    case gmdDateRange = 0xE916
    case gmdDelete = 0xE872
    case gmdDeleteForever = 0xE92B
    case gmdDeleteOutline = 0xE92E
    case gmdDescription = 0xE873
    case gmdDns = 0xE875
    case gmdDone = 0xE876
    case gmdDoneAll = 0xE877
    case gmdDoneOutline = 0xE92F
    case gmdDonutLarge = 0xE917
    case gmdDonutSmall = 0xE918
    case gmdDragIndicator = 0xE945
    case gmdEject = 0xE8FB
    case gmdEuroSymbol = 0xE926
    case gmdEvent = 0xE878
    case gmdEventSeat = 0xE903
    case gmdExitToApp = 0xE879
    case gmdExplore = 0xE87A
    case gmdExploreOff = 0xE9A8
    case gmdExtension = 0xE87B
    case gmdFace = 0xE87C
    case gmdFavorite = 0xE87D
    case gmdFavoriteBorder = 0xE87E
    case gmdFeedback = 0xE87F
    case gmdFindInPage = 0xE880
    case gmdFindReplace = 0xE881
    case gmdFingerprint = 0xE90D
    case gmdFlightLand = 0xE904
    case gmdFlightTakeoff = 0xE905
    case gmdFlipToBack = 0xE882
    case gmdFlipToFront = 0xE883
    case gmdGTranslate = 0xE927
    case gmdGavel = 0xE90E
    case gmdGetApp = 0xE884
    case gmdGif = 0xE908
    case gmdGrade = 0xE885
    case gmdGroupWork = 0xE886
    case gmdHelp = 0xE887
    case gmdHelpOutline = 0xE8FD
    case gmdHighlightOff = 0xE888
    case gmdHistory = 0xE889
    case gmdHome = 0xE88A
    case gmdHorizontalSplit = 0xE947
    case gmdHourglassEmpty = 0xE88B
    case gmdHourglassFull = 0xE88C
    case gmdHttp = 0xE902
    case gmdHttps = 0xE88D
    case gmdImportantDevices = 0xE912
    case gmdInfo = 0xE88E
    case gmdInput = 0xE890
    case gmdInvertColors = 0xE891
    case gmdLabel = 0xE892
    case gmdLabelImportant = 0xE937
    case gmdLabelOff = 0xE9B6
    case gmdLanguage = 0xE894
    case gmdLaunch = 0xE895
    case gmdLineStyle = 0xE919
    case gmdLineWeight = 0xE91A
    case gmdList = 0xE896
    case gmdLock = 0xE897
    case gmdLockOpen = 0xE898
    case gmdLoyalty = 0xE89A
    case gmdMarkunreadMailbox = 0xE89B
    case gmdMaximize = 0xE930
    case gmdMinimize = 0xE931
    case gmdMotorcycle = 0xE91B
    case gmdNoteAdd = 0xE89C
    case gmdOfflineBolt = 0xE932
    case gmdOfflinePin = 0xE90A
    case gmdOpacity = 0xE91C
    case gmdOpenInBrowser = 0xE89D
    case gmdOpenInNew = 0xE89E
    case gmdOpenWith = 0xE89F
    case gmdPageview = 0xE8A0
    case gmdPanTool = 0xE925
    case gmdPayment = 0xE8A1
    case gmdPermCameraMic = 0xE8A2
    case gmdPermContactCalendar = 0xE8A3
    case gmdPermDataSetting = 0xE8A4
    case gmdPermDeviceInformation = 0xE8A5
    case gmdPermIdentity = 0xE8A6
    case gmdPermMedia = 0xE8A7
    case gmdPermPhoneMsg = 0xE8A8
    case gmdPermScanWifi = 0xE8A9
    case gmdPets = 0xE91D
    case gmdPictureInPicture = 0xE8AA
    case gmdPictureInPictureAlt = 0xE911
    case gmdPlayForWork = 0xE906
    case gmdPolymer = 0xE8AB
    case gmdPowerSettingsNew = 0xE8AC
    case gmdPregnantWoman = 0xE91E
    case gmdPrint = 0xE8AD
    case gmdQueryBuilder = 0xE8AE
    case gmdQuestionAnswer = 0xE8AF
    case gmdReceipt = 0xE8B0
    case gmdRecordVoiceOver = 0xE91F
    case gmdRedeem = 0xE8B1
    case gmdRemoveShoppingCart = 0xE928
    case gmdReorder = 0xE8FE
    case gmdReportProblem = 0xE8B2
    case gmdRestore = 0xE8B3
    case gmdRestoreFromTrash = 0xE938
    case gmdRestorePage = 0xE929
    case gmdRoom = 0xE8B4
    case gmdRoundedCorner = 0xE920
    case gmdRowing = 0xE921
    case gmdSchedule = 0xE8B5
    case gmdSearch = 0xE8B6
    case gmdSettings = 0xE8B8
    case gmdSettingsApplications = 0xE8B9
    case gmdSettingsBackupRestore = 0xE8BA
    case gmdSettingsBluetooth = 0xE8BB
    case gmdSettingsBrightness = 0xE8BD
    case gmdSettingsCell = 0xE8BC
    case gmdSettingsEthernet = 0xE8BE
    case gmdSettingsInputAntenna = 0xE8BF
    case gmdSettingsInputComponent = 0xE8C0
    case gmdSettingsInputComposite = 0xE8C1
    case gmdSettingsInputHdmi = 0xE8C2
    case gmdSettingsInputSvideo = 0xE8C3
    case gmdSettingsOverscan = 0xE8C4
    case gmdSettingsPhone = 0xE8C5
    case gmdSettingsPower = 0xE8C6
    case gmdSettingsRemote = 0xE8C7
    case gmdSettingsVoice = 0xE8C8
    case gmdShop = 0xE8C9
    case gmdShopTwo = 0xE8CA
    case gmdShoppingBasket = 0xE8CB
    case gmdShoppingCart = 0xE8CC
    case gmdSpeakerNotes = 0xE8CD
    case gmdSpeakerNotesOff = 0xE92A
    case gmdSpellcheck = 0xE8CE
    case gmdStarRate = 0xE8CF
    case gmdStars = 0xE8D0
    case gmdStore = 0xE8D1
    case gmdSubject = 0xE8D2
    case gmdSupervisedUserCircle = 0xE939
    case gmdSupervisorAccount = 0xE8D3
    case gmdSwapHoriz = 0xE8D4
    case gmdSwapHorizontalCircle = 0xE933
    case gmdSwapVert = 0xE8D5
    case gmdSwapVerticalCircle = 0xE8D6
    case gmdTab = 0xE8D8
    case gmdTabUnselected = 0xE8D9
    case gmdTextRotateUp = 0xE93A
    case gmdTextRotateVertical = 0xE93B
    case gmdTextRotationDown = 0xE93E
    case gmdTextRotationNone = 0xE93F
    case gmdTheaters = 0xE8DA
    case gmdThumbDown = 0xE8DB
    case gmdThumbUp = 0xE8DC
    case gmdThumbsUpDown = 0xE8DD
    case gmdTimeline = 0xE922
    case gmdToc = 0xE8DE
    case gmdToday = 0xE8DF
    case gmdToll = 0xE8E0
    case gmdTouchApp = 0xE913
    case gmdTrackChanges = 0xE8E1
    case gmdTranslate = 0xE8E2
    case gmdTrendingDown = 0xE8E3
    case gmdTrendingFlat = 0xE941
    case gmdTrendingUp = 0xE8E5
    case gmdTurnedIn = 0xE8E6
    case gmdTurnedInNot = 0xE8E7
    case gmdUpdate = 0xE923
    case gmdVerifiedUser = 0xE8E8
    case gmdVerticalSplit = 0xE949
    case gmdViewAgenda = 0xE8E9
    case gmdViewArray = 0xE8EA
    case gmdViewCarousel = 0xE8EB
    case gmdViewColumn = 0xE8EC
    case gmdViewDay = 0xE8ED
    case gmdViewHeadline = 0xE8EE
    case gmdViewList = 0xE8EF
    case gmdViewModule = 0xE8F0
    case gmdViewQuilt = 0xE8F1
    case gmdViewStream = 0xE8F2
    case gmdViewWeek = 0xE8F3
    case gmdVisibility = 0xE8F4
    case gmdVisibilityOff = 0xE8F5
    case gmdVoiceOverOff = 0xE94A
    case gmdWatchLater = 0xE924
    case gmdWork = 0xE8F9
    case gmdWorkOff = 0xE942
    case gmdWorkOutline = 0xE943
    case gmdYoutubeSearchedFor = 0xE8FA
    case gmdZoomIn = 0xE8FF
    case gmdZoomOut = 0xE900
    case gmdAddAlert = 0xE003
    case gmdError = 0xE000
    case gmdErrorOutline = 0xE001
    case gmdNotificationImportant = 0xE004
    case gmdWarning = 0xE002
    case gmd4k = 0xE072
    case gmdAddToQueue = 0xE05C
    case gmdAirplay = 0xE055
    case gmdAlbum = 0xE019
    case gmdArtTrack = 0xE060
    case gmdAvTimer = 0xE01B
    case gmdBrandingWatermark = 0xE06B
    case gmdCallToAction = 0xE06C
    case gmdClosedCaption = 0xE01C
    case gmdControlCamera = 0xE074
    case gmdEqualizer = 0xE01D
    case gmdExplicit = 0xE01E
    case gmdFastForward = 0xE01F
    case gmdFastRewind = 0xE020
    case gmdFeaturedPlayList = 0xE06E
    case gmdFeaturedVideo = 0xE06D
    case gmdFiberDvr = 0xE05D
    case gmdFiberManualRecord = 0xE061
    case gmdFiberNew = 0xE05E
    case gmdFiberPin = 0xE06A
    case gmdFiberSmartRecord = 0xE062
    case gmdForward10 = 0xE056
    case gmdForward30 = 0xE057
    case gmdForward5 = 0xE058
    case gmdGames = 0xE021
    case gmdHd = 0xE052
    case gmdHearing = 0xE023
    case gmdHighQuality = 0xE024
    case gmdLibraryAdd = 0xE02E
    case gmdLibraryBooks = 0xE02F
    case gmdLibraryMusic = 0xE030
    case gmdLoop = 0xE028
    case gmdMic = 0xE029
    case gmdMicNone = 0xE02A
    case gmdMicOff = 0xE02B
    case gmdMissedVideoCall = 0xE073
    case gmdMovie = 0xE02C
    case gmdMusicVideo = 0xE063
    case gmdNewReleases = 0xE031
    case gmdNotInterested = 0xE033
    case gmdNote = 0xE06F
    case gmdPause = 0xE034
    case gmdPauseCircleFilled = 0xE035
    case gmdPauseCircleOutline = 0xE036
    case gmdPlayArrow = 0xE037
    case gmdPlayCircleFilled = 0xE038
    //case gmdPlayCircleFilledWhite = 0x
    case gmdPlayCircleOutline = 0xE039
    case gmdPlaylistAdd = 0xE03B
    case gmdPlaylistAddCheck = 0xE065
    case gmdPlaylistPlay = 0xE05F
    case gmdQueue = 0xE03C
    case gmdQueueMusic = 0xE03D
    case gmdQueuePlayNext = 0xE066
    case gmdRadio = 0xE03E
    case gmdRecentActors = 0xE03F
    case gmdRemoveFromQueue = 0xE067
    case gmdRepeat = 0xE040
    case gmdRepeatOne = 0xE041
    case gmdReplay = 0xE042
    case gmdReplay10 = 0xE059
    case gmdReplay30 = 0xE05A
    case gmdReplay5 = 0xE05B
    case gmdShuffle = 0xE043
    case gmdSkipNext = 0xE044
    case gmdSkipPrevious = 0xE045
    //case gmdSlowMotionVideo = 0x
    case gmdSnooze = 0xE046
    case gmdSortByAlpha = 0xE053
    case gmdStop = 0xE047
    case gmdSubscriptions = 0xE064
    case gmdSubtitles = 0xE048
    case gmdSurroundSound = 0xE049
    case gmdVideoCall = 0xE070
    case gmdVideoLabel = 0xE071
    case gmdVideoLibrary = 0xE04A
    case gmdVideocam = 0xE04B
    case gmdVideocamOff = 0xE04C
    case gmdVolumeDown = 0xE04D
    case gmdVolumeMute = 0xE04E
    case gmdVolumeOff = 0xE04F
    case gmdVolumeUp = 0xE050
    case gmdWeb = 0xE051
    case gmdWebAsset = 0xE069
    case gmdAlternateEmail = 0xE0E6
    case gmdBusiness = 0xE0AF
    case gmdCall = 0xE0B0
    case gmdCallEnd = 0xE0B1
    case gmdCallMade = 0xE0B2
    case gmdCallMerge = 0xE0B3
    case gmdCallMissed = 0xE0B4
    case gmdCallMissedOutgoing = 0xE0E4
    case gmdCallReceived = 0xE0B5
    case gmdCallSplit = 0xE0B6
    case gmdCancelPresentation = 0xE0E9
    case gmdCellWifi = 0xE0EC //Note - this isn't quite the same as the icon on material.io - possibly a versioning issue
    case gmdChat = 0xE0B7
    case gmdChatBubble = 0xE0CA
    case gmdChatBubbleOutline = 0xE0CB
    case gmdClearAll = 0xE0B8
    case gmdComment = 0xE0B9
    case gmdContactMail = 0xE0D0
    case gmdContactPhone = 0xE0CF
    case gmdContacts = 0xE0BA
    case gmdDesktopAccessDisabled = 0xE99D
    case gmdDialerSip = 0xE0BB
    case gmdDialpad = 0xE0BC
    case gmdDomainDisabled = 0xE0EF
    case gmdDuo = 0xE9A5
    case gmdEmail = 0xE0BE
    case gmdForum = 0xE0BF
    case gmdImportContacts = 0xE0E0
    case gmdImportExport = 0xE0C3
    case gmdInvertColorsOff = 0xE0C4
    case gmdListAlt = 0xE0EE
    case gmdLiveHelp = 0xE0C6
    case gmdLocationOff = 0xE0C7
    case gmdLocationOn = 0xE0C8
    case gmdMailOutline = 0xE0E1
    case gmdMessage = 0xE0C9
    case gmdMobileScreenShare = 0xE0E7
    case gmdNoSim = 0xE0CC
    case gmdPausePresentation = 0xE0EA
    case gmdPersonAddDisabled = 0xE9CB
    case gmdPhone = 0xE0CD
    case gmdPhonelinkErase = 0xE0DB
    case gmdPhonelinkLock = 0xE0DC
    case gmdPhonelinkRing = 0xE0DD
    case gmdPhonelinkSetup = 0xE0DE
    case gmdPortableWifiOff = 0xE0CE
    case gmdPresentToAll = 0xE0DF
    case gmdPrintDisabled = 0xE9CF
    case gmdRingVolume = 0xE0D1
    case gmdRssFeed = 0xE0E5
    case gmdScreenShare = 0xE0E2
    case gmdSentimentSatisfiedAlt = 0xE0ED
    case gmdSpeakerPhone = 0xE0D2
    case gmdStayCurrentLandscape = 0xE0D3
    case gmdStayCurrentPortrait = 0xE0D4
    case gmdStayPrimaryLandscape = 0xE0D5
    case gmdStayPrimaryPortrait = 0xE0D6
    case gmdStopScreenShare = 0xE0E3
    case gmdSwapCalls = 0xE0D7
    case gmdTextsms = 0xE0D8
    case gmdUnsubscribe = 0xE0EB
    case gmdVoicemail = 0xE0D9
    case gmdVpnKey = 0xE0DA
    case gmdAdd = 0xE145
    case gmdAddBox = 0xE146
    case gmdAddCircle = 0xE147
    case gmdAddCircleOutline = 0xE148
    case gmdArchive = 0xE149
    case gmdBackspace = 0xE14A
    case gmdBallot = 0xE172
    case gmdBlock = 0xE14B
    case gmdClear = 0xE14C
    case gmdCreate = 0xE150
    case gmdDeleteSweep = 0xE16C
    case gmdDrafts = 0xE151
    case gmdFileCopy = 0xE173
    case gmdFilterList = 0xE152
    case gmdFlag = 0xE153
    case gmdFontDownload = 0xE167
    case gmdForward = 0xE154
    case gmdGesture = 0xE155
    case gmdHowToReg = 0xE174
    case gmdHowToVote = 0xE175
    case gmdInbox = 0xE156
    case gmdLink = 0xE157
    case gmdLinkOff = 0xE16F
    case gmdLowPriority = 0xE16D
    case gmdMail = 0xE158
    case gmdMarkunread = 0xE159
    case gmdMoveToInbox = 0xE168
    case gmdNextWeek = 0xE16A
    case gmdOutlinedFlag = 0xE16E
    case gmdRedo = 0xE15A
    case gmdRemove = 0xE15B
    case gmdRemoveCircle = 0xE15C
    case gmdRemoveCircleOutline = 0xE15D
    case gmdReply = 0xE15E
    case gmdReplyAll = 0xE15F
    case gmdReport = 0xE160
    case gmdReportOff = 0xE170
    case gmdSave = 0xE161
    case gmdSaveAlt = 0xE171
    case gmdSelectAll = 0xE162
    case gmdSend = 0xE163
    case gmdSort = 0xE164
    case gmdTextFormat = 0xE165
    case gmdUnarchive = 0xE169
    case gmdUndo = 0xE166
    case gmdWaves = 0xE176
    case gmdWeekend = 0xE16B
    case gmdWhereToVote = 0xE177
    case gmdAccessAlarm = 0xE190
    case gmdAccessAlarms = 0xE191
    case gmdAccessTime = 0xE192
    case gmdAddAlarm = 0xE193
    case gmdAddToHomeScreen = 0xE1FE
    case gmdAirplanemodeActive = 0xE195
    case gmdAirplanemodeInactive = 0xE194
    //case gmdBattery20 = 0x
    //case gmdBattery30 = 0x
    //case gmdBattery50 = 0x
    //case gmdBattery60 = 0x
    //case gmdBattery80 = 0x
    //case gmdBattery90 = 0x
    case gmdBatteryAlert = 0xE19C
    //case gmdBatteryCharging20 = 0x
    //case gmdBatteryCharging30 = 0x
    //case gmdBatteryCharging50 = 0x
    //case gmdBatteryCharging60 = 0x
    //case gmdBatteryCharging80 = 0x
    //case gmdBatteryCharging90 = 0x
    case gmdBatteryChargingFull = 0xE1A3
    case gmdBatteryFull = 0xE1A4
    case gmdBatteryStd = 0xE1A5
    case gmdBatteryUnknown = 0xE1A6
    case gmdBluetooth = 0xE1A7
    case gmdBluetoothConnected = 0xE1A8
    case gmdBluetoothDisabled = 0xE1A9
    case gmdBluetoothSearching = 0xE1AA
    case gmdBrightnessAuto = 0xE1AB
    case gmdBrightnessHigh = 0xE1AC
    case gmdBrightnessLow = 0xE1AD
    case gmdBrightnessMedium = 0xE1AE
    case gmdDataUsage = 0xE1AF
    case gmdDeveloperMode = 0xE1B0
    case gmdDevices = 0xE1B1
    case gmdDvr = 0xE1B2
    case gmdGpsFixed = 0xE1B3
    case gmdGpsNotFixed = 0xE1B4
    case gmdGpsOff = 0xE1B5
    case gmdGraphicEq = 0xE1B8
    case gmdLocationDisabled = 0xE1B6
    case gmdLocationSearching = 0xE1B7
    case gmdMobileFriendly = 0xE200
    case gmdMobileOff = 0xE201
    case gmdNetworkCell = 0xE1B9
    case gmdNetworkWifi = 0xE1BA
    case gmdNfc = 0xE1BB
    case gmdScreenLockLandscape = 0xE1BE
    case gmdScreenLockPortrait = 0xE1BF
    case gmdScreenLockRotation = 0xE1C0
    case gmdScreenRotation = 0xE1C1
    case gmdSdStorage = 0xE1C2
    case gmdSettingsSystemDaydream = 0xE1C3
    //case gmdSignalCellular0Bar = 0x
    //case gmdSignalCellular1Bar = 0x
    //case gmdSignalCellular2Bar = 0x
    //case gmdSignalCellular3Bar = 0x
    case gmdSignalCellular4Bar = 0xE1C8
    //case gmdSignalCellularAlt = 0x
    //case gmdSignalCellularConnectedNoInternet0Bar = 0x
    //case gmdSignalCellularConnectedNoInternet1Bar = 0x
    //case gmdSignalCellularConnectedNoInternet2Bar = 0x
    //case gmdSignalCellularConnectedNoInternet3Bar = 0x
    case gmdSignalCellularConnectedNoInternet4Bar = 0xE1CD
    case gmdSignalCellularNoSim = 0xE1CE
    case gmdSignalCellularNull = 0xE1CF
    case gmdSignalCellularOff = 0xE1D0
    //case gmdSignalWifi0Bar = 0x
    //case gmdSignalWifi1Bar = 0x
    //case gmdSignalWifi1BarLock = 0x
    //case gmdSignalWifi2Bar = 0x
    //case gmdSignalWifi2BarLock = 0x
    //case gmdSignalWifi3Bar = 0x
    //case gmdSignalWifi3BarLock = 0x
    case gmdSignalWifi4Bar = 0xE1D8
    case gmdSignalWifi4BarLock = 0xE1D9
    case gmdSignalWifiOff = 0xE1DA
    case gmdStorage = 0xE1DB
    case gmdUsb = 0xE1E0
    case gmdWallpaper = 0xE1BC
    case gmdWidgets = 0xE1BD
    case gmdWifiLock = 0xE1E1
    case gmdWifiTethering = 0xE1E2
    case gmdAddComment = 0xE266
    case gmdAttachFile = 0xE226
    case gmdAttachMoney = 0xE227
    case gmdBarChart = 0xE26B
    case gmdBorderAll = 0xE228
    case gmdBorderBottom = 0xE229
    case gmdBorderClear = 0xE22A
    case gmdBorderColor = 0xE22B
    case gmdBorderHorizontal = 0xE22C
    case gmdBorderInner = 0xE22D
    case gmdBorderLeft = 0xE22E
    case gmdBorderOuter = 0xE22F
    case gmdBorderRight = 0xE230
    case gmdBorderStyle = 0xE231
    case gmdBorderTop = 0xE232
    case gmdBorderVertical = 0xE233
    case gmdBubbleChart = 0xE6DD
    case gmdDragHandle = 0xE25D
    case gmdFormatAlignCenter = 0xE234
    case gmdFormatAlignJustify = 0xE235
    case gmdFormatAlignLeft = 0xE236
    case gmdFormatAlignRight = 0xE237
    case gmdFormatBold = 0xE238
    case gmdFormatClear = 0xE239
    case gmdFormatColorFill = 0xE23A
    case gmdFormatColorReset = 0xE23B
    case gmdFormatColorText = 0xE23C
    case gmdFormatIndentDecrease = 0xE23D
    case gmdFormatIndentIncrease = 0xE23E
    case gmdFormatItalic = 0xE23F
    case gmdFormatLineSpacing = 0xE240
    case gmdFormatListBulleted = 0xE241
    case gmdFormatListNumbered = 0xE242
    case gmdFormatListNumberedRtl = 0xE267
    case gmdFormatPaint = 0xE243
    case gmdFormatQuote = 0xE244
    case gmdFormatShapes = 0xE25E
    case gmdFormatSize = 0xE245
    case gmdFormatStrikethrough = 0xE246
    case gmdFormatTextdirectionLToR = 0xE247
    case gmdFormatTextdirectionRToL = 0xE248
    case gmdFormatUnderlined = 0xE249
    case gmdFunctions = 0xE24A
    case gmdHighlight = 0xE25F
    case gmdInsertChart = 0xE24B
    case gmdInsertChartOutlined = 0xE26A
    case gmdInsertComment = 0xE24C
    case gmdInsertDriveFile = 0xE24D
    case gmdInsertEmoticon = 0xE24E
    case gmdInsertInvitation = 0xE24F
    case gmdInsertLink = 0xE250
    case gmdInsertPhoto = 0xE251
    case gmdLinearScale = 0xE260
    case gmdMergeType = 0xE252
    case gmdModeComment = 0xE253
    case gmdMonetizationOn = 0xE263
    case gmdMoneyOff = 0xE25C
    case gmdMultilineChart = 0xE6DF
    case gmdNotes = 0xE26C
    case gmdPieChart = 0xE64C
    case gmdPublish = 0xE255
    case gmdScatterPlot = 0xE268
    case gmdScore = 0xE269
    case gmdShortText = 0xE261
    case gmdShowChart = 0xE6E1
    case gmdSpaceBar = 0xE256
    case gmdStrikethroughS = 0xE257
    case gmdTableChart = 0xE265
    case gmdTextFields = 0xE262
    case gmdTitle = 0xE264
    case gmdVerticalAlignBottom = 0xE258
    case gmdVerticalAlignCenter = 0xE259
    case gmdVerticalAlignTop = 0xE25A
    case gmdWrapText = 0xE25B
    case gmdAttachment = 0xE2BC
    case gmdCloud = 0xE2BD
    case gmdCloudCircle = 0xE2BE
    case gmdCloudDone = 0xE2BF
    case gmdCloudDownload = 0xE2C0
    case gmdCloudOff = 0xE2C1
    case gmdCloudQueue = 0xE2C2
    case gmdCloudUpload = 0xE2C3
    case gmdCreateNewFolder = 0xE2CC
    case gmdFolder = 0xE2C7
    case gmdFolderOpen = 0xE2C8
    case gmdFolderShared = 0xE2C9
    case gmdCast = 0xE307
    case gmdCastConnected = 0xE308
    //case gmdCastForEducation = 0x
    case gmdComputer = 0xE30A
    case gmdDesktopMac = 0xE30B
    case gmdDesktopWindows = 0xE30C
    case gmdDeveloperBoard = 0xE30D
    case gmdDeviceHub = 0xE335
    case gmdDeviceUnknown = 0xE339
    case gmdDevicesOther = 0xE337
    case gmdDock = 0xE30E
    case gmdGamepad = 0xE30F
    case gmdHeadset = 0xE310
    case gmdHeadsetMic = 0xE311
    case gmdKeyboard = 0xE312
    case gmdKeyboardArrowDown = 0xE313
    case gmdKeyboardArrowLeft = 0xE314
    case gmdKeyboardArrowRight = 0xE315
    case gmdKeyboardArrowUp = 0xE316
    case gmdKeyboardBackspace = 0xE317
    case gmdKeyboardCapslock = 0xE318
    case gmdKeyboardHide = 0xE31A
    case gmdKeyboardReturn = 0xE31B
    case gmdKeyboardTab = 0xE31C
    case gmdKeyboardVoice = 0xE31D
    case gmdLaptop = 0xE31E
    case gmdLaptopChromebook = 0xE31F
    case gmdLaptopMac = 0xE320
    case gmdLaptopWindows = 0xE321
    case gmdMemory = 0xE322
    case gmdMouse = 0xE323
    case gmdPhoneAndroid = 0xE324
    case gmdPhoneIphone = 0xE325
    case gmdPhonelink = 0xE326
    case gmdPhonelinkOff = 0xE327
    case gmdPowerInput = 0xE336
    case gmdRouter = 0xE328
    case gmdScanner = 0xE329
    case gmdSecurity = 0xE32A
    case gmdSimCard = 0xE32B
    case gmdSmartphone = 0xE32C
    case gmdSpeaker = 0xE32D
    case gmdSpeakerGroup = 0xE32E
    case gmdTablet = 0xE32F
    case gmdTabletAndroid = 0xE330
    case gmdTabletMac = 0xE331
    case gmdToys = 0xE332
    case gmdTv = 0xE333
    case gmdVideogameAsset = 0xE338
    case gmdWatch = 0xE334
    case gmdAddAPhoto = 0xE439
    case gmdAddPhotoAlternate = 0xE43E
    case gmdAddToPhotos = 0xE39D
    case gmdAdjust = 0xE39E
    case gmdAssistant = 0xE39F
    case gmdAssistantPhoto = 0xE3A0
    case gmdAudiotrack = 0xE3A1
    case gmdBlurCircular = 0xE3A2
    case gmdBlurLinear = 0xE3A3
    case gmdBlurOff = 0xE3A4
    case gmdBlurOn = 0xE3A5
    case gmdBrightness1 = 0xE3A6
    case gmdBrightness2 = 0xE3A7
    case gmdBrightness3 = 0xE3A8
    case gmdBrightness4 = 0xE3A9
    case gmdBrightness5 = 0xE3AA
    case gmdBrightness6 = 0xE3AB
    case gmdBrightness7 = 0xE3AC
    case gmdBrokenImage = 0xE3AD
    case gmdBrush = 0xE3AE
    case gmdBurstMode = 0xE43C
    case gmdCamera = 0xE3AF
    case gmdCameraAlt = 0xE3B0
    case gmdCameraFront = 0xE3B1
    case gmdCameraRear = 0xE3B2
    case gmdCameraRoll = 0xE3B3
    case gmdCenterFocusStrong = 0xE3B4
    case gmdCenterFocusWeak = 0xE3B5
    case gmdCollections = 0xE3B6
    case gmdCollectionsBookmark = 0xE431
    case gmdColorLens = 0xE3B7
    case gmdColorize = 0xE3B8
    case gmdCompare = 0xE3B9
    case gmdControlPoint = 0xE3BA
    case gmdControlPointDuplicate = 0xE3BB
    case gmdCrop = 0xE3BE
    case gmdCrop169 = 0xE3BC
    case gmdCrop32 = 0xE3BD
    case gmdCrop54 = 0xE3BF
    case gmdCrop75 = 0xE3C0
    case gmdCropDin = 0xE3C1
    case gmdCropFree = 0xE3C2
    case gmdCropLandscape = 0xE3C3
    case gmdCropOriginal = 0xE3C4
    case gmdCropPortrait = 0xE3C5
    case gmdCropRotate = 0xE437
    case gmdCropSquare = 0xE3C6
    case gmdDehaze = 0xE3C7
    case gmdDetails = 0xE3C8
    case gmdEdit = 0xE3C9
    case gmdExposure = 0xE3CA
    case gmdExposureNeg1 = 0xE3CB
    case gmdExposureNeg2 = 0xE3CC
    case gmdExposurePlus1 = 0xE3CD
    case gmdExposurePlus2 = 0xE3CE
    case gmdExposureZero = 0xE3CF
    case gmdFilter = 0xE3D3
    case gmdFilter1 = 0xE3D0
    case gmdFilter2 = 0xE3D1
    case gmdFilter3 = 0xE3D2
    case gmdFilter4 = 0xE3D4
    case gmdFilter5 = 0xE3D5
    case gmdFilter6 = 0xE3D6
    case gmdFilter7 = 0xE3D7
    case gmdFilter8 = 0xE3D8
    case gmdFilter9 = 0xE3D9
    case gmdFilter9Plus = 0xE3DA
    case gmdFilterBAndW = 0xE3DB
    case gmdFilterCenterFocus = 0xE3DC
    case gmdFilterDrama = 0xE3DD
    case gmdFilterFrames = 0xE3DE
    case gmdFilterHdr = 0xE3DF
    case gmdFilterNone = 0xE3E0
    case gmdFilterTiltShift = 0xE3E2
    case gmdFilterVintage = 0xE3E3
    case gmdFlare = 0xE3E4
    case gmdFlashAuto = 0xE3E5
    case gmdFlashOff = 0xE3E6
    case gmdFlashOn = 0xE3E7
    case gmdFlip = 0xE3E8
    case gmdGradient = 0xE3E9
    case gmdGrain = 0xE3EA
    case gmdGridOff = 0xE3EB
    case gmdGridOn = 0xE3EC
    case gmdHdrOff = 0xE3ED
    case gmdHdrOn = 0xE3EE
    case gmdHdrStrong = 0xE3F1
    case gmdHdrWeak = 0xE3F2
    case gmdHealing = 0xE3F3
    case gmdImage = 0xE3F4
    case gmdImageAspectRatio = 0xE3F5
    case gmdImageSearch = 0xE43F
    case gmdIso = 0xE3F6
    case gmdLandscape = 0xE3F7
    case gmdLeakAdd = 0xE3F8
    case gmdLeakRemove = 0xE3F9
    case gmdLens = 0xE3FA
    case gmdLinkedCamera = 0xE438
    case gmdLooks = 0xE3FC
    case gmdLooks3 = 0xE3FB
    case gmdLooks4 = 0xE3FD
    case gmdLooks5 = 0xE3FE
    case gmdLooks6 = 0xE3FF
    case gmdLooksOne = 0xE400
    case gmdLooksTwo = 0xE401
    case gmdLoupe = 0xE402
    case gmdMonochromePhotos = 0xE403
    case gmdMovieCreation = 0xE404
    case gmdMovieFilter = 0xE43A
    case gmdMusicNote = 0xE405
    case gmdMusicOff = 0xE440
    case gmdNature = 0xE406
    case gmdNaturePeople = 0xE407
    case gmdNavigateBefore = 0xE408
    case gmdNavigateNext = 0xE409
    case gmdPalette = 0xE40A
    case gmdPanorama = 0xE40B
    case gmdPanoramaFishEye = 0xE40C
    case gmdPanoramaHorizontal = 0xE40D
    case gmdPanoramaVertical = 0xE40E
    case gmdPanoramaWideAngle = 0xE40F
    case gmdPhoto = 0xE410
    case gmdPhotoAlbum = 0xE411
    case gmdPhotoCamera = 0xE412
    case gmdPhotoFilter = 0xE43B
    case gmdPhotoLibrary = 0xE413
    case gmdPhotoSizeSelectActual = 0xE432
    case gmdPhotoSizeSelectLarge = 0xE433
    case gmdPhotoSizeSelectSmall = 0xE434
    case gmdPictureAsPdf = 0xE415
    case gmdPortrait = 0xE416
    case gmdRemoveRedEye = 0xE417
    case gmdRotate90DegreesCcw = 0xE418
    case gmdRotateLeft = 0xE419
    case gmdRotateRight = 0xE41A
    case gmdShutterSpeed = 0xE43D
    case gmdSlideshow = 0xE41B
    case gmdStraighten = 0xE41C
    case gmdStyle = 0xE41D
    case gmdSwitchCamera = 0xE41E
    case gmdSwitchVideo = 0xE41F
    case gmdTagFaces = 0xE420
    case gmdTexture = 0xE421
    case gmdTimelapse = 0xE422
    case gmdTimer = 0xE425
    case gmdTimer10 = 0xE423
    case gmdTimer3 = 0xE424
    case gmdTimerOff = 0xE426
    case gmdTonality = 0xE427
    case gmdTransform = 0xE428
    case gmdTune = 0xE429
    case gmdViewComfy = 0xE42A
    case gmdViewCompact = 0xE42B
    case gmdVignette = 0xE435
    case gmdWbAuto = 0xE42C
    case gmdWbCloudy = 0xE42D
    case gmdWbIncandescent = 0xE42E
    case gmdWbIridescent = 0xE436
    case gmdWbSunny = 0xE430
    case gmd360 = 0xE577
    case gmdAddLocation = 0xE567
    case gmdAtm = 0xE573
    case gmdBeenhere = 0xE52D
    case gmdCategory = 0xE574
    case gmdCompassCalibration = 0xE57C
    case gmdDepartureBoard = 0xE576
    case gmdDirections = 0xE52E
    case gmdDirectionsBike = 0xE52F
    case gmdDirectionsBoat = 0xE532
    case gmdDirectionsBus = 0xE530
    case gmdDirectionsCar = 0xE531
    case gmdDirectionsRailway = 0xE534
    case gmdDirectionsRun = 0xE566
    case gmdDirectionsSubway = 0xE533
    case gmdDirectionsTransit = 0xE535
    case gmdDirectionsWalk = 0xE536
    case gmdEditAttributes = 0xE578
    case gmdEditLocation = 0xE568
    case gmdEvStation = 0xE56D
    case gmdFastfood = 0xE57A
    case gmdFlight = 0xE539
    case gmdHotel = 0xE53A
    case gmdLayers = 0xE53B
    case gmdLayersClear = 0xE53C
    case gmdLocalActivity = 0xE53F
    case gmdLocalAirport = 0xE53D
    case gmdLocalAtm = 0xE53E
    case gmdLocalBar = 0xE540
    case gmdLocalCafe = 0xE541
    case gmdLocalCarWash = 0xE542
    case gmdLocalConvenienceStore = 0xE543
    case gmdLocalDining = 0xE556
    case gmdLocalDrink = 0xE544
    case gmdLocalFlorist = 0xE545
    case gmdLocalGasStation = 0xE546
    case gmdLocalGroceryStore = 0xE547
    case gmdLocalHospital = 0xE548
    case gmdLocalHotel = 0xE549
    case gmdLocalLaundryService = 0xE54A
    case gmdLocalLibrary = 0xE54B
    case gmdLocalMall = 0xE54C
    case gmdLocalMovies = 0xE54D
    case gmdLocalOffer = 0xE54E
    case gmdLocalParking = 0xE54F
    case gmdLocalPharmacy = 0xE550
    case gmdLocalPhone = 0xE551
    case gmdLocalPizza = 0xE552
    case gmdLocalPlay = 0xE553
    case gmdLocalPostOffice = 0xE554
    case gmdLocalPrintshop = 0xE555
    case gmdLocalSee = 0xE557
    case gmdLocalShipping = 0xE558
    case gmdLocalTaxi = 0xE559
    case gmdMap = 0xE55B
    case gmdMoney = 0xE57D
    case gmdMyLocation = 0xE55C
    case gmdNavigation = 0xE55D
    case gmdNearMe = 0xE569
    case gmdNotListedLocation = 0xE575
    case gmdPersonPin = 0xE55A
    case gmdPersonPinCircle = 0xE56A
    case gmdPinDrop = 0xE55E
    case gmdPlace = 0xE55F
    case gmdRateReview = 0xE560
    case gmdRestaurant = 0xE56C
    case gmdRestaurantMenu = 0xE561
    case gmdSatellite = 0xE562
    case gmdStoreMallDirectory = 0xE563
    case gmdStreetview = 0xE56E
    case gmdSubway = 0xE56F
    case gmdTerrain = 0xE564
    case gmdTraffic = 0xE565
    case gmdTrain = 0xE570
    case gmdTram = 0xE571
    case gmdTransferWithinAStation = 0xE572
    case gmdTransitEnterexit = 0xE579
    case gmdTripOrigin = 0xE57B
    case gmdZoomOutMap = 0xE56B
    case gmdApps = 0xE5C3
    case gmdArrowBack = 0xE5C4
    case gmdArrowBackIos = 0xE5E0
    case gmdArrowDownward = 0xE5DB
    case gmdArrowDropDown = 0xE5C5
    case gmdArrowDropDownCircle = 0xE5C6
    case gmdArrowDropUp = 0xE5C7
    case gmdArrowForward = 0xE5C8
    case gmdArrowForwardIos = 0xE5E1
    case gmdArrowLeft = 0xE5DE
    case gmdArrowRight = 0xE5DF
    case gmdArrowUpward = 0xE5D8
    case gmdCancel = 0xE5C9
    case gmdCheck = 0xE5CA
    case gmdChevronLeft = 0xE5CB
    case gmdChevronRight = 0xE5CC
    case gmdClose = 0xE5CD
    case gmdExpandLess = 0xE5CE
    case gmdExpandMore = 0xE5CF
    case gmdFirstPage = 0xE5DC
    case gmdFullscreen = 0xE5D0
    case gmdFullscreenExit = 0xE5D1
    case gmdLastPage = 0xE5DD
    case gmdMenu = 0xE5D2
    case gmdMoreHoriz = 0xE5D3
    case gmdMoreVert = 0xE5D4
    case gmdRefresh = 0xE5D5
    case gmdSubdirectoryArrowLeft = 0xE5D9
    case gmdSubdirectoryArrowRight = 0xE5DA
    case gmdUnfoldLess = 0xE5D6
    case gmdUnfoldMore = 0xE5D7
    case gmdAdb = 0xE60E
    case gmdAirlineSeatFlat = 0xE630
    case gmdAirlineSeatFlatAngled = 0xE631
    case gmdAirlineSeatIndividualSuite = 0xE632
    case gmdAirlineSeatLegroomExtra = 0xE633
    case gmdAirlineSeatLegroomNormal = 0xE634
    case gmdAirlineSeatLegroomReduced = 0xE635
    case gmdAirlineSeatReclineExtra = 0xE636
    case gmdAirlineSeatReclineNormal = 0xE637
    case gmdBluetoothAudio = 0xE60F
    case gmdConfirmationNumber = 0xE638
    case gmdDiscFull = 0xE610
    case gmdDriveEta = 0xE613
    case gmdEnhancedEncryption = 0xE63F
    case gmdEventAvailable = 0xE614
    case gmdEventBusy = 0xE615
    case gmdEventNote = 0xE616
    case gmdFolderSpecial = 0xE617
    case gmdLiveTv = 0xE639
    case gmdMms = 0xE618
    case gmdMore = 0xE619
    case gmdNetworkCheck = 0xE640
    case gmdNetworkLocked = 0xE61A
    case gmdNoEncryption = 0xE641
    case gmdOndemandVideo = 0xE63A
    case gmdPersonalVideo = 0xE63B
    case gmdPhoneBluetoothSpeaker = 0xE61B
    case gmdPhoneCallback = 0xE649
    case gmdPhoneForwarded = 0xE61C
    case gmdPhoneInTalk = 0xE61D
    case gmdPhoneLocked = 0xE61E
    case gmdPhoneMissed = 0xE61F
    case gmdPhonePaused = 0xE620
    case gmdPower = 0xE63C
    case gmdPowerOff = 0xE646
    case gmdPriorityHigh = 0xE645
    case gmdSdCard = 0xE623
    case gmdSms = 0xE625
    case gmdSmsFailed = 0xE626
    case gmdSync = 0xE627
    case gmdSyncDisabled = 0xE628
    case gmdSyncProblem = 0xE629
    case gmdSystemUpdate = 0xE62A
    case gmdTapAndPlay = 0xE62B
    case gmdTimeToLeave = 0xE62C
    case gmdTvOff = 0xE647
    case gmdVibration = 0xE62D
    case gmdVoiceChat = 0xE62E
    case gmdVpnLock = 0xE62F
    case gmdWc = 0xE63D
    case gmdWifi = 0xE63E
    case gmdWifiOff = 0xE648
    case gmdAcUnit = 0xEB3B
    case gmdAirportShuttle = 0xEB3C
    case gmdAllInclusive = 0xEB3D
    case gmdBeachAccess = 0xEB3E
    case gmdBusinessCenter = 0xEB3F
    case gmdCasino = 0xEB40
    case gmdChildCare = 0xEB41
    case gmdChildFriendly = 0xEB42
    case gmdFitnessCenter = 0xEB43
    case gmdFreeBreakfast = 0xEB44
    case gmdGolfCourse = 0xEB45
    case gmdHotTub = 0xEB46
    case gmdKitchen = 0xEB47
    case gmdMeetingRoom = 0xEB4F
    case gmdNoMeetingRoom = 0xEB4E
    case gmdPool = 0xEB48
    case gmdRoomService = 0xEB49
    case gmdRvHookup = 0xE642
    case gmdSmokeFree = 0xEB4A
    case gmdSmokingRooms = 0xEB4B
    case gmdSpa = 0xEB4C
    case gmdCake = 0xE7E9
    case gmdDomain = 0xE7EE
    case gmdGroup = 0xE7EF
    case gmdGroupAdd = 0xE7F0
    case gmdLocationCity = 0xE7F1
    case gmdMood = 0xE7F2
    case gmdMoodBad = 0xE7F3
    case gmdNotifications = 0xE7F4
    case gmdNotificationsActive = 0xE7F7
    case gmdNotificationsNone = 0xE7F5
    case gmdNotificationsOff = 0xE7F6
    case gmdNotificationsPaused = 0xE7F8
    case gmdPages = 0xE7F9
    case gmdPartyMode = 0xE7FA
    case gmdPeople = 0xE7FB
    case gmdPeopleOutline = 0xE7FC
    case gmdPerson = 0xE7FD
    case gmdPersonAdd = 0xE7FE
    case gmdPersonOutline = 0xE7FF
    case gmdPlusOne = 0xE800
    case gmdPoll = 0xE801
    case gmdPublic = 0xE80B
    case gmdSchool = 0xE80C
    case gmdSentimentDissatisfied = 0xE811
    case gmdSentimentSatisfied = 0xE813
    case gmdSentimentVeryDissatisfied = 0xE814
    case gmdSentimentVerySatisfied = 0xE815
    case gmdShare = 0xE80D
    case gmdThumbDownAlt = 0xE816
    case gmdThumbUpAlt = 0xE817
    case gmdWhatshot = 0xE80E
    case gmdCheckBox = 0xE834
    case gmdCheckBoxOutlineBlank = 0xE835
    case gmdIndeterminateCheckBox = 0xE909
    case gmdRadioButtonChecked = 0xE837
    case gmdRadioButtonUnchecked = 0xE836
    case gmdStar = 0xE838
    case gmdStarBorder = 0xE83A
    case gmdStarHalf = 0xE839
    case gmdToggleOff = 0xE9F5
    case gmdToggleOn = 0xE9F6

    
    static var count: Int {
        return GMDType.allCases.count
    }
    
    public var text: String {
        return String(utf16CodeUnits: [UInt16(rawValue)], count: 1)
    }
    
    static func showAll() {
        for item in GMDType.allCases {
            let number = item.text.utf16.first!
            let hex = String(format:"%02X", number)
            print("case \(item) = 0x\(hex),")
        }
    }
    
    static func font() -> UIFont {
        return UIFont(name: GMDStruct.FontName, size: 23)!
    }

    
}

