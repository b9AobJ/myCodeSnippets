// KeyBoardShowAndHideMethod
// 
//
// IDECodeSnippetCompletionPrefix: keyshowhideMethod
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: DC48991D-3F43-4537-91F8-7A0BF446153F
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
#pragma mark -
#pragma mark Responding to keyboard events
- (void)keyboardWillShow:(NSNotification *)notification {
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     
     Animate the resize so that it's in sync with the appearance of the keyboard.
     
     */
    
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    
    CGRect keyboardRect = [aValue CGRectValue];
    
    // Get the duration of the animation.
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    NSTimeInterval animationDuration;
    
    [animationDurationValue getValue:&animationDuration];
    
    
    
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
    
    [UIView animateWithDuration:animationDuration animations:^{
        
        //此处的viewFooter即是你的输入框View
        
        //20为状态栏的高度
        
        self.containerView.frame = CGRectMake(_containerView.frame.origin.x, keyboardRect.origin.y-20-_containerView.frame.size.height,_containerView.frame.size.width, _containerView.frame.size.height);
        
    } completion:^(BOOL finished){
        
        
        
    }];
    
}


- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [aValue CGRectValue];
    
    
    
    /*
     
     Restore the size of the text view (fill self's view).
     
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     
     */
    
    [UIView animateWithDuration:0 animations:^{
        
        self.containerView.frame = CGRectMake(_containerView.frame.origin.x, keyboardRect.origin.y-20-_containerView.frame.size.height, _containerView.frame.size.width, _containerView.frame.size.height);
        
    } completion:^(BOOL finished){
        
        
        
    }];
    
}
//　　3）在视图控制器消除时（即viewDidUnload中），移除键盘事件的通知：
//[[NSNotificationCenter defaultCenter] removeObserver:self];