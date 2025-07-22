#import "../../InstagramHeaders.h"
#import "../../Manager.h"
#import "../../Utils.h"

%hook IGDirectThreadThemePickerViewController
- (void)themeNewPickerSectionController:(id)arg1 didSelectTheme:(id)arg2 atIndex:(NSInteger)arg3 {
    if ([SCIManager getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Doğrudan tema değişikliği onayı. 🎨"); // Güncellendi

        [SCIUtils showConfirmation:^(void) { %orig; }];
    } else {
        return %orig;
    }
}
- (void)themePickerSectionController:(id)arg1 didSelectThemeId:(id)arg2 {
    if ([SCIManager getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Doğrudan tema değişikliği onayı. 🎨"); // Güncellendi

        [SCIUtils showConfirmation:^(void) { %orig; }];
    } else {
        return %orig;
    }
}
%end

%hook IGDirectThreadThemeKitSwift.IGDirectThreadThemePreviewController
- (void)primaryButtonTapped {
    if ([SCIManager getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Doğrudan tema değişikliği onayı. 🎨"); // Güncellendi

        [SCIUtils showConfirmation:^(void) { %orig; }];
    } else {
        return %orig;
    }
}
%end
