# How to reproduce the problem:

```console
bazelisk build :foo
```

Output:

```
In file included from foo.cpp:1:
bazel-out/k8-fastbuild/bin/external/bar/_virtual_includes/bar/bar/bar.h: In function 'int bar(float)':
bazel-out/k8-fastbuild/bin/external/bar/_virtual_includes/bar/bar/bar.h:3:17: error: use of old-style cast to 'int' [-Werror=old-style-cast]
    3 |     return (int)f;
      |                 ^
      |            ------
      |            static_cast<int> (f)

```

# Workaround
Replace `strip_include_prefix` with `includes` in `BUILD.bar.bazel`. This performs the header
inclusion via `-isystem` instead of `-iquote`. Warnings from system headers are ignored.
