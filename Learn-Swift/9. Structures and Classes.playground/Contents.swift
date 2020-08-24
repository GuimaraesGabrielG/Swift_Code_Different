//MARK: Structures and Classes
//MARK: Where Use?
/*
- Use structures by default.
- Use structures along with protocols to adopt behavior by sharing implementations.
 */

//MARK: WHERE USE CLASS?
//- Control Identity EX: local database connection


 //MARK: DIFERENCE

//STRUCT, the same works with ENUM
//-copy of the structure

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now  \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//CLASS
//- reference to the instance
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)
