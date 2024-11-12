def _download_bar_impl(rctx):
    rctx.symlink(Label("//bar:BUILD.bar.bazel"), "BUILD.bazel")
    rctx.symlink(Label("//bar:bar.h"), "include/bar/bar.h")

download_bar = repository_rule(
    implementation = _download_bar_impl,
)
