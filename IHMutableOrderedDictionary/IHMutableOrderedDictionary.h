//
//  IHOrderedDictionary.h
//  IHMutableOrderedDictionary
//
//  Created by ilja on 05.11.12.
//  Copyright (c) 2012 iwascoding GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IHMutableOrderedDictionary : NSObject <NSFastEnumeration>

@property (strong) NSMutableDictionary	*dictionary;
@property (strong) NSMutableOrderedSet	*keyset;


- (void)setObject:(id)anObject forKey:(id)aKey;
- (NSUInteger) count;
- (id)objectForKey:(id)aKey;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
- (id)objectForKeyedSubscript:(id)key;

- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex;
- (id)keyAtIndex:(NSUInteger)anIndex;
- (NSEnumerator *)reverseKeyEnumerator;

@end
