const std = @import("std");

fn tarai(x: i32, y: i32, z: i32) i32 {
    if (x > y) {
        return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y));
    } else {
        return y;
    }
}

fn arg_i32(ix: usize, fallback: i32) !i32 {
    if (std.os.argv.len<=ix) {
        return fallback;
    }
    return try std.fmt.parseInt(i32, std.mem.span(std.os.argv[ix]), 10);
}

pub fn main() !void {
    var x: i32 = try arg_i32(1, 14);
    var y: i32 = try arg_i32(2, 7);
    var z: i32 = try arg_i32(3, 0);
    try std.io.getStdOut().writer().print("tarai({}, {}, {}) = {}\n", .{ x, y, z, tarai(x, y, z) });
}
