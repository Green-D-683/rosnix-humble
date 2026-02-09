{
  ament-cmake,
  ament-cmake-clang-format,
  andino-base,
  andino-description,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_control";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ andino-base andino-description controller-manager diff-drive-controller joint-state-broadcaster ros2controlcli ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ andino-base andino-description controller-manager diff-drive-controller joint-state-broadcaster ros2controlcli ];
  checkInputs = [ ament-cmake-clang-format ];
  passthru.sources = mkSourceSet (sources: {
    "andino_control" = substituteSource {
      src = fetchgit {
        name = "andino_control-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "024414ea86bbf2689ffe4b600b2224e81f25ccf7";
        hash = "sha256-FaQ44xP3tS/oriCr3Nl/VKybe6OuqtNLk7k/VTxxyA4=";
      };
    };
  });
  meta = {
    description = "The andino_control package";
  };
})
