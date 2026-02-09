{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ewellix-description,
  ewellix-interfaces,
  ewellix-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_lift_common";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."ewellix_lift_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description ewellix-interfaces ewellix-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description ewellix-interfaces ewellix-moveit-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_lift_common" = substituteSource {
      src = fetchgit {
        name = "ewellix_lift_common-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "ae7a9de6a05a41a42527fb311570b7e9dbaebe1e";
        hash = "sha256-i9ZFpp6iRJ06VJmB+lWXLHn+7WGu/0j4b+xrkf7AAl8=";
      };
    };
  });
  meta = {
    description = "Metapackage for common Ewellix lift packages";
  };
})
