//
//  LighBaseViewController.swift
//  ligh
//
//  Created by ligh on 14-10-11.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import UIKit


class LighBaseViewController : UIViewController,UITextFieldDelegate
{
    //vc显示的内容 不包含NavigationBarView
    @IBOutlet var contentView:UIView!
              var navigationBarView:LighNavigationBarView!
    
    
    //键盘相关
    var  contentViewY:CGFloat = 0.0
    var  editingTextFieldOrTextView:AnyObject?
    var  textViewOrFieldOrgDelegate:AnyObject?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        self.configViews()

    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.enableKeyboardManger()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.disableKeyboardManager()
    }
    
    /*******************************ContentView  NavigationBarView begin**********************************/
    
    //配置views
    func configViews()
    {
        ///
        self.edgesForExtendedLayout = UIRectEdge.None
        
        navigationBarView = self.loadNavigationBarView()
        navigationBarView.leftButton.addTarget(self, action: "onLeftNavigationBarItemTaped", forControlEvents: .TouchUpInside)
        navigationBarView.rightButton.addTarget(self, action: "onRightNavigationBarItemTaped", forControlEvents: .TouchUpInside)
        
        navigationBarView.width = self.view.width
        self.view.addSubview(navigationBarView)

        if contentView == nil
        {
            contentView = UIView()
            self.view.addSubview(contentView)
        }
        
        contentView.backgroundColor = UIColor(hexString: "#F1F6F8")
    }


    //导航栏view 子类可以重写此方法
     func loadNavigationBarView() -> LighNavigationBarView
    {

        var navigationBarView:UIView! = LighNavigationBarView.viewFromXIB()
        navigationBarView.height = self.navigationBarViewHeight()
        return navigationBarView as! LighNavigationBarView
        
    }
    
    func navigationBarViewHeight() -> CGFloat
    {
        return UIDevice.lessthanIOS7() ? 44 : 64
    }
    
    
    func setNavigationBarTitle(title:String)
    {
        self.navigationBarView.titleLabel.text = title
    }
    
    
    func popViewController(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func onLeftNavigationBarItemTaped() {
        
        self.popViewController()
    }
    
    func onRightNavigationBarItemTaped() {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
         self.endEditing()
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return .LightContent
    }
  
    /*******************************ContentView  NavigationBarView end**********************************/
    
    
    
    
    /*******************************管理键盘事件 begin*****************************************************/
    //如果开启此功能 则VieController 会自动监听键盘弹起事件 自动将编辑中的view拖动到可见区域
    func enableKeyboardManger() /*default enabled*/
    {
        if (!self.isEnableKeyboardManger())
        {
            return;
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("textFieldDidBeginEditingNotification:"), name: UITextFieldTextDidBeginEditingNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("textFieldDidEndEditingNotification:"), name: UITextFieldTextDidEndEditingNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("textFieldDidBeginEditingNotification:"), name: UITextViewTextDidBeginEditingNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("textFieldDidEndEditingNotification:"), name: UITextViewTextDidEndEditingNotification, object: nil)
    }
    
    func disableKeyboardManager()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextFieldTextDidBeginEditingNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextFieldTextDidEndEditingNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidBeginEditingNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidEndEditingNotification, object: nil)
    }
    
    func isEnableKeyboardManger() -> Bool
    {
        return true
    }
    
    
    //键盘将要隐藏
    func keyboardWillHide(notification:NSNotification)
    {

        contentView.y =  contentViewY > 0 ? contentViewY : navigationBarView.bottom;
        
    }
    
    //键盘将要显示
    func keyboardWillShow(notification:NSNotification)
    {
        if (editingTextFieldOrTextView == nil)
        {
            return;
        }
        /*
        获取通知携带的信息
        */

        var userInfo:Dictionary = notification.userInfo!
        
        // Get the origin of the keyboard when it's displayed.
        var aValue:NSValue? = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
        // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
        var keyboardRect:CGRect = aValue!.CGRectValue()
        
        keyboardRect =   self.view.convertRect(keyboardRect, toView: self.view)
        
        
        var editingViewSuperView:UIView? = editingTextFieldOrTextView?.superview
        var textViewRect:CGRect = editingViewSuperView!.convertRect(editingTextFieldOrTextView!.frame, toView: self.view)
        var offsetY:CGFloat = (textViewRect.origin.y + textViewRect.size.height) - keyboardRect.origin.y


        //输入框未被键盘遮挡 无需调整
        if (offsetY <= 0)
        {
            return;
        }
        
        offsetY += UIDevice.lessthanIOS7() ? self.navigationBarViewHeight() :0;
        
        self.contentView.y -= offsetY + 5 ;

    }
    
    func textFieldDidBeginEditingNotification(notification:NSNotification)
    {
      
        editingTextFieldOrTextView = notification.object
        
        
        if (editingTextFieldOrTextView is UITextField)
        {

            var textFiled:UITextField = editingTextFieldOrTextView as! UITextField
            
            if (textFiled.delegate == nil)
            {
                textFiled.delegate = self
            }

            if (textFiled.returnKeyType == UIReturnKeyType.Default)
            {
               textFiled.returnKeyType = UIReturnKeyType.Done
            }
            
        } else if(editingTextFieldOrTextView is UITextView)
        {
            
            var textView:UITextView = editingTextFieldOrTextView as! UITextView
            
            if (textView.returnKeyType == UIReturnKeyType.Default)
            {
                textView.returnKeyType = UIReturnKeyType.Done
            }
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        self.endEditing()
        return true
    }
    
    func textFieldDidEndEditingNotification(notification:NSNotification)
    {
        editingTextFieldOrTextView = nil
        textViewOrFieldOrgDelegate = nil
    }
    

    func endEditing()
    {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
    
    /*******************************管理键盘事件 end*****************************************************/
    
    
    

    
 
}

