{
  ament-cmake-core,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_cpp";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "379de1463ea18313f0b71c8adf162aef55e31371";
        hash = "sha256-OPLxoXxz8jgBkp6GoUh0zDTFtMkHrNjtTNmzfmiFR64=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
