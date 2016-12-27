#import <UIKit/UIKit.h>

@interface UIImage (ResizeImage)

+ (UIImage *)resizeImage:(NSString *)imageName;

- (CGSize )getWantSize;
@end
