const std = @import("std");
const process = std.process;

fn tarai(x: i32, y: i32, z: i32) i32 {
    if (x > y) {
        return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y));
    } else {
        return y;
    }
}

fn arg_i32(args: [][:0]u8, ix: usize, fallback: i32) !i32 {
    if (std.os.argv.len <= ix) {
        return fallback;
    }
    return try std.fmt.parseInt(i32, args[ix], 10);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const a = gpa.allocator();
    var args = try process.argsAlloc(a);
    defer process.argsFree(a, args);

    var x: i32 = try arg_i32(args, 1, 14);
    var y: i32 = try arg_i32(args, 2, 7);
    var z: i32 = try arg_i32(args, 3, 0);
    try std.io.getStdOut().writer().print("tarai({}, {}, {}) = {}\n", .{ x, y, z, tarai(x, y, z) });
}
