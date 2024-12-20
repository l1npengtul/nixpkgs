{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-3ds";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "rust3ds";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-G1XSpvE94gcamvyKKzGZgj5QSwkBNbYWYdZ17ScwW90=";
  };

  cargoHash = "sha256-Gt8TJ6VTvpqtpQuD4WYN45/gccfgnw13sKeMqHboTm8=";

  # Integration tests do not run in Nix build environment due to needing to
  # create and build Cargo workspaces.
  doCheck = false;

  meta = with lib; {
    description = "Cargo command to work with Nintendo 3DS project binaries. Based on cargo-psp.";
    homepage = "https://github.com/rust3ds/cargo-3ds";
    license = with licenses; [ mit asl20 ];
    maintainers = with maintainers; [ l1npengtul ];
  };
}
