[![GitHub platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]() 
[![GitHub language](https://img.shields.io/badge/language-objective--c-6BAEE4.svg)]()
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/tezpark/AlternateIconName-objC/master/LICENSE)

# TezTagView
TezTagView will make tag buttons that automatically aligned on UIView.


* Simple custom tag buttons.
* Easy modifing button UI and size.

![ios simulator screen shot 2015 9 14 3 20 51](https://cloud.githubusercontent.com/assets/389004/9843376/76f38426-5af4-11e5-8a2f-a655492518bf.png)

#Usage
```objective-c
    // String array for tag button.
    NSArray* strArr = @[@"test1", @"test2", @"blablablablabla", @"TezTagView", @"This tutorial is center align tags"];
    // Get tagView height
    CGFloat tagViewHeight = [TezTagView getTotalHeightWithDefaultValuesAndWords:strArr];
    // Make tagView
    TezTagView* tagView = [[TezTagView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tagViewHeight)
                                                 tagStrings:strArr
                                                  delegate:self];
    // Align option -> YES:Center / NO:Left
    [tagView setAlignCenter:YES];
    [tagView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:tagView];
```
```objective-c
// TezTagView delegate
- (void)responseOfClickTag:(NSInteger)index {
    NSLog(@"Button index - %lu", index);
}
```


#License
The MIT License (MIT)

Copyright (c) 2015 Taesun Park

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
