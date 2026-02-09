{
  buildMesonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildMesonPackage (finalAttrs: {
  pname = "libcamera";
  version = "0.1.0-3";
  src = finalAttrs.passthru.sources."libcamera";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "meson" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pkg-config" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "meson" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pkg-config" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcamera" = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "d6373e2bf92e9e0a615d134cd087dde4633a1ebc";
        hash = "sha256-NAT3c3AFWPa/7CJhsVzx13ysU5Xj0NxxNQMwE7FhFao=";
      };
    };
  });
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
})
