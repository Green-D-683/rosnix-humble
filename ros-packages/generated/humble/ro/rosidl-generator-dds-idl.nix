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
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_dds_idl";
  version = "0.8.1-2";
  src = finalAttrs.passthru.sources."rosidl_generator_dds_idl";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "36a89f4b5e5b9e1deee03da9cb80b7aa4763b644";
        hash = "sha256-UbHyVv/Xq0JbRDATE+abOq2ictJ0GXQ/mufIPF8i8A8=";
      };
    };
  });
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
})
