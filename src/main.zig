const std = @import("std");

const mem = std.mem;
const print = std.debug.print;
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

const utils = @import("utils.zig");

const c = @cImport({
    @cInclude("ncurses.h");
    @cInclude("locale.h");
    @cInclude("signal.h");
    @cInclude("sys/ioctl.h");
    @cInclude("termios.h");
    @cInclude("unistd.h");
    @cInclude("time.h");
    @cInclude("fcntl.h");
});

pub fn main() !void {
    print("Hello, World!", .{});

    if (utils.get_version()) |version| {
        print("Version: {s}", .{version});
    }
}
