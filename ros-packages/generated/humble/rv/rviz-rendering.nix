{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  resource-retriever,
  rosSystemPackages,
  rviz-assimp-vendor,
  rviz-ogre-vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering";
  version = "11.2.25-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gmock ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto rviz-assimp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "d159b37d1dc4a3d9592b1adaf5d5a49f04b22217";
        hash = "sha256-8gsD9xVXD2/A7jT+vcPK7R9T+Xbt0sXaUbR2Bdui+F0=";
      };
    };
  });
  meta = {
    description = "\n    Library which provides the 3D rendering functionality in rviz.\n  ";
  };
})
