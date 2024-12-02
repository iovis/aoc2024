const std = @import("std");

pub fn run(allocator: std.mem.Allocator, input: []const u8) !usize {
    var left = std.ArrayList(isize).init(allocator);
    defer left.deinit();

    var right = std.ArrayList(isize).init(allocator);
    defer right.deinit();

    var lines = std.mem.splitSequence(u8, input, "\n");

    while (lines.next()) |line| {
        if (line.len == 0) break;

        var numbers = std.mem.splitSequence(u8, line, "   ");

        try left.append(try std.fmt.parseInt(isize, numbers.next().?, 10));
        try right.append(try std.fmt.parseInt(isize, numbers.next().?, 10));
    }

    // for (right.items) |value| {
    //     std.debug.print("{any}\n", .{value});
    // }
    //
    // std.debug.print("---\n", .{});

    std.mem.sort(isize, left.items, {}, std.sort.asc(isize));
    std.mem.sort(isize, right.items, {}, std.sort.asc(isize));

    // for (right.items) |value| {
    //     std.debug.print("{any}\n", .{value});
    // }

    var sum: usize = 0;

    for (left.items, right.items) |l, r| {
        sum += @abs(l - r);
    }

    return sum;
}

const testing = std.testing;

test "p1" {
    const allocator = testing.allocator;
    const input =
        \\3   4
        \\4   3
        \\2   5
        \\1   3
        \\3   9
        \\3   3
    ;

    try testing.expectEqual(run(allocator, input), 11);
}
