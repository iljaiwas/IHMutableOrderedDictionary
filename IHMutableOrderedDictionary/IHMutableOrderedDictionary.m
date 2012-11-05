//
//  IHOrderedDictionary.m
//  IHMutableOrderedDictionary
//
//  Created by ilja on 05.11.12.
//  Copyright (c) 2012 iwascoding GmbH. All rights reserved.
//

#import "IHMutableOrderedDictionary.h"

@implementation IHMutableOrderedDictionary


- (id)init
{
	self = [super init];
	if (self)
	{
		self.keyset = [[NSMutableOrderedSet alloc] init];
		self.dictionary = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
	if (![self.keyset containsObject:aKey])
	{
		[self.keyset addObject:aKey];
	}
	[self.dictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey
{
	[self.dictionary removeObjectForKey:aKey];
	[self. keyset removeObject:aKey];
}

- (NSUInteger)count
{
	return [self.dictionary count];
}

- (id)objectForKey:(id)aKey
{
	return [self.dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
	return [self.keyset objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator
{
	return [self.keyset reverseObjectEnumerator];
}

- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex
{
	if ([self.dictionary objectForKey:aKey])
	{
		[self.keyset removeObject:aKey];
	}
	[self.keyset insertObject:aKey atIndex:anIndex];
	[self.dictionary setObject:anObject forKey:aKey];
}

- (id)keyAtIndex:(NSUInteger)anIndex
{
	return [self.keyset objectAtIndex:anIndex];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])stackbuf count:(NSUInteger)len
{
    return [self.keyset countByEnumeratingWithState: state
										 objects: stackbuf
										   count: len];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
	id key = [self.keyset objectAtIndex:idx];
	
	return [self.dictionary objectForKey:key];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
	NSAssert (idx <= self.keyset.count -1, @"index %ld is beyond max range %ld", idx, self.keyset.count - 1);
	
	id key = [self.keyset objectAtIndex:idx];
	[self.dictionary setObject:obj forKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
	[self setObject:obj forKey:key];
}

- (id)objectForKeyedSubscript:(id)key
{
	return [self.dictionary objectForKey:key];
}

@end
