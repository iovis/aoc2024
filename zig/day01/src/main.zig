const std = @import("std");
const p1 = @import("p1.zig");

pub fn main() !void {
    const input: []const u8 = @embedFile("input.txt");
    // std.debug.print("{s}", .{input});

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    std.debug.print("p1 = {any}\n", .{p1.run(allocator, input)});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
