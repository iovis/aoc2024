const std = @import("std");
const p1 = @import("p1.zig");
const p2 = @import("p2.zig");

pub fn main() !void {
    const input: []const u8 = @embedFile("input.txt");
    // std.debug.print("{s}", .{input});

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    std.debug.print("p1 = {any}\n", .{p1.run(allocator, input)});
    std.debug.print("p2 = {any}\n", .{p2.run(allocator, input)});
}
