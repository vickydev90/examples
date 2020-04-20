load("@bazel_sonarqube//:defs.bzl", "sonarqube")
#load("@rules_java//java:defs.bzl", "java_binary")

#java_binary(
#    name = "ProjectRunner",
#    srcs = glob(["src/main/java/com/example/*.java"]),
#)


sonarqube(
    name = "sq",
    project_key = "com.example.project:project",
    project_name = "My Project",
    srcs = [
        "src/main/java/com/example",
    ],
    targets = [
    ],
    modules = {
    },
    coverage_report = ":coverage_report",
    scm_info = [":git"],
    tags = ["manual"],
)
