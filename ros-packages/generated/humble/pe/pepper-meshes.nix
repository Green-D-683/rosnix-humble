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
  pname = "pepper_meshes";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."pepper_meshes";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "pepper_meshes" = substituteSource {
      src = fetchgit {
        name = "pepper_meshes-source";
        url = "https://github.com/ros-naoqi/pepper_meshes2-release.git";
        rev = "a42aa93822d467d212ff2155ceefae30eaf645ba";
        hash = "sha256-i33F3RRm4ACRM9p+6zU4f6HQig4lSShqImNPimEt99I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \${INSTALLER_URL}";
          to = "DOWNLOAD file://${sources."pepper_meshes/peppermeshes-0"}";
        }
      ];
    };
    "pepper_meshes/peppermeshes-0" = substituteSource {
      src = fetchurl {
        name = "peppermeshes-0-source";
        url = "https://github.com/ros-naoqi/pepper_meshes_installer/raw/master/peppermeshes-0.2.0-linux-x64-installer.run";
        hash = "sha256-Uce9e8tPT0wNTUcY1XV0zspD/IfIn0SlZJtVwbIWd9o=";
      };
    };
  });
  meta = {
    description = "Meshes for the Pepper robot, for ROS2";
  };
})
