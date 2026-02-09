{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-parser,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_rs";
  version = "0.4.10-1";
  src = finalAttrs.passthru.sources."rosidl_generator_rs";
  propagatedNativeBuildInputs = [ ament-cmake ros-environment rosidl-cmake rosidl-generator-c rosidl-parser rosidl-typesupport-c rosidl-typesupport-interface ];
  propagatedBuildInputs = [ ament-cmake ros-environment rosidl-cmake rosidl-generator-c rosidl-parser rosidl-typesupport-c rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-generator-c ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_rs" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_rs-source";
        url = "https://github.com/ros2-gbp/rosidl_rust-release.git";
        rev = "54de03d32beb3e521fd9bdbe4b5993871de2fa76";
        hash = "sha256-SaqU8ibVMeNLT6JUgXhWtHujOfLmk2mD0ZVDwkcOytE=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Rust.";
  };
})
