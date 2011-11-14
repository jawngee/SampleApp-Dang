//
//  PFNNote.m
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/11/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "PFNNote.h"
#import "NSString+UUID.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMResultSet.h"

#pragma mark - Private methods

/** Private methods */
@interface PFNNote(Private)

/** Initializes the object with a database result */
-(id)initWithResult:(FMResultSet *)result;

@end

#pragma mark - Implementation

@implementation PFNNote

@synthesize uuid, title, body, date;


#pragma mark - Init/Dealloc

-(id)initWithResult:(FMResultSet *)result
{
    self=[super init];
    
    if (self)
    {
        // This will automatically assign the values from the sqlite
        // database record to the properties of this object the KVC
        [result kvcMagic:self];
    }
    
    return self;
}

-(id)initWithBody:(NSString *)noteBody
{
    self=[super init];
    
    if (self)
    {
        // Assign the unique identifier
        self.uuid=[NSString UUID];
        
        // Assign the body
        self.body=noteBody;
        
        // Create the title by grabbing the first 48 characters,
        // or the body itself if it is shorter in length
        self.title=[noteBody substringToIndex:MIN(48,[noteBody length])];
        
        // Set the date the note was created
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        self.date=[dateFormat stringFromDate:[NSDate date]];
    }
    
    return self;
}

-(void)dealloc
{
    [uuid release];
    [body release];
    [title release];
    [date release];
    
    [super dealloc];
}

#pragma mark - Save/Update/Delete

-(BOOL)save
{
    // fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // Perform the insert
    BOOL result=[db executeUpdate:@"insert into note (uuid,title,body,date) values (?,?,?,?)",uuid,title,body,date];
    
    // Check for error
    if (!result)
        NSLog(@"DB ERROR: %@",[db lastErrorMessage]);
    
    return result;
}

-(BOOL)update
{
    // fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // perform the update
    BOOL result=[db executeUpdate:@"update note set title=?, body=?, date=? where uuid=?",title,body,date,uuid];
    
    // check for error
    if (!result)
        NSLog(@"DB ERROR: %@",[db lastErrorMessage]);
    
    return result;
}

-(BOOL)remove
{
    // fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // perform the update
    BOOL result=[db executeUpdate:@"delete from note where uuid=?",uuid];
    
    // check for error
    if (!result)
        NSLog(@"DB ERROR: %@",[db lastErrorMessage]);
    
    return result;
}

#pragma mark - Find


+(NSDictionary *)all
{
    // We return a dictionary of arrays.  Each array contains note and is
    // keyed in the dictionary based on the date
    NSMutableDictionary *notes=[NSMutableDictionary dictionary];
    
    // Fetch the unique list of dates
    NSArray *dates=[PFNNote dates];
    
    // Fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // Loop through the dates
    for(NSString *date in dates)
    {
        NSMutableArray *groupedNotes=[NSMutableArray array];
        
        // Select notes with a matching date
        FMResultSet *results=[db executeQuery:@"select * from note where date=?",date];
        while([results next])
        {
            PFNNote *note=[[[PFNNote alloc] initWithResult:results] autorelease];
            [groupedNotes addObject:note];
        }
        
        [notes setObject:groupedNotes forKey:date];
    }
    
    return notes;
}

+(NSMutableDictionary *)find:(NSString *)searchTerm
{
    // We return a dictionary of arrays.  Each array contains note and is
    // keyed in the dictionary based on the date
    NSMutableDictionary *notes=[NSMutableDictionary dictionary];
    
    // Fetch the unique list of dates
    NSArray *dates=[PFNNote dates];
    
    // Fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // Loop through the dates
    for(NSString *date in dates)
    {
        NSMutableArray *groupedNotes=[NSMutableArray array];
        
        // Select the notes matching the date and containing the search term
        FMResultSet *results=[db executeQuery:@"select * from note where date=? and body like ?",date,[NSString stringWithFormat:@"%%%@%%",searchTerm]];
        while([results next])
        {
            PFNNote *note=[[[PFNNote alloc] initWithResult:results] autorelease];
            [groupedNotes addObject:note];
        }
        
        [notes setObject:groupedNotes forKey:date];
    }
    
    return notes;
}

+(NSArray *)dates
{
    NSMutableArray *dates=[NSMutableArray array];
    
    // Fetch the database
    FMDatabase *db=[FMDatabase databaseFor:@"notes"];
    
    // Select only unique dates from the database
    FMResultSet *results=[db executeQuery:@"select distinct date from note order by date desc"];

    // Loop through the results and add it to the array
    while([results next])
        [dates addObject:[results stringForColumn:@"date"]];
    
    return dates;
}

@end
