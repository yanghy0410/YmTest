//
//  YMAudioViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/10.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "YMAudioViewController.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface YMAudioViewController ()
//音乐名
@property (weak, nonatomic)  UILabel *musicName;
//演唱者
@property (weak, nonatomic)  UILabel *artist;
//音乐图片
@property (weak, nonatomic)  UIImageView *musicIcon;
//当前播放时间
@property (weak, nonatomic)  UILabel *currentTime;
//音乐时常
@property (weak, nonatomic)  UILabel *duration;

@property (weak, nonatomic)  UIButton *playBtn;
//缓冲进度条
@property (weak, nonatomic)  UIProgressView *loadTimeProgress;
//播放进度滑块
@property (weak, nonatomic)  UISlider *playSlider;
//播放器
@property(nonatomic,strong) AVPlayer *player;

//当前播放音乐的索引



//当前歌曲进度监听者
@property(nonatomic,strong) id timeObserver;
@end

@implementation YMAudioViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *deleteBtn = [[UIButton alloc]init];
    [deleteBtn setTitle:@"play" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(yhy) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.frame=CGRectMake(100, 200, 200, 50);
    [self.view addSubview:deleteBtn];
    
    self.playBtn=deleteBtn;
  
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
}

-(void)yhy{
    [self playBtnAction:self.playBtn];
}

#pragma mark- 音乐播放相关
//播放音乐
-(void)playWithUrl
{
   AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:@"http://ls.qingting.fm/live/1133/24k.m3u8"]];
    //替换当前音乐资源
    [self.player replaceCurrentItemWithPlayerItem:item];
 
    
    //开始播放
    [self.player play];
    
    
    //音乐锁屏信息展示
    [self setupLockScreenInfo];
    
}


#pragma mark - 设置锁屏信息

//音乐锁屏信息展示
- (void)setupLockScreenInfo
{
    // 1.获取锁屏中心
    MPNowPlayingInfoCenter *playingInfoCenter = [MPNowPlayingInfoCenter defaultCenter];
    
    //初始化一个存放音乐信息的字典
    NSMutableDictionary *playingInfoDict = [NSMutableDictionary dictionary];
    // 2、设置歌曲名
   
        [playingInfoDict setObject:@"小虾米💐💐" forKey:MPMediaItemPropertyAlbumTitle];
  
    // 设置歌手名
        [playingInfoDict setObject:@"😏😏😏" forKey:MPMediaItemPropertyArtist];
    // 3设置封面的图片
    UIImage *image = [UIImage imageNamed:@"timg.jpeg"];
    if (image) {
        MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
        [playingInfoDict setObject:artwork forKey:MPMediaItemPropertyArtwork];
    }
    
    // 4设置歌曲的总时长
    [playingInfoDict setObject:[NSNumber numberWithDouble:60*60*2] forKey:MPMediaItemPropertyPlaybackDuration];
    
    //音乐信息赋值给获取锁屏中心的nowPlayingInfo属性
    playingInfoCenter.nowPlayingInfo = playingInfoDict;
    
    // 5.开启远程交互
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}



//监听远程交互方法
- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    
    switch (event.subtype) {
            //播放
        case UIEventSubtypeRemoteControlPlay:{
            [self.player play];
        }
            break;
            //停止
        case UIEventSubtypeRemoteControlPause:{
            [self.player pause];
        }
            break;
            //下一首
        case UIEventSubtypeRemoteControlNextTrack:
            break;
            //上一首
        case UIEventSubtypeRemoteControlPreviousTrack:
            break;
            
        default:
            break;
    }
}




#pragma mark - action


//播放
- (void)playBtnAction:(UIButton *)sender
{
    if (!sender.selected) {
        [self playWithUrl];
        sender.selected = YES;
    }else{
        [self.player pause];
        sender.selected = NO;
    }
    
}

-(AVPlayer *)player
{
    if (_player == nil) {
        //初始化_player
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:@""]];
        _player = [[AVPlayer alloc] initWithPlayerItem:item];
    }
    
    return _player;
}

@end

