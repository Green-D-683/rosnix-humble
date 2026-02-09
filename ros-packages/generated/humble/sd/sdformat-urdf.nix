{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  sdformat-test-files,
  substituteSource,
  tinyxml2-vendor,
  urdf,
  urdf-parser-plugin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_urdf";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."sdformat_urdf";
  propagatedNativeBuildInputs = [ ament-cmake-ros pluginlib rcutils tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liburdfdom-headers-dev" "sdformat12" ]; };
  propagatedBuildInputs = [ ament-cmake-ros pluginlib rcutils tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" "sdformat12" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  passthru.sources = mkSourceSet (sources: {
    "sdformat_urdf" = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "e38ebf3d65da9dc30fd1ccbea26ac029550085df";
        hash = "sha256-V16ZY8Qvi6qG7ex2Hw+OLTqOmYc60Xj6GkUitr8m/4I=";
      };
    };
  });
  meta = {
    description = "\n    URDF plugin to parse SDFormat XML into URDF C++ DOM objects.\n  ";
  };
})
