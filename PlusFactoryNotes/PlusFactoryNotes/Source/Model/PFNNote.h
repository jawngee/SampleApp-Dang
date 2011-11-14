//
//  PFNNote.h
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/11/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Represents a note */
@interface PFNNote : NSObject {
    NSString *title;    /** Title of the note */
    NSString *body;     /** Body of the note */
    NSString *uuid;     /** The unique identifier for the note */
    NSString *date;     /** Date note was created */
}

/** Title of the note */
@property (copy, nonatomic) NSString *title;

/** Body of the note */
@property (copy, nonatomic) NSString *body;

/** The unique identifier for the note */
@property (copy, nonatomic) NSString *uuid;

/** Date note was created */
@property (copy, nonatomic) NSString *date;

/** Initialize the note with a body */
-(id)initWithBody:(NSString *)noteBody;

/** Save the note to the store */
-(BOOL)save;

/** Update the note */
-(BOOL)update;

/** Remove the note */
-(BOOL)remove;

/** Return an array containing all of the notes */
+(NSDictionary *)all;

/** Return an array of all notes containing the text */
+(NSDictionary *)find:(NSString *)searchTerm;

/** Returns a unique list of dates */
+(NSArray *)dates;

@end
