//
//  MWViewController.m
//  socketio_test
//
//  Created by Ivan Ornes on 08/08/13.
//  Copyright (c) 2013 Ororock. All rights reserved.
//

#import "MWViewController.h"
#import "SocketIOPacket.h"
#import "JSONKit.h"

@interface MWViewController ()

@end

@implementation MWViewController
@synthesize textField = _textField;
@synthesize label = _label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    socketIO = [[SocketIO alloc] initWithDelegate:self];
    [socketIO connectToHost:@"localhost" onPort:3000];
    [socketIO sendEvent:@"my other event" withData:@"Hola"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet{
    NSLog(@"recivido: %@",[packet data]);
    
    //JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *data = [packet dataAsJSON];
    _label.text = [data valueForKey:@"received"];
}

- (void) socketIODidConnect:(SocketIO *)socket{
    NSLog(@"Did connect");
}
/*- (void) socketIODidConnect:(SocketIO *)socket;
- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error;
- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet;
- (void) socketIO:(SocketIO *)socket didReceiveJSON:(SocketIOPacket *)packet;
- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet;
- (void) socketIO:(SocketIO *)socket didSendMessage:(SocketIOPacket *)packet;
- (void) socketIO:(SocketIO *)socket onError:(NSError *)error;*/

- (IBAction)sendAction:(id)sender {
    if (socketIO) {
       [socketIO sendEvent:@"emit" withData:[NSString stringWithFormat:@"['text':'%@']",_textField.text]];
    }
}
@end
