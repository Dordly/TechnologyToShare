# IOS知识点汇总
## 第三方开源项目
### 响应式编程
* ReactiveCocoa
* RxSwift

### AFNetworking
### SDWebImage
### GPUImage
### Masonry
### RestKit
### YYKit
### FMDB
### RESideMenu
### UITableView - FDTemplateLayoutCell
### IQKeyBoardManager
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