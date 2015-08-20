// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
@import ObjectiveC;
@import Foundation.NSURLSession;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"


/// Subclass of NSOperation for handling and scheduling HTTPTask on a NSOperationQueue.
SWIFT_CLASS("_TtC9SwiftHTTP13HTTPOperation")
@interface HTTPOperation : NSOperation

/// Returns if the task is asynchronous or not. NSURLSessionTask requests are asynchronous.
@property (nonatomic, readonly, getter=isAsynchronous) BOOL asynchronous;

/// Returns if the task is current running.
@property (nonatomic, readonly, getter=isExecuting) BOOL executing;

/// Returns if the task is finished.
@property (nonatomic, readonly, getter=isFinished) BOOL finished;

/// Starts the task.
- (void)start;

/// Cancels the running task.
- (void)cancel;

/// Sets the task to finished.
- (void)finish;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class HTTPPair;
@class NSData;


/// Default Serializer for serializing an object to an HTTP request. This applies to form serialization, parameter encoding, etc.
SWIFT_CLASS("_TtC9SwiftHTTP21HTTPRequestSerializer")
@interface HTTPRequestSerializer : NSObject
@property (nonatomic, readonly, copy) NSString * __nonnull contentTypeKey;

/// headers for the request.
@property (nonatomic, copy) NSDictionary * __nonnull headers;

/// encoding for the request.
@property (nonatomic) NSUInteger stringEncoding;

/// Send request if using cellular network or not. Defaults to true.
@property (nonatomic) BOOL allowsCellularAccess;

/// If the request should handle cookies of not. Defaults to true.
@property (nonatomic) BOOL HTTPShouldHandleCookies;

/// If the request should use piplining or not. Defaults to false.
@property (nonatomic) BOOL HTTPShouldUsePipelining;

/// How long the timeout interval is. Defaults to 60 seconds.
@property (nonatomic) NSTimeInterval timeoutInterval;

/// Set the request cache policy. Defaults to UseProtocolCachePolicy.
@property (nonatomic) NSURLRequestCachePolicy cachePolicy;

/// Set the network service. Defaults to NetworkServiceTypeDefault.
@property (nonatomic) NSURLRequestNetworkServiceType networkServiceType;

/// Initializes a new HTTPRequestSerializer Object.
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// check for multi form objects
- (BOOL)isMultiForm:(NSDictionary * __nonnull)params;

/// convert the parameter dict to its HTTP string representation
- (NSString * __nonnull)stringFromParameters:(NSDictionary * __nonnull)parameters;

/// the method to serialized all the objects
- (NSArray * __nonnull)serializeObject:(id __nonnull)object key:(NSString * __nullable)key;
- (NSData * __nonnull)dataFromParameters:(NSDictionary * __nonnull)parameters boundary:(NSString * __nonnull)boundary;

/// helper method to create the multi form headers
- (NSString * __nonnull)multiFormHeader:(NSString * __nonnull)name fileName:(NSString * __nullable)fileName type:(NSString * __nullable)type multiCRLF:(NSString * __nonnull)multiCRLF;
@end

@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class NSURLSession;
@class NSURLSessionTask;
@class NSError;
@class NSURLSessionDownloadTask;
@class NSURL;
@class NSURLSessionDataTask;


/// Configures NSURLSession Request for HTTPOperation. Also provides convenience methods for easily running HTTP Request.
SWIFT_CLASS("_TtC9SwiftHTTP8HTTPTask")
@interface HTTPTask : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate>
@property (nonatomic, copy) NSDictionary * __nonnull backgroundTaskMap;
@property (nonatomic, copy) NSString * __nullable baseURL;
@property (nonatomic) HTTPRequestSerializer * __nonnull requestSerializer;
@property (nonatomic, copy) NSURLCredential * __nullable (^ __nullable auth)(NSURLAuthenticationChallenge * __nonnull);

/// A newly minted HTTPTask for your enjoyment.
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Method for authentication challenge.
- (void)URLSession:(NSURLSession * __nonnull)session task:(NSURLSessionTask * __nonnull)task didReceiveChallenge:(NSURLAuthenticationChallenge * __nonnull)challenge completionHandler:(void (^ __nonnull)(NSURLSessionAuthChallengeDisposition, NSURLCredential * __null_unspecified))completionHandler;

/// update the download/upload progress closure
- (void)handleProgress:(NSURLSession * __nonnull)session totalBytesExpected:(int64_t)totalBytesExpected currentBytes:(int64_t)currentBytes;
- (void)handleFinish:(NSURLSession * __nonnull)session task:(NSURLSessionTask * __nonnull)task response:(id __nonnull)response;

/// Called when the background task failed.
- (void)URLSession:(NSURLSession * __nonnull)session task:(NSURLSessionTask * __nonnull)task didCompleteWithError:(NSError * __nullable)error;

/// The background download finished and reports the url the data was saved to.
- (void)URLSession:(NSURLSession * __nonnull)session downloadTask:(NSURLSessionDownloadTask * __nonnull)downloadTask didFinishDownloadingToURL:(NSURL * __null_unspecified)location;

/// Will report progress of background download
- (void)URLSession:(NSURLSession * __nonnull)session downloadTask:(NSURLSessionDownloadTask * __nonnull)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;

/// The background download finished, don't have to really do anything.
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession * __nonnull)session;

/// The background upload finished and reports the response.
- (void)URLSession:(NSURLSession * __nonnull)session dataTask:(NSURLSessionDataTask * __nonnull)dataTask didReceiveData:(NSData * __null_unspecified)data;

/// Will report progress of background upload
- (void)URLSession:(NSURLSession * __nonnull)session task:(NSURLSessionTask * __nonnull)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend;
- (void)URLSession:(NSURLSession * __nonnull)session downloadTask:(NSURLSessionDownloadTask * __nonnull)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes;
@end



/// Object representation of a HTTP File Upload.
SWIFT_CLASS("_TtC9SwiftHTTP10HTTPUpload")
@interface HTTPUpload : NSObject
@property (nonatomic) NSURL * __nullable fileUrl;
@property (nonatomic, copy) NSString * __nullable mimeType;
@property (nonatomic) NSData * __nullable data;
@property (nonatomic, copy) NSString * __nullable fileName;

/// Tries to determine the mime type from the fileUrl extension.
- (void)updateMimeType;

/// loads the fileUrl into memory.
- (void)loadData;

/// Initializes a new HTTPUpload Object.
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Initializes a new HTTPUpload Object with a fileUrl. The fileName and mimeType will be infered.
///
/// \param fileUrl The fileUrl is a standard url path to a file.
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithFileUrl:(NSURL * __nonnull)fileUrl;

/// <blockquote><p>Initializes a new HTTPUpload Object with a data blob of a file. The fileName and mimeType will be infered if none are provided.</p><blockquote><dl><dt>param</dt><dd><p>data The data is a NSData representation of a file's data.</p></dd><dt>param</dt><dd><p>fileName The fileName is just that. The file's name.</p></dd><dt>param</dt><dd><p>mimeType The mimeType is just that. The mime type you would like the file to uploaded as.</p></dd></dl></blockquote></blockquote>
/// upload a file from a a data blob. Must add a filename and mimeType as that can't be infered from the data
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithData:(NSData * __nonnull)data fileName:(NSString * __nonnull)fileName mimeType:(NSString * __nonnull)mimeType;
@end



/// JSON Serializer for serializing an object to an HTTP request. Same as HTTPRequestSerializer, expect instead of HTTP form encoding it does JSON.
SWIFT_CLASS("_TtC9SwiftHTTP21JSONRequestSerializer")
@interface JSONRequestSerializer : HTTPRequestSerializer
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop