load("@bazel_sonarqube//:defs.bzl", "sonarqube")
load("@rules_java//java:defs.bzl", "java_binary", "java_library", "java_test")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "java-maven-lib",
    srcs = glob(["src/main/java/com/example/myproject/*.java"]),
    deps = ["@maven//:com_google_guava_guava"],
)

java_binary(
    name = "java-maven",
    main_class = "com.example.myproject.App",
    runtime_deps = [":java-maven-lib"],
)

java_test(
    name = "tests",
    srcs = glob(["src/test/java/com/example/myproject/*.java"]),
    test_class = "com.example.myproject.TestApp",
    deps = [
        ":java-maven-lib",
        "@maven//:com_google_guava_guava",
        "@maven//:junit_junit",
    ],
)

filegroup(
    name = "git",
    srcs = glob(
        [".git/**"],
        exclude = [".git/**/*[*"],  # gitk creates temp files with []
    ),
    tags = ["manual"],
)

filegroup(
    name = "coverage_report",
    srcs = ["bazel-out/_coverage/_coverage_report.dat"], # Created manually
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

sonarqube(
    name = "sq",
    project_key = "com.example.project:project",
    project_name = "My Project",
    srcs = [
        "src/main/java",
    ],
    targets = [
        "bazel-out/_coverage"
    ],
    modules = {
    },
    coverage_report = ":coverage_report",
    scm_info = [":git"],
    tags = ["manual"],
)
