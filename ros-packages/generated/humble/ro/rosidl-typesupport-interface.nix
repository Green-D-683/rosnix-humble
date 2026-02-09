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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_interface";
  version = "3.1.8-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_interface" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "84bf709b898b1e75e202d0d81cab4055c6263d52";
        hash = "sha256-HCOpDy0T9tdaQEMatGmQ2RGzCoUdX8T51pcj/bd9H7k=";
      };
    };
  });
  meta = {
    description = "\n    The interface for rosidl typesupport packages.\n  ";
  };
})
