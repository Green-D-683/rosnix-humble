{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_meshes";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."nao_meshes";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "java" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "java" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nao_meshes" = substituteSource {
      src = fetchgit {
        name = "nao_meshes-source";
        url = "https://github.com/ros-naoqi/nao_meshes-release.git";
        rev = "a1b5adc1469d370672e3a05cfdf427b9560b073f";
        hash = "sha256-Q+VlNVGl0lTyoNdd3KPcp6q0IGBQ/3roQ/FxAzZLdCs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \${INSTALLER_URL}";
          to = "DOWNLOAD file://${sources."nao_meshes/naomeshes-0"}";
        }
      ];
    };
    "nao_meshes/naomeshes-0" = substituteSource {
      src = fetchurl {
        name = "naomeshes-0-source";
        url = "https://github.com/ros-naoqi/nao_meshes_installer/raw/master/naomeshes-0.6.7-linux-x64-installer.run";
        hash = "sha256-Fbr0YJue/KB7zGGV2bvcyMwxkFpQg1rtU4ajr8tF/1k=";
      };
    };
  });
  meta = {
    description = "ROS2 Meshes for the NAO robot";
  };
})
