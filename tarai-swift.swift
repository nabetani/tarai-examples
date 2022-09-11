import Foundation

func tarai( x:Int32, y:Int32, z:Int32) -> Int32 {
   if (x > y){
      return tarai( x:tarai(x:x-1, y:y, z:z), y:tarai(x:y-1, y:z, z:x), z:tarai(x:z-1, y:x, z:y) );
   } else {
      return y;
   }
}

func main() -> Int {
    let argv = ProcessInfo.processInfo.arguments
    let x = 3<argv.count ? Int32(argv[1])! : 14
    let y = 3<argv.count ? Int32(argv[2])! : 7
    let z = 3<argv.count ? Int32(argv[3])! : 0
    let t = tarai(x:x,y:y,z:z)
    print("tarai(\(x), \(y), \(z))=\(t)")
    return 0
}

//返り値を取らないとwarningが出ます
_ = main()
