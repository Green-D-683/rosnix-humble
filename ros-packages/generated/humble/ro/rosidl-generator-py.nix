{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rmw,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-parser,
  rosidl-runtime-c,
  rosidl-typesupport-c,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  rpyutils,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_py";
  version = "0.14.6-1";
  src = finalAttrs.passthru.sources."rosidl_generator_py";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto ament-lint-common python-cmake-module rmw rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-typesupport-c rosidl-typesupport-fastrtps-c rosidl-typesupport-introspection-c rpyutils test-interface-files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "b7d22945a4042a9177459f9634142862ded8b0a3";
        hash = "sha256-dIa2s5cl+QXwsK+Txn0M65H7naiYvZybkRzIGchWNgk=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
})
