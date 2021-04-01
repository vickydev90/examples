load("@rules_cc//cc:defs.bzl", "cc_binary")
load("//expand_template:hello.bzl", "hello")

# Generates a C++ source file that says "Hello John!".
hello(
    name = "hello_john_src",
    firstname = "John",
)

cc_binary(
    name = "hello",
    srcs = [":hello_john_src"],
)

# "${file.path}".substring(0, "${file.path}".lastIndexOf("/"))