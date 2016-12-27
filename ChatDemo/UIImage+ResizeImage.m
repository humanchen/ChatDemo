

#import "UIImage+ResizeImage.h"

@implementation UIImage (ResizeImage)

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}

- (CGSize )getWantSize{
    CGSize retSize = self.size;
    CGFloat scaleH = 0.22;
    CGFloat scaleW = 0.38;
    CGFloat height = 0;
    CGFloat width = 0;
    if (retSize.height / kScreenHeight + 0.16 > retSize.width / kScreenWidth) {
        height = kScreenHeight * scaleH;
        width = retSize.width / retSize.height * height;
    } else {
        width = kScreenWidth * scaleW;
        height = retSize.height / retSize.width * width;
    }
    return CGSizeMake(width, height);
}


@end
