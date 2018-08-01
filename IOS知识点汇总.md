# IOS知识点汇总
## 第三方开源项目
### 响应式编程
* [Swift-ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
* [RxSwift](https://github.com/ReactiveX/RxSwift)

#### [AFNetworking -- 功能非常齐全的网络数据请求库，侧重于处理各种类型的api风格,提供了远程图片异步加载，上传下载等常用功能，如果项目数据量很小它会是很好的选择](https://github.com/AFNetworking/AFNetworking)
* POST
* GET

#### [SDWebImage -- 图片异步加载](https://github.com/rs/SDWebImage)

* 特点
   * 不阻塞主线程
   * 异步加载图片，不重复获取图片URL
   * 后台图片解压缩
   * 高性能
   * 使用GCD和ARC
   * 支持多种图片格式，包括GIF
   * 提供 UIImageView, UIButton, MKAnnotationView 的分类，用来显示网络图片，以及缓存管理
   * 异步缓存（内存+磁盘），并且自动管理缓存有效性
 
 ***
   * 使用方法，常用：UIImageView+WebCache
 ```
 [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"图片链接"] placeholderImage:[UIImage imageNamed:@"默认图片"]];
 ```
 
   * 使用回调 blocks
   
  ```
  [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"图片链接"]
                      placeholderImage:[UIImage imageNamed:@"默认图片"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 ... completion code here ...
                             }];
  ```
  
   *  SDWebImageManager 的使用(将图片下载和图片缓存组合起来了,也可以单独使用)

   ```
   SDWebImageManager *manager = [SDWebImageManager sharedManager];
[manager loadImageWithURL:imageURL
                      options:0
                     progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         // progression tracking code
                     }
                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                        if (image) {
                            // do something with image
                        }
                    }];
   ```
   
   * 使用 SDWebImageDownloader 异步下载图片(单独使用，图片不会缓存)

   ```
   SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
[downloader downloadImageWithURL:imageURL
                             options:0
                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                // progression tracking code
                            }
                           completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                               if (image && finished) {
                                   // do something with image
                               }
                           }];
   ```
   
   * 使用 SDImageCache 异步缓存图片(单独使用时，可使用单例，也可以创建一个有独立命名空间的 SDImageCache 实例)
      * 添加缓存
      
   ```
   [[SDImageCache sharedImageCache] storeImage:myImage forKey:myCacheKey];
   ```
   
      * 默认情况下，图片数据会同时缓存到内存和磁盘中，如果你想只要内存缓存的话
      
      ```
      [[SDImageCache sharedImageCache] storeImage:myImage forKey:myCacheKey toDisk:NO];
      ```
      * 读取缓存时可以使用 queryDiskCacheForKey:done: 方法，图片缓存的 key 是唯一的，通常就是图片的 absolute URL

      ```
      SDImageCache *imageCache = [[SDImageCache alloc] initWithNamespace:@"myNamespace"];
[imageCache queryDiskCacheForKey:myCacheKey done:^(UIImage *image) {
        // image is not nil if image was found
    }];
      ```
 ***

#### [OC-GPUImage -- 做滤镜最主流的开源框架](https://github.com/BradLarson/GPUImage)

***
* GPUImage中的几个概念(output为输出源,intput为输入源,filter为滤镜)
   * #import "GPUImageBrightnessFilter.h"                //亮度
   * #import "GPUImageExposureFilter.h"                  //曝光
   * #import "GPUImageContrastFilter.h"                  //对比度
   * #import "GPUImageSaturationFilter.h"                //饱和度
   * #import "GPUImageGammaFilter.h"                     //伽马线
   * #import "GPUImageColorInvertFilter.h"               //反色
   * #import "GPUImageSepiaFilter.h"                     //褐色（怀旧）
   * #import "GPUImageLevelsFilter.h"                    //色阶
   * #import "GPUImageGrayscaleFilter.h"                 //灰度
   * #import "GPUImageHistogramFilter.h"                 //色彩直方图，显示在图片上
   * #import "GPUImageHistogramGenerator.h"              //色彩直方图
   * #import "GPUImageRGBFilter.h"                       //RGB
   * #import "GPUImageToneCurveFilter.h"                 //色调曲线
   * #import "GPUImageMonochromeFilter.h"                //单色
   * #import "GPUImageOpacityFilter.h"                   //不透明度
   * #import "GPUImageHighlightShadowFilter.h"           //提亮阴影
   * #import "GPUImageFalseColorFilter.h"                //色彩替换（替换亮部和暗部色彩）
   * #import "GPUImageHueFilter.h"                       //色度
   * #import "GPUImageChromaKeyFilter.h"                 //色度键
   * #import "GPUImageWhiteBalanceFilter.h"              //白平横
   * #import "GPUImageAverageColor.h"                    //像素平均色值
   * #import "GPUImageSolidColorGenerator.h"             //纯色
   * #import "GPUImageLuminosity.h"                      //亮度平均
   * #import "GPUImageAverageLuminanceThresholdFilter.h" //像素色值亮度平均，图像黑白（有类似漫画效果）
   * #import "GPUImageLookupFilter.h"                    //lookup 色彩调整
   * #import "GPUImageAmatorkaFilter.h"                  //Amatorka lookup
   * #import "GPUImageMissEtikateFilter.h"               //MissEtikate lookup
   * #import "GPUImageSoftEleganceFilter.h"              //SoftElegance lookup
   * #import "GPUImageCrosshairGenerator.h"              //十字
   * #import "GPUImageLineGenerator.h"                   //线条
   * #import "GPUImageTransformFilter.h"                 //形状变化
   * #import "GPUImageCropFilter.h"                      //剪裁
   * #import "GPUImageSharpenFilter.h"                   //锐化
   * #import "GPUImageUnsharpMaskFilter.h"               //反遮罩锐化
   * #import "GPUImageFastBlurFilter.h"                  //模糊
   * #import "GPUImageGaussianBlurFilter.h"              //高斯模糊
   * #import "GPUImageGaussianSelectiveBlurFilter.h"     //高斯模糊，选择部分清晰
   * #import "GPUImageBoxBlurFilter.h"                   //盒状模糊
   * #import "GPUImageTiltShiftFilter.h"                 //条纹模糊，中间清晰，上下两端模糊
   *  #import "GPUImageMedianFilter.h"                    //中间值，有种稍微模糊边缘的效果
   * #import "GPUImageBilateralFilter.h"                 //双边模糊
   * #import "GPUImageErosionFilter.h"                   //侵蚀边缘模糊，变黑白
   * #import "GPUImageRGBErosionFilter.h"                //RGB侵蚀边缘模糊，有色彩
   * #import "GPUImageDilationFilter.h"                  //扩展边缘模糊，变黑白
   * #import "GPUImageRGBDilationFilter.h"               //RGB扩展边缘模糊，有色彩
   * #import "GPUImageOpeningFilter.h"                   //黑白色调模糊
   * #import "GPUImageRGBOpeningFilter.h"                //彩色模糊
   * #import "GPUImageClosingFilter.h"                   //黑白色调模糊，暗色会被提亮
   * #import "GPUImageRGBClosingFilter.h"                //彩色模糊，暗色会被提亮
   * #import "GPUImageLanczosResamplingFilter.h"         //Lanczos重取样，模糊效果
   * #import "GPUImageNonMaximumSuppressionFilter.h"     //非最大抑制，只显示亮度最高的像素，其他为黑
   * #import "GPUImageThresholdedNonMaximumSuppressionFilter.h" //与上相比，像素丢失更多
   * #import "GPUImageSobelEdgeDetectionFilter.h"        //Sobel边缘检测算法(白边，黑内容，有点漫画的反色效果)
   * #import "GPUImageCannyEdgeDetectionFilter.h"        //Canny边缘检测算法（比上更强烈的黑白对比度）
   * #import "GPUImageThresholdEdgeDetectionFilter.h"    //阈值边缘检测（效果与上差别不大）
   * #import "GPUImagePrewittEdgeDetectionFilter.h"      //普瑞维特(Prewitt)边缘检测(效果与Sobel差不多，貌似更平滑)
   * #import "GPUImageXYDerivativeFilter.h"              //XYDerivative边缘检测，画面以蓝色为主，绿色为边缘，带彩色
   * #import "GPUImageHarrisCornerDetectionFilter.h"     //Harris角点检测，会有绿色小十字显示在图片角点处
   * #import "GPUImageNobleCornerDetectionFilter.h"      //Noble角点检测，检测点更多
   * #import "GPUImageShiTomasiFeatureDetectionFilter.h" //ShiTomasi角点检测，与上差别不大
   * #import "GPUImageMotionDetector.h"                  //动作检测
   * #import "GPUImageHoughTransformLineDetector.h"      //线条检测
   * #import "GPUImageParallelCoordinateLineTransformFilter.h" //平行线检测
   * #import "GPUImageLocalBinaryPatternFilter.h"        //图像黑白化，并有大量噪点
   * #import "GPUImageLowPassFilter.h"                   //用于图像加亮
   * #import "GPUImageHighPassFilter.h"                  //图像低于某值时显示为黑
   * #import "GPUImageSketchFilter.h"                    //素描
   * #import "GPUImageThresholdSketchFilter.h"           //阀值素描，形成有噪点的素描
   * #import "GPUImageToonFilter.h"                      //卡通效果（黑色粗线描边）
   * #import "GPUImageSmoothToonFilter.h"                //相比上面的效果更细腻，上面是粗旷的画风
   * #import "GPUImageKuwaharaFilter.h"                  //桑原(Kuwahara)滤波,水粉画的模糊效果；处理时间比较长，慎用
   * #import "GPUImageMosaicFilter.h"                    //黑白马赛克
   * #import "GPUImagePixellateFilter.h"                 //像素化
   * #import "GPUImagePolarPixellateFilter.h"            //同心圆像素化
   * #import "GPUImageCrosshatchFilter.h"                //交叉线阴影，形成黑白网状画面
   * #import "GPUImageColorPackingFilter.h"              //色彩丢失，模糊（类似监控摄像效果）
   * #import "GPUImageVignetteFilter.h"                  //晕影，形成黑色圆形边缘，突出中间图像的效果
   * #import "GPUImageSwirlFilter.h"                     //漩涡，中间形成卷曲的画面
   * #import "GPUImageBulgeDistortionFilter.h"           //凸起失真，鱼眼效果
   * #import "GPUImagePinchDistortionFilter.h"           //收缩失真，凹面镜
   * #import "GPUImageStretchDistortionFilter.h"         //伸展失真，哈哈镜
   * #import "GPUImageGlassSphereFilter.h"               //水晶球效果
   * #import "GPUImageSphereRefractionFilter.h"          //球形折射，图形倒立
   * #import "GPUImagePosterizeFilter.h"                 //色调分离，形成噪点效果
   * #import "GPUImageCGAColorspaceFilter.h"             //CGA色彩滤镜，形成黑、浅蓝、紫色块的画面
   * #import "GPUImagePerlinNoiseFilter.h"               //柏林噪点，花边噪点
   * #import "GPUImage3x3ConvolutionFilter.h"            //3x3卷积，高亮大色块变黑，加亮边缘、线条等
   * #import "GPUImageEmbossFilter.h"                    //浮雕效果，带有点3d的感觉
   * #import "GPUImagePolkaDotFilter.h"                  //像素圆点花样
   * #import "GPUImageHalftoneFilter.h"                  //点染,图像黑白化，由黑点构成原图的大致图形
   * #import "GPUImageMultiplyBlendFilter.h"             //通常用于创建阴影和深度效果
   * #import "GPUImageNormalBlendFilter.h"               //正常
   * #import "GPUImageAlphaBlendFilter.h"                //透明混合,通常用于在背景上应用前景的透明度
   * #import "GPUImageDissolveBlendFilter.h"             //溶解
   * #import "GPUImageOverlayBlendFilter.h"              //叠加,通常用于创建阴影效果
   * #import "GPUImageDarkenBlendFilter.h"               //加深混合,通常用于重叠类型
   * #import "GPUImageLightenBlendFilter.h"              //减淡混合,通常用于重叠类型
   * #import "GPUImageSourceOverBlendFilter.h"           //源混合
   * #import "GPUImageColorBurnBlendFilter.h"            //色彩加深混合
   * #import "GPUImageColorDodgeBlendFilter.h"           //色彩减淡混合
   * #import "GPUImageScreenBlendFilter.h"               //屏幕包裹,通常用于创建亮点和镜头眩光
   * #import "GPUImageExclusionBlendFilter.h"            //排除混合
   * #import "GPUImageDifferenceBlendFilter.h"           //差异混合,通常用于创建更多变动的颜色
   * #import "GPUImageSubtractBlendFilter.h"             //差值混合,通常用于创建两个图像之间的动画变暗模糊效果
   * #import "GPUImageHardLightBlendFilter.h"            //强光混合,通常用于创建阴影效果
   * #import "GPUImageSoftLightBlendFilter.h"            //柔光混合
   * #import "GPUImageChromaKeyBlendFilter.h"            //色度键混合
   * #import "GPUImageMaskFilter.h"                      //遮罩混合
   * #import "GPUImageHazeFilter.h"                      //朦胧加暗
   * #import "GPUImageLuminanceThresholdFilter.h"        //亮度阈
   * #import "GPUImageAdaptiveThresholdFilter.h"         //自适应阈值
   * #import "GPUImageAddBlendFilter.h"                  //通常用于创建两个图像之间的动画变亮模糊效果
   * #import "GPUImageDivideBlendFilter.h"               //通常用于创建两个图像之间的动画变暗模糊效果
   * #import "c.h"
   * #import "GPUImageVoroniConsumerFilter.h"

***

#### [Swift-GPUImage](https://github.com/BradLarson/GPUImage2)

#### [Masonry -- 自动约束](https://github.com/SnapKit/Masonry)
##### 采用链式编程的方法
***
* mas_makeConstraints()    添加约束
* mas_remakeConstraints()  移除之前的约束，重新添加新的约束（ __调用此方法的时候，使用了如下API__）
   * - (void)setNeedsLayout  标记为需要重新布局
   * - (void)layoutIfNeeded  查看当前视图是否被标记需要重新布局，有则在内部调用layoutSubviews方法进行重新布局
   * - (void)layoutSubviews  重写当前方法，在内部完成重新布局操作

   
* mas_updateConstraints()  更新约束（ __调用此方法时所使用到的API如下__ ）
   * - (void)updateConstraintsIfNeeded  调用此方法，如果有标记为需要重新布局的约束，则立即进行重新布局，内部会调用updateConstraints方法
   * - (void)updateConstraints          重写此方法，内部实现自定义布局过程
   * - (BOOL)needsUpdateConstraints     当前是否需要重新布局，内部会判断当前有没有被标记的约束
   * - (void)setNeedsUpdateConstraints  标记需要进行重新布局

***
##### 注：在使用Masonry添加约束的时候，一定要在addSubview之后再使用，要不然会引起程序的崩溃现象

####[RestKit -- 注重从远程数据请求到本地数据解析的存储和流程化业务处理，它专注于RESTful API，如果你项目服务器不是RESTful，那就别考虑了](https://github.com/RestKit/RestKit)
* 解析json和映射对象
* Network :RestKit现在使用AFNetworking v1.3.3作为网络操作层，RestKit的维护者正在升级到AFNetworking 2.0
* Object Mapping(对象映射): RestKit提供一个接口来直接映射服务器返回的json/xml数据
* Core Data:RestKit对coreData提供了额外的支持，包括映射远程对象为coreData对象并且进行本地存储

***
* RKObjectManager是和RESTful services交互的核心,需要一个AFHTTPClient实例来进行初始化。

* RKObjectMapping是用来配置JSON和本地model的映射信息，如果json和本地的model中都有name这个字段，你又需要解析这个字段，那么就要通过addAttributeMappingsFromArray进行添加。

* RKResponseDescriptor描述了对HTTP返回数据的映射信息。pathPattern 就是api的具体路径，会被添加到baseURL后面。keyPath 是对象在json数据中的路径。看看上面的json数据,@“response.venues”说明了对象venue所处的逻辑位置，并告诉RestKit去哪找venue。

***



#### [YYKit](https://github.com/ibireme/YYKit)

* [YYModel — 高性能的 iOS JSON 模型框架。](https://github.com/ibireme/YYModel)
* [YYCache — 高性能的 iOS 缓存框架。](https://github.com/ibireme/YYCache)
* [YYImage — 功能强大的 iOS 图像框架。](https://github.com/ibireme/YYImage)
* [YYWebImage — 高性能的 iOS 异步图像加载框架。](https://github.com/ibireme/YYWebImage)
* [YYText — 功能强大的 iOS 富文本框架。](https://github.com/ibireme/YYText)
* [YYKeyboardManager — iOS 键盘监听管理工具。](https://github.com/ibireme/YYKeyboardManager)
* [YYDispatchQueuePool — iOS 全局并发队列管理工具。](https://github.com/ibireme/YYDispatchQueuePool)
* [YYAsyncLayer — iOS 异步绘制与显示的工具。](https://github.com/ibireme/YYAsyncLayer)
* [YYCategories — 功能丰富的 Category 类型工具库。](https://github.com/ibireme/YYCategories)

#### [FMDB -- 数据库](https://github.com/ccgus/fmdb)
__对libsqlite3库的封装__

#### [RESideMenu -- 侧滑栏](https://github.com/romaonthego/RESideMenu)

#### [UITableView - FDTemplateLayoutCell -- 缓存cell高度-自适应](https://github.com/forkingdog/UITableView-FDTemplateLayoutCell)
__可与Masonry搭配使用__

#### [IQKeyBoardManager -- 自定义键盘](https://github.com/hackiftekhar/IQKeyboardManager)

#### [WMPageController -- 自定义滚动菜单栏](https://github.com/wangmchn/WMPageController)

#### [LemonBubble -- 自定义弹框样式](https://github.com/LemonITCN/LemonBubble)

#### [MJRefresh -- 刷新加载](https://github.com/CoderMJLee/MJRefresh)

### JSON
* MJExtension
* JSONModel
* YYModel


### XML
* Ono
* GDataXML
* XMLDictionary
* hpple
* KissXML

## 工具
### IDE
* Xcode
* Appcode

### Xcode插件
* AMMethod2Implement
* Alcatraz
* ClangFormat
* Auto-Importer
* CocoaPods
* ESJsonFormat
* FuzzyAutocimplete
* KSHObjcUML
* KSImageNamed
* OMColorSense
* RTImageAssets
* SCXcodeSwitchExpander
* VVDocumenter-Xcode
* Lin
* XAlign
* HOStringSense
* XToDo
* XcodeBoost
* BBUDebuggerTuckAway
* InjectionPlugin

### 调试工具
* 界面
   * Reveal
   * Xcode内置的View Debugging
* 网络
   * WireShark
   * Charles
   * Network Link Condidtioner
   * HTTPScoop
   * PonyDebugger

### 数据分析工具
* 数据库
   * SQLiteBrowser
   * Navicat
   * Datum
* JSON
   * Jason
   * VisualJson
   * json.cn

### 文档工具
* Dash
* Xcode内置的Documentation And API Reference

### 应用程序图标
* APPIcon
* IconKit
* Image 2 Icon Tool

### 界面原型
* Sketch
* 墨刀
* Briefs
* Axure RP

### 性能分析
* Instruments
   * Allocations
   * Network
   * Leaks
   * Time Profiler
   * Zombie

### 包管理工具
* CocoaPods
* Carthage
* Swift Package Manager

### 版本控制
* Git
   * SourceTree
   * Github Desktop
   * GitUp 
* Mercurial
* SVN
   * CornerStone

### 编辑工具
* Markdown
   * MacDown
   * Haroopad
   * Typora
   * MWeb
* 文本编辑器
   * Atom
   * Sublime Text
   * Visual Studio Code

### 翻墙工具
* Lantern
* Shadowsocks
* GoAgentX
* Surge

### 辅助工具
* Unarchiver
* 截图工具
   * GIFBrewery
   * Snip
   * LICEcap
* 图片处理
   * PhotoShop
   * PixeImator
* Sip
* XScope
* 思维导图
   * MindNode
   * Xmind
* 马克鳗
* 文本比较
   * DiffMerge
   * Beyond Compare
* ImageOptim
* Deploymate
* FauxPas
* 0xED
* UML/在线UML
### 命令行工具
* xcodebuild
* xcode-select
* brew
* xctool
* fastlane
* git-flow
* tree

## 第三方服务
### BasS(后端即服务)
* LeanCloud
* Bomb
* 七牛
* 环信
* 融云
* 友盟
* CloudKit
* 极光推送
* Flurry
* Google Analytics
* MTA
* App Annie

### 崩溃收集
* Crashlytics
* Bugly
* BugHD

### 内测分发
* 蒲公英
* FIR
* TestFlight

## 持续集成
* Travis CI
* Circle CI
* Coveralls
* Codecov
* Fastlane(自动化发布流程)

## 编程语言
* C/C++
* Objective-C
* Swift
* HTML5
* JavaScript

## 操作系统
* macOS
* ios
* WatchOS
* TV OS
* Linus常用命令

## 开发基础
### Objective-C
* Block
* 类的设计
   * Self
   * 属性
   * 组合
   * 重写
   * 继承
   * 多态
   * Category
   * Extension
   * Protocol
   * Class
   * SEL
* 文件管理
* 内存管理
   * MRC
   * ARC
* 数据持久化
   * XML
   * Plist
   * 归档
   * CoreData & SQLite
   * JSON
* KVC&KVO
* Foundation


### Swift
* 基本运算符
* 字符串和字符
* 集合类型
* 控制流
* 函数
* 闭包
* 枚举
* 类和结构体
* 属性
* 方法
* 下标脚本
* 继承
* 构造过程
* 析构过程
* 自动引用计数
* 可空链式调用
* 错误处理
* 类型转换
* 嵌套类型
* 扩展
* 协议
* 泛型
* 访问控制


### UI
* UIResponder
   * UIApplication
   * UIView
      * MapKit
         * MKAnnotationView
         * MKMapView
         * MKOverlayView
         * MPVolumeView
      * UIKit
         * UIActionSheet
         * UIAlertView
         * UIActivityInndicatorView
         * UIControl
            * UIDatePicker
            * UIButton
            * UIPageControl
            * UIRefreshControl
            * UISegmentedControl
            * UISlider
            * UIStepper
            * UISwitch
            * UITextField
         * UIInputView
         * UIImageView
         * UILabel
         * UINavigationBar
         * UIPopoverBackgroundView
         * UIPickerView
         * UIProgressView
         * UIScrollView
            * UICollectionView
            * UITableView
            * UITextView -- UITextField
         * UISearchBar
         * UIStackView
         * UITabBar
         * UITableViewCell
         * UITableViewHeaderFooterView
         * UIToolBar
         * UIWebView
         * UIVisualEffectView
         * UIWindow
      * WebKit - WKWebView
   * UIViewController
      * AddressBookUI
         * ABNewPersonViewController
         * ABPersonViewController
         * ABUnknownPersonViewController
      * UIKit
         * UIActivityViewController
         * UIAlertController
         * UICollectionViewController
         * UISearchContainerViewController
         * UIInputViewController
         * UINavigationController -- UIImagePickerController
         * UIPageViewController
         * UISearchController
         * UISplitViewController
         * UITabBarController
         * UIPopoverController(非继承)
         * UITableViewController
         * UISearchDisplayController (非继承)
         * UIMenuController (非继承)
      * AVKit
         * AVPlayerViewController
         * AVPictureInPictureController (非继承)
* Storyboard & Xib
   * Auto Layout
      * SnapKit
      * Masonry
   * Size Classes
* Core Graphics
* Core Animation
* 手势识别
   * UIPanGestureRecognizer -- 平移/慢速移动手势
   * UILongPressGestureRecognizer -- 长按手势
   * UIPinchGestureRecognizer -- 捏合手势
   * UIRotationGestureRecognizer -- 旋转手势
   * UITapGestureRecognizer  -- 点击手势
   * UISwipGestureRecognizer  -- 滑动/移动手势

```
#import "FourthViewController.h"

@interface FourthViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong)UIImageView * imageView;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"发现" TitleColor:Color_white];
    
    self.imageView = insertAutoImage(self.view, Img_Name(@"gep"), Color_clear);
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
        make.top.equalTo(self.view.mas_top).offset(60);
    }];
    
    //允许和用户之间进行交互
    self.imageView.userInteractionEnabled = YES;
    //添加手势
    //1.旋转手势
    UIRotationGestureRecognizer * gestureOne = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(gestureClick:)];
    gestureOne.delegate = self;
    [self.imageView addGestureRecognizer:gestureOne];
    
    //2.捏合手势
    UIPinchGestureRecognizer * gestureTwo = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(gestureTwoClick:)];
    gestureTwo.delegate = self;
    [self.imageView addGestureRecognizer:gestureTwo];
    
    //3.滑动手势
    UISwipeGestureRecognizer * gestureThree1 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureThreeClick:)];
    gestureThree1.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:gestureThree1];
    
    UISwipeGestureRecognizer * gestureThree2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureThreeClick:)];
    gestureThree2.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:gestureThree2];
    
    //4.点击手势
    UITapGestureRecognizer * gestureFour = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureFourClick:)];
    gestureFour.numberOfTapsRequired = 1;//点击次数
    [self.imageView addGestureRecognizer:gestureFour];
    
    //5.长按手势
    UILongPressGestureRecognizer * gestureFif = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(gestureFifClick:)];
    gestureFif.minimumPressDuration = 1;//长按时间
    [self.view addGestureRecognizer:gestureFif];
    
}
#pragma mark - 旋转手势 -
- (void)gestureClick:(UIRotationGestureRecognizer *)sender {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    sender.rotation = 0;//每次旋转完后清0，防止叠加
}
#pragma mark - 捏合手势 -
- (void)gestureTwoClick:(UIPinchGestureRecognizer *)sender {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    sender.scale = 1;
}
#pragma mark - 滑动手势 -
- (void)gestureThreeClick:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        self.imageView.center = CGPointMake(SCREEN_WIDTH/2+20, SCREEN_HEIGHT/2);
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.imageView.center = CGPointMake(SCREEN_WIDTH/2-20, SCREEN_HEIGHT/2);
    }
}
#pragma mark - 点击手势 -
- (void)gestureFourClick:(UITapGestureRecognizer *)sender {
    //点击放大/缩小图片
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.top.equalTo(self.view.mas_top).offset(10);
    }];
}
#pragma mark - 长按手势 -
- (void)gestureFifClick:(UILongPressGestureRecognizer *)sender {
    //获取长按的位置在屏幕上对应的点
    CGPoint point  = [sender locationInView:self.view];
    self.imageView.center = point;
}
//返回YES表示同时支持识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
    
}
@end
```

### 网络
* Socket
   * CocoaAsyncSocket
   * WebSocket -- SocketRocket
* 网络协议
   * TCP
   * UDP
   * HTTP
   * HTTPS
* NSURLSession
* NSURLConnection
* CFNetwork
* NSSream
### 多线程
* pThread
* NSThread
* GCD
   * 同步
   * 异步
   * 串行
   * 并发
* NSTunLoop
* NSOperationQueue


### 测试
* 断点调试
* LLDB
* GDB
* NSZombieEnabled
* Instruments
* Unit Tests
* UI Tests


### 数据存储
* Plist -- NSUserDefaults
* NSCoder
* SQLite -- CoreData
   * 特点
      * 1.是基于c语言开发的数据库
      * 2.用c语言对数据库执行操作，访问。
      * 3.sqlite是动态的数据库类型，即存储的时候是一种类型，使用的时候可以存储为其他类型。
      * 4.建立连接之后可以不关闭连接
* Realm
* KeyChain

## Frameworks
### 常用框架
* 音视频
   * AudioToolbox
   * AVFoundation
   * AVKit
   * CoreAudio
   * CoreAudioKit
   * MediaPlayer
* 定位地图
   * CoreLocation
   * MapKit
* 网页
   * WebKit
   * JavaScript Core
      * WebViewJavaScriptBridge
      * Wax
      * JSPatch
* 通讯录
   * AddressBook
   * AddressBookUI
* 相册
   * AssetsLibrary
* 数据存储
   * CoreData
   * CloudKit
* 图文混排
   * CoreText
* 本地验证
   * LocalAuthentication
* 支付
   * StoreKit
   * PassKit

   
### 高级框架
* 智能家居
   * Home Kit
* 健康
   * Health Kit
* 广告
   * AdSupport
   * iAd
* 硬件开发
   * MutilpeerConnectivity
   * CoreBluetooth
   * CoreMotion
* 游戏开发
   * GameKit
   * SpriteKit
* 绘图
   * CoreGrapthics(2D)
   * QuartzCore
   * SceneKit(3D)
   * Metal

## 开发进阶
### Runtime
### 对象模型
### 逆向与安全
* 转码技术
   * URL Encode
   * Base64 Encode
* 密码技术
   * 对称密码
      * DES/3DES
      * AES
   * 公钥密码
      * RSA
   * 单向散列函数
      * MD5
      * SHA
         * SHA-1
         * SHA-224
         * SHA-256
         * SHA-384
         * SHA-512
      * HMAC
      * PBKDF2

### Hybrid
* PhoneGap
* React Native
* ionic


### 打包与封装
* App Thinning
* 动态库 .dylib
* 框架 .framework
* 静态库 .a
* 资源包 .bundle


## 设计模式
### 面向对象三要素
* 封装
* 继承
* 多态


### 面向对象七原则
* L:里式替换原则
* S:单一职责原则
* I:接口隔离原则
* O:开放封闭原则
* D:依赖倒置原则
* 迪米特法则 -- 最少知道原则
* 合成聚合复用原则


### 23种设计模式(四人帮)
* 创建型模式
   * 工厂模式(Factory Pattern)
   * 抽象工厂模式(Abstract Factory Pattern)
   * 单例模式(Singleton Pattern)
   * 建造者模式(Builder Pattern)
   * 原型模式(Prototype Pattern)
* 结构型模式
   * 适配器模式(Adapter Pattern)
   * 桥接模式(Bridge Pattern)
   * 组合模式(Composite Pattern)
   * 过滤器模式(Filter、Criteria Pattern)
   * 装饰器模式(Decorator Pattern)
   * 外观模式(Facade Pattern)
   * 享元模式(Flyweight Pattern)
   * 代理模式(Proxy Pattern)
* 行为型模式
   * 责任链模式(Chain of Responsibility Pattern)
   * 命令模式(Command Pattern)
   * 解释器模式(Interpreter Pattern)
   * 迭代器模式(Iterator Pattern)
   * 中介者模式(Mediator Pattern)
   * 备忘录模式(Memento Pattern)
   * 观察者模式(Observer Pattern)
   * 空对象模式(Null Object Pattern)
   * 状态模式(State Pattern)
   * 策略模式(Strategy Pattern)
   * 模板模式(Template Pattern)
   * 访问者模式(Visitor Pattern)

   
## 架构模式
* MVC
* MVVM
* MVP
 
## 算法

### 多线程与锁
* 锁
   * OSSptionLock
      * 自旋锁
      * 循环等待询问，不释放当前资源
      * 用于轻量级的数据访问，简单的int值操作
   * dispath_semaphore
   * pthread_mutex
   * 细粒度 NSLock
   * pthread_mutex(recursive)
   * NSRecursiveLock
   * @synchronized (一般在创建单例对象的时候使用)
*  atomic
   * 可修饰关键字
   * 对被修饰的关键字进行原子操作（不负责使用）