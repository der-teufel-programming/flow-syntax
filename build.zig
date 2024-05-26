const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const tree_sitter_dep = b.dependency("tree-sitter", .{
        .target = target,
        .optimize = optimize,
    });

    _ = b.addModule("syntax", .{
        .root_source_file = b.path("src/syntax.zig"),
        .imports = &.{
            .{ .name = "treez", .module = tree_sitter_dep.module("treez") },
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-agda/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-bash/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-c-sharp/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-c/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-cpp/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-css/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-diff/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-dockerfile/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-git-rebase/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-gitcommit/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-go/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-fish/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-haskell/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-html/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-java/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-javascript/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-jsdoc/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-json/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-lua/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-make/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-markdown/tree-sitter-markdown/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-markdown/tree-sitter-markdown-inline/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-nasm/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ninja/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-nix/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ocaml/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-openscad/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-org/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-php/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-python/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-purescript/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-regex/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ruby/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-rust/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ssh-config/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-scala/queries/scala/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-scheme/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-toml/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-typescript/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-xml/dtd/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-xml/xml/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-zig/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ziggy/tree-sitter-ziggy/queries/highlights.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-ziggy/tree-sitter-ziggy-schema/queries/highlights.scm"),

            ts_queryfile(b, tree_sitter_dep, "tree-sitter-cpp/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-gitcommit/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-html/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-javascript/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-lua/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-markdown/tree-sitter-markdown-inline/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-markdown/tree-sitter-markdown/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-nasm/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-nix/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-openscad/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-php/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-purescript/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-purescript/vim_queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-rust/queries/injections.scm"),
            ts_queryfile(b, tree_sitter_dep, "tree-sitter-zig/queries/injections.scm"),
        },
    });
}

fn ts_queryfile(b: *std.Build, dep: *std.Build.Dependency, sub_path: []const u8) std.Build.Module.Import {
    return .{
        .name = sub_path,
        .module = b.createModule(.{
            .root_source_file = dep.path(sub_path),
        }),
    };
}
