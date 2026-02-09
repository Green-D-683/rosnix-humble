{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-converters,
  ecl-exceptions,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_formatters";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."ecl_formatters";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-converters ecl-exceptions ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-converters ecl-exceptions ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_formatters" = substituteSource {
      src = fetchgit {
        name = "ecl_formatters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "72c0315b06e1d7ac44f953715b178feb3036c9b7";
        hash = "sha256-KJ9Xhcl2ACKk7qJz2OTu+dVkgzMcvIBEwmXdl0NaiKg=";
      };
    };
  });
  meta = {
    description = "\n   The formatters here simply format various input types to a specified\n   text format. They can be used with most streaming types (including both\n   ecl and stl streams).\n  ";
  };
})
