#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source the Cargo environment
source $HOME/.cargo/env

# Update Rust
rustup update

# Install Solana CLI
sh -c "$(curl -sSfL https://release.solana.com/v1.10.0/install)"

# Add the Solana CLI to the PATH
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Ensure the required Rust targets are installed
rustup target add bpfel-unknown-unknown
rustup target add bpfel-unknown-unknown/release

# Install Solana dependencies
cargo install --git https://github.com/solana-labs/rbpf --tag v0.2.17 solana_rbpf

# Any other setup steps