//
//  ViewController.swift
//  ScrollViewWithFloatingButton
//
//  Created by Vinoth on 18/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var proceedButton: UIButton!
    
    var shortContent: String?
    var mediumContent: String?
    var longContent: String?
    
    
    var isFloatingButton: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setContents()
        contentLabel.text = shortContent
        isFloatingButton = false
    }

    override func viewDidAppear(_ animated: Bool) {
        setupButtonConstraints()
    }
    
    func setupButtonConstraints() {
        
        let isLongContent = (scrollView.contentSize.height >= UIScreen.main.bounds.height)
       
        let proceedBottomToScrollViewFrameBottom = NSLayoutConstraint(item: proceedButton as Any, attribute: .bottom,
                                                                      relatedBy: .equal,
                                                                      toItem: scrollView.frameLayoutGuide, attribute: .bottom,
                                                                      multiplier: 1, constant: -100)
        let proceedBottomToScrollViewContentBottom = NSLayoutConstraint(item: proceedButton as Any, attribute: .bottom,
                                                                        relatedBy: .equal,
                                                                        toItem: scrollView.contentLayoutGuide, attribute: .bottom,
                                                                        multiplier: 1, constant: -10)
        //Default
        var constraintToActivate = proceedBottomToScrollViewFrameBottom
        if isLongContent {
            constraintToActivate = proceedBottomToScrollViewContentBottom
        }
        if let isFloatingButton = isFloatingButton, isFloatingButton {
            constraintToActivate = proceedBottomToScrollViewFrameBottom
        }
        NSLayoutConstraint.activate([constraintToActivate])
    }
    
    func setContents() {
        shortContent = "Using Auto Layout is the best way to create complex layouts that automatically adapt to their environment, but sometimes adding and removing lots of constraints can cause performance problems."
        mediumContent = "Design a consistent layout that adapts gracefully to context changes, while displaying the same content as much as possible. People expect your experience to work well and remain familiar when they rotate their device, resize a window, or switch to a different device. Ensure an adaptable interface by respecting system-defined safe areas, margins, and guides and specifying layout modifiers to fine-tune the placement of views in your hierarchy.Respect key display and system features in each platform. Safe areas help you accommodate features like the corner radius and sensor housings on various devices, and avoid interfering with interactive system elements like the Home indicator and app switcher on iPhone and iPad. Safe areas also help you account for interactive components like bars, dynamically repositioning content if sizes change.Use placement to convey relative importance. In general, place principal items in the upper half of the screen or window, near the leading side. People typically start in this area, whether they’re looking at the screen or using a screen reader like VoiceOver."
        longContent = "Design a consistent layout that adapts gracefully to context changes, while displaying the same content as much as possible. People expect your experience to work well and remain familiar when they rotate their device, resize a window, or switch to a different device. Ensure an adaptable interface by respecting system-defined safe areas, margins, and guides and specifying layout modifiers to fine-tune the placement of views in your hierarchy. Respect key display and system features in each platform. Safe areas help you accommodate features like the corner radius and sensor housings on various devices, and avoid interfering with interactive system elements like the Home indicator and app switcher on iPhone and iPad. Safe areas also help you account for interactive components like bars, dynamically repositioning content if sizes change.Use placement to convey relative importance. In general, place principal items in the upper half of the screen or window, near the leading side. People typically start in this area, whether they’re looking at the screen or using a screen reader like VoiceOver.Elevate essential information by giving it sufficient space. People want to view the most important information instantly, so you don’t want to clutter the screen or window with nonessential details. People can easily access secondary information by scrolling.Create visual groupings to help people find the information they want. For example, you might use negative space, background shapes, colors, and materials, or separator lines to display related elements and information in distinct areas.Use alignment to ease visual scanning and to communicate organization and hierarchy. Alignment makes an app look neat and organized, helps people focus while scrolling, and makes it easier to find information. Indentation and alignment can also help people visualize an information hierarchy.Be mindful of aspect ratio. Different screen sizes may have different aspect ratios, causing artwork to appear cropped, letterboxed, or pillarboxed. When this is the case, don’t change the aspect ratio of the artwork; instead, scale it to fill the screen so that important visual content remains in view on all display sizes.Be prepared for text-size changes. People expect most apps to respond when they choose a different text size. To accommodate text-size changes, you might need to adjust the layout. For guidance on displaying text in your app, see Typography.When possible, consider alluding to hidden content by partially displaying offscreen elements. In large collections where content doesn’t fit on a single screen, you might be able to hint at the additional content by showing portions of the offscreen items.On touch screens, provide ample touch targets for interactive components. Maintain a minimum tappable area of 44x44 points for all controls.Preview your app on multiple devices, using different orientations, localizations, and text sizes. Although it’s generally best to preview features like wide color on actual devices, you can use Xcode Simulator to check for clipping and other layout issues. For example, if your iOS app supports landscape mode, you can use Simulator to make sure your layouts look great regardless of whether the device rotates left or right.Platform considerationsiOS, iPadOSAim to support both portrait and landscape orientations. People choose different orientations for a variety of reasons, and they generally expect apps to work well in every context. If it’s essential that your app run in a single orientation, don’t tell people to rotate their device to match; if your app doesn’t rotate automatically when someone holds the device in an unsupported orientation, they’ll know instinctively to rotate it. If your app is landscape-only, make sure it runs equally well whether people rotate their device to the left or the right.If your app runs on a specific device, make sure it runs on every screen size for that device. In other words, an iPhone-only app must run on every iPhone screen size and an iPad-only app must run on every iPad screen size. For guidance, see Device screen sizes and orientations.Inset full-width buttons. Respect the standard system-defined margins on the sides of full-width buttons. A full-width button at the bottom of the screen generally looks best when it has rounded corners and it aligns with the bottom of the safe area — which also ensures that it doesn’t conflict with the Home indicator.Extend visual content to fill the screen. Make sure backgrounds extend to the edges of the display, and that vertically scrollable layouts, like tables and collections, continue all the way to the bottom.On iPad, consider placing controls on the sides of the screen in landscape orientation. When controls are on the left and right sides of the screen, people can reach them easily with both hands while they’re holding the device.Avoid placing interactive controls at the bottom edge of the screen when possible. Regardless of orientation, people use system gestures at the bottom edge of the display to access features like the Home screen and app switcher, and these gestures may cancel custom gestures you implement in this area. Also avoid placing controls in the far corners of the screen because these areas can be difficult for people to reach comfortably. If your game needs to place controls in the lower portion of the screen — below the safe area — use matching insets when placing them at the top and bottom of the screen, and leave ample space around the Home indicator so people don’t accidentally target it when trying to interact with a control.Be prepared for different status bar heights. If you display content below the status bar, you can use the safe area to help dynamically reposition the content as needed.Hide the status bar only when it adds value or enhances your experience. The status bar displays information people find useful and it occupies an area of the screen most apps don’t fully use, so it’s generally a good idea to keep it visible.iOS, iPadOS safe areasThe safe area defines the area within a view that isn’t covered by a navigation bar, tab bar, toolbar, or other views a view controller might provide."
            
    }

}

