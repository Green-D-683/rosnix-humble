{
  ament-cmake,
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
  pname = "fastrtps_cmake_module";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "5542f12e941defdfacbdd5e14a4a7befb0b1564c";
        hash = "sha256-sf6R+YqCRdrHx4PcMdB82mADcXhzkSNtHl8ooDkaR7I=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
