const std = @import("std");
const mem = std.mem;

const build_zig_zon = @import("build.zig.zon");

pub fn get_version() ?[]const u8 {
    var it = mem.splitScalar(u8, build_zig_zon.contents, '\n');
    while (it.next()) |line_untrimmed| {
        const line = mem.trim(u8, line_untrimmed, " \t\n\r");
        if (mem.startsWith(u8, line, ".version")) {
            var tokenizer = mem.tokenizeAny(u8, line[".version".len..], " \"=");
            return tokenizer.next();
        }
    }

    return null;
}
