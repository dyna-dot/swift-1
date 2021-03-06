// REQUIRES: objc_interop

// FIXME: the test output we're comparing to is specific to macOS.
// REQUIRES-ANY: OS=macosx

// RUN: %empty-directory(%t)
// RUN: %build-clang-importer-objc-overlays

// RUN: %sourcekitd-test -req=doc-info -module Foo -- -F %S/../Inputs/libIDE-mock-sdk \
// RUN:         %mcp_opt -target %target-triple %clang-importer-sdk-nosource -I %t | %sed_clean > %t.response
// RUN: diff -u %s.response %t.response
