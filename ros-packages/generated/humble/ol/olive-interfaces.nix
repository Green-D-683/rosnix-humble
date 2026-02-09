{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "olive_interfaces";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."olive_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "olive_interfaces" = substituteSource {
      src = fetchgit {
        name = "olive_interfaces-source";
        url = "https://github.com/olive-robotics/olive-ros2-interfaces-release.git";
        rev = "a69b8132cbfe211a668f52b04f83c0288e0958dd";
        hash = "sha256-6ejptSvjSAQq8M757RUkjMu16TkeOxHr/dPHecAOApA=";
      };
    };
  });
  meta = {
    description = "This package provides all olive custom interfaces";
  };
})
