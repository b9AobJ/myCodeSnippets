// Singleton Accessor
// Accessor function for singleton objects
//
// IDECodeSnippetCompletionPrefix: singleton accessor
// IDECodeSnippetCompletionScopes: [ClassInterfaceMethods]
// IDECodeSnippetIdentifier: 6A75FF1E-5EA4-4379-8B13-EEA6F236B632
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
+ (instancetype)shared<#ObjectName#> {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}