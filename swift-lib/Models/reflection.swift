import Foundation


struct Point {
    var x: Int = 200
    var y: Int! = 2
    var z: Int? = nil
}

class CPoint {
    var x: Int = 200
    var y: Int! = 2
    var z: Int? = nil
}

enum Result {
    case Ok(Int, String)
    case Error(String)
}

enum Flag: UInt {
    case OPT_URL
    case OPT_FUNC
}


func print_type(tp: Any.Type) {
    switch tp.self {
    case _ as String.Type:      // String, NSString
        println("type = string")
    case _ as Int.Type:
        println("int")
    case _ as Point.Type:
        println("point")
    case _ as Dictionary<Int, Int>.Type:
        println("dict")
    case _ as Range<Int>.Type:
        println("range of int")
    default:
        println(tp)
    }
    // if tp is String.Type {
    //     println("!!!tp => String")
    // }
}


func dumpMirror(ref: MirrorType)
{
    println("========================================")
    dumpMirror(ref, 0)
}

func dumpMirror(ref: MirrorType, indent: Int)
{
    func prt(msg: String) {
        for _ in 0...indent {
            print(" ")
        }
        print(msg)
    }

    func prtln(msg: String) {
        for _ in 0...indent {
            print(" ")
        }
        println(msg)
    }

     // only for class
    if let oid = ref.objectIdentifier?.uintValue {
        prtln("oid = \(oid)")
    }

    prt("valueType: ")
    print_type(ref.valueType)
    // sub item count
    prtln("count: \(ref.count)")
    // summary for type re
    prtln("summary: \(ref.summary)")

    prt("disposition: ")
    switch ref.disposition
    {
    case .Struct:
        prtln("struct")
        for r in 0...ref.count {
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }

    case .Class:
        prtln("class")
        for r in 0...ref.count {
           // let mirror = reflect(r)
          
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }
    case .Enum:
        prtln("enum")
    case .Tuple:
        prtln("tuple")
        for r in 0...ref.count {
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }
    case .Aggregate:
        prtln("aggregate")
    case .IndexContainer:       // Type[]
        prtln("index container")
        for r in 0...ref.count {
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }
    case .KeyContainer:         // dict
        prtln("key container")
        for r in 0...ref.count {
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }
    case .MembershipContainer:
        prtln("member ship container")
    case .Container:
        prtln("container")
    case .Optional:             // Type?
        prtln("optional")
        for r in 0...ref.count { // only 1 or 0 item, sometime ref[0] fails
            let key = ref[r].0
            let valueType = ref[r].1
            
            prtln("name: \(key)")
            
            dumpMirror(reflect(valueType), indent + 2)
        }
    default:
        NSLog("default");
    }
}

//let a = (100, 200)
//let b = 1000
//let c = "asdfasdf"
//let d = { (a:Int) -> Int in a + 1000 }
//let e = Point()
//
//let f = [123:21412, 14123:12341]
//let g = 1..20
//
//// index container
//let h: Int[] = [2134, 1234, 4323, 134, 1324]
//let i: Array<Int> = [2134, 1234, 4323, 134, 1324]
//
//let j: Int? = 100
//let k: () = ()
//let l: NSString = "Welcome to China"
//let m: NSNumber = 1000          // class
//let n = NSURL.URLWithString("http://www.cimgf.com/testpost.php")
//let o = CPoint()
//let p = Result.Ok(233333, "Hello")
//let q = Flag.OPT_FUNC
//let r: NSArray = ["hello", "world"]
//let s: NSDictionary = ["name": "Lucy", "sex": "female"]
//let t: Int? = nil
//
//dumpMirror(reflect(a))
//dumpMirror(reflect(b))
//dumpMirror(reflect(c))
//dumpMirror(reflect(d))
//dumpMirror(reflect(e))
//dumpMirror(reflect(f))
//dumpMirror(reflect(g))
//dumpMirror(reflect(h))
//dumpMirror(reflect(i))
//dumpMirror(reflect(j))
//dumpMirror(reflect(k))
//dumpMirror(reflect(l))
//dumpMirror(reflect(m))
//dumpMirror(reflect(n))
//dumpMirror(reflect(o))
//dumpMirror(reflect(Mirror.self))
//dumpMirror(reflect(f.keys))
//dumpMirror(reflect(p))
//dumpMirror(reflect(q))
//dumpMirror(reflect(r))
//dumpMirror(reflect(s))
//dumpMirror(reflect(t))
