{
  ament-cmake,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-parser,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_introspection_cpp";
  version = "3.1.8-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-parser rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-parser rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_introspection_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "9faf296da449e8837d779b00a1720e7aa7f25d87";
        hash = "sha256-Og4LwCyLDvzSdto4I0PW3MqAD7lEmENVxOyMHkq5PUo=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C++.\n  ";
  };
})
