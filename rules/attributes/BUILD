load("//attributes:printer.bzl", "printer")
printer(
    name = "some_target",
    deps = [
        "BUILD",
        ":other",
    ],
)

# This target is a dependency of 'some_target', so it is automatically analyzed
# when you build 'some_target'.
printer(name = "other")

 Run 'bazel build :some_target' to print its information.