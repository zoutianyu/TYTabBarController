//
//  AppDelegate.m
//  TYTabBarController
//
//  Created by zou tianyu on 15/1/30.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import "AppDelegate.h"
#import "TYTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  TYTabBarController *tabBarController = [[TYTabBarController alloc] init];
  
  UIStoryboard *firstSB = [UIStoryboard storyboardWithName:@"FirstSB" bundle:nil];
  UIStoryboard *secondSB = [UIStoryboard storyboardWithName:@"SecondSB" bundle:nil];
  UIStoryboard *thirdSB = [UIStoryboard storyboardWithName:@"ThirdSB" bundle:nil];
  
  FirstViewController *firstVC = [firstSB instantiateInitialViewController];
  SecondViewController *secondVC = [secondSB instantiateInitialViewController];
  ThirdViewController *thirdVC = [thirdSB instantiateInitialViewController];
  
  firstVC.tyTabBarItem = [self createTabBarItem:@"First" normalImage:@"icon_tab1_nor" selectedImage:@"icon_tab1_sel"];
  secondVC.tyTabBarItem = [self createTabBarItem:@"Second" normalImage:@"icon_tab2_nor" selectedImage:@"icon_tab2_sel"];
  thirdVC.tyTabBarItem = [self createTabBarItem:@"Third" normalImage:@"icon_tab3_nor" selectedImage:@"icon_tab3_sel"];
  
  tabBarController.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC,thirdVC, nil];
  [tabBarController setDefaultSelectedIndex:0];
  
  //If you want to costom tabBar's backgroundColor or backgroundImage uncomment under codes
//  tabBarController.tabBarBackgroundColor = [UIColor greenColor];
//  tabBarController.tabBarBackgroundImage = [UIImage imageNamed:@"XXXX"];
  
  
  self.window.rootViewController = tabBarController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (TYTabBarItem *) createTabBarItem:(NSString *)strTitle normalImage:(NSString *)strNormalImg selectedImage:(NSString *)strSelectedImg {
  TYTabBarItem *item = [[TYTabBarItem alloc] init];
  item.normalImage = [UIImage imageNamed:strNormalImg];
  item.selectedImage = [UIImage imageNamed:strSelectedImg];
  item.title = strTitle;
  item.normalTitleColor = RGBCOLOR(145, 137, 129);
  item.selectedTitleColor = RGBCOLOR(230, 47, 23);
  return item;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
