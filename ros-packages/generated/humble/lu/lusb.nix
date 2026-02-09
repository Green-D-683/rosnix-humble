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
  pname = "lusb";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."lusb";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lusb" = substituteSource {
      src = fetchgit {
        name = "lusb-source";
        url = "https://github.com/DataspeedInc-release/lusb-release.git";
        rev = "99f53a090103fbb76cfdb20f368375d2c1fd6824";
        hash = "sha256-SD5KijVFijbNlJHhaYmWwiZUZ9DLVPLymvxKIj2AuoE=";
      };
    };
  });
  meta = {
    description = "\n    Library for interfacing to USB devices\n  ";
  };
})
