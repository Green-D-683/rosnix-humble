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
  nao-command-msgs,
  nao-sensor-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_lola";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."nao_lola";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nao-command-msgs nao-sensor-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nao-command-msgs nao-sensor-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_lola" = substituteSource {
      src = fetchgit {
        name = "nao_lola-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "ebf22a304bfd7229e34ccd77659973634946bacb";
        hash = "sha256-jjfzIZ3bh6LvAWHCtnX+BGSJ1pJBEIEfnSjbBSSbNfY=";
      };
    };
  });
  meta = {
    description = "Packages that allow communicating with the NAO’s Lola middle-ware.";
  };
})
