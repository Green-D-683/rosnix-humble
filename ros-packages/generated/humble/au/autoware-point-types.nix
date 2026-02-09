{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-cppcheck,
  ament-cmake-export-dependencies,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-test,
  ament-cmake-xmllint,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-ros,
  point-cloud-msg-wrapper,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_point_types";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_point_types";
  nativeBuildInputs = [ ament-cmake-export-dependencies autoware-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint pcl-ros point-cloud-msg-wrapper ];
  buildInputs = [ ament-cmake-export-dependencies autoware-cmake ];
  propagatedBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint pcl-ros point-cloud-msg-wrapper ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common point-cloud-msg-wrapper ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_point_types" = substituteSource {
      src = fetchgit {
        name = "autoware_point_types-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "02804d14c6af9202b8c749e0e067e5fc36a067a2";
        hash = "sha256-nbfjWtL9eN4qsCoYjWQG+E2Zyjyrz+dt79leTKVzcWI=";
      };
    };
  });
  meta = {
    description = "The point types definition to use point_cloud_msg_wrapper";
  };
})
