//
//  ViewController.m
//  Plankton App
//
//  Created by Brandon Plank on 5/25/20.
//  Copyright © 2020 Brandon Plank. All rights reserved.
//

#import "ViewController.h"
#include <libplankton/libplankton.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)respring:(id)sender {
    int pid = getPidOfProc("backboardd");//Gets the pid of the process name.
    int port = getPort(pid);//Gets the port of the pid.
    printf("[i] Pid %d, Task port 0x%d\n", pid, port);//Prints info.
    listreg(port, 1);//Lists the registers of the port of thread 1.
    suspend(port);//Suspends thr port.
    regset("pc", 0x41414141, port, 1);//Crash backboardd.
    listreg(port, 1);//Lists the registers again to see changes.
    resume(port);//Resumes the process, causing backbordd to crash from having an invalid program counter.
}



@end
