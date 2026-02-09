{
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wireless-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wireless_watcher";
  version = "1.1.5-2";
  src = finalAttrs.passthru.sources."wireless_watcher";
  propagatedNativeBuildInputs = [ diagnostic-updater rclcpp wireless-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "wireless-tools" ]; };
  propagatedBuildInputs = [ diagnostic-updater rclcpp wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "wireless-tools" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_watcher" = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "30053d87d76b3f5b85d1083e842a03de721aa7e6";
        hash = "sha256-lj0B0i9lH8OuEiKwrHPAyJmeyzfdow0iBYtsJAd2z6c=";
      };
    };
  });
  meta = {
    description = "A node which publishes connection information about a linux wireless interface.";
  };
})
