//
//  HeaderColor.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderColor_h
#define HeaderColor_h


#define RGB_COLOR(r, g, b,alp) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:alp]

#define HEX_COLOR(string)      [UIColor jk_colorWithHexString:string]

//获取随机颜色
#define CCRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// 上线颜色
#define MAIN_COLOR             HEX_COLOR(@"fa7d0f")
#define MAIN_COLOR_Alp(alp)    RGB_COLOR(250, 125, 15, alp)

#define BLACK_A                HEX_COLOR(@"323232")
#define BLACK_B                HEX_COLOR(@"404040")
#define BLACK_C                HEX_COLOR(@"666f73")

#define GRAY_A                 HEX_COLOR(@"9a9a9a")
#define GRAY_B                 HEX_COLOR(@"b7b7b7")
#define GRAY_C                 HEX_COLOR(@"cccccc")
#define GRAY_D                 HEX_COLOR(@"e8e8e8")

#define BACKGROUND_COLOR       HEX_COLOR(@"F8F8F8")

#define LINE_COLOR_0           HEX_COLOR(@"F0F0F0")
#define LINE_COLOR_1           HEX_COLOR(@"E6E6E6")
#define LINE_COLOR_2           HEX_COLOR(@"DCDCDC")

#define TEXT_COLOR_0           HEX_COLOR(@"C8C8C8")
#define TEXT_COLOR_1           HEX_COLOR(@"969696")
#define TEXT_COLOR_2           HEX_COLOR(@"646464")
#define TEXT_COLOR_3           HEX_COLOR(@"323232")

#define BLUE_COLOR             HEX_COLOR(@"1296db")
#define CLEAR_COLOR            [UIColor clearColor]
#define WHITE_COLOR            [UIColor whiteColor]
#define RED_COLOR              [UIColor redColor]
#define BLACK_COLOR            [UIColor blackColor]
#define ORANGE_COLOR           [UIColor orangeColor]

#define BLACK_30               RGB_COLOR(0, 0, 0, 0.3)

#endif /* HeaderColor_h */
