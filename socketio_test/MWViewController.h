//
//  MWViewController.h
//  socketio_test
//
//  Created by Ivan Ornes on 08/08/13.
//  Copyright (c) 2013 Ororock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface MWViewController : UIViewController<SocketIODelegate>{
    SocketIO *socketIO;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
