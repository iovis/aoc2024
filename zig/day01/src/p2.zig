const std = @import("std");

pub fn run(allocator: std.mem.Allocator, input: []const u8) !usize {
    var left = std.ArrayList(usize).init(allocator);
    defer left.deinit();

    var right = std.ArrayList(usize).init(allocator);
    defer right.deinit();

    var lines = std.mem.splitSequence(u8, input, "\n");

    while (lines.next()) |line| {
        if (line.len == 0) break;

        var numbers = std.mem.splitSequence(u8, line, "   ");

        try left.append(try std.fmt.parseInt(usize, numbers.next().?, 10));
        try right.append(try std.fmt.parseInt(usize, numbers.next().?, 10));
    }

    std.mem.sort(usize, left.items, {}, std.sort.asc(usize));
    std.mem.sort(usize, right.items, {}, std.sort.asc(usize));

    var sum: usize = 0;

    for (0..left.items.len) |i| {
        var count: usize = 0;

        for (0..right.items.len) |j| {
            if (left.items[i] == right.items[j]) {
                count += 1;
            } else if (left.items[i] < right.items[j]) {
                break;
            }
        }

        sum += count * left.items[i];
    }

    return sum;
}

const testing = std.testing;

test "p2" {
    const allocator = testing.allocator;
    const input =
        \\3   4
        \\4   3
        \\2   5
        \\1   3
        \\3   9
        \\3   3
    ;

    try testing.expectEqual(run(allocator, input), 31);
}
