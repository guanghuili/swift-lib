//: Playground - noun: a place where people can play

import Foundation

//typealias Action = ()->Void
//typealias AsyncTask = (Action) -> Void
//
//
//infix operator +> {
//    associativity left
//    precedence 160
//}
//
//func +>(l:AsyncTask,r:AsyncTask) -> AsyncTask {
//    
//    return { complete in
//    
//        l{
//            r{
//                complete()
//            }
//        }
//    }
//    
//}
//
//
//
////登录任务
//func asyncLoginTask(complete : Action) {
//    //..do something
//    print("asyncLoginTask")
//    complete()
//}
//
////获取用户信息
//func asyncGetUserInfoTask(complete :Action) {
//    //..do something
//    print("asyncGetUserInfoTask")
//    complete()
//}
//
//
////获取用户好友列表
//func asyncGetFriendsLoginTask(complete : Action) {
//    //..do something
//    print("asyncGetFriendsLoginTask")
//    complete()
//}
//
//
//
//
//let task  = asyncLoginTask +> asyncGetUserInfoTask +> asyncGetFriendsLoginTask +>  asyncLoginTask
//task { 
//    print("执行完成")
//}


var user:(a:String,b:String) = (a:"a",b:"ssb")
user.b

