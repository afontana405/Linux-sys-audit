#!/bin/bash

# Define output directory
output_dir=~/software_inventory
mkdir -p "$output_dir"

echo "[+] Gathering installed software inventory..."

# 1. APT Packages
echo "[+] APT packages..."
apt list --installed > "$output_dir/apt_list.txt"

# 2. DPKG
echo "[+] DPKG selections..."
dpkg --get-selections > "$output_dir/dpkg_selections.txt"

# 3. Snap (optional, often not present)
if command -v snap >/dev/null 2>&1; then
    echo "[+] Snap packages..."
    snap list > "$output_dir/snap_list.txt"
else
    echo "[-] Snap not installed. Skipping."
fi

# 4. Flatpak (optional)
if command -v flatpak >/dev/null 2>&1; then
    echo "[+] Flatpak packages..."
    flatpak list > "$output_dir/flatpak_list.txt"
else
    echo "[-] Flatpak not installed. Skipping."
fi

# 5. Python packages
if command -v pip3 >/dev/null 2>&1; then
    echo "[+] Python 3 packages..."
    pip3 list > "$output_dir/python3_packages.txt"
fi

# 6. Node packages (optional)
if command -v npm >/dev/null 2>&1; then
    echo "[+] Node.js global packages..."
    npm -g list --depth=0 > "$output_dir/npm_global_packages.txt"
fi

# 7. AppImages
echo "[+] Searching for AppImage files..."
find ~ /opt -type f -iname "*.AppImage" > "$output_dir/appimages.txt"

# 8. Custom executables
echo "[+] Scanning for custom executables..."
find /usr/local/bin /usr/bin /opt ~/bin -type f -executable > "$output_dir/custom_executables.txt"

# 9. Desktop launcher entries
echo "[+] Extracting desktop launcher commands..."
grep -h '^Exec=' /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop 2>/dev/null > "$output_dir/desktop_execs.txt"

# 10. Git repositories
echo "[+] Listing Git repositories..."
find ~ /opt -type d -name ".git" > "$output_dir/git_repos.txt"

# 11. User scripts
echo "[+] Checking for user scripts in ~/bin..."
find ~/bin -type f -executable > "$output_dir/user_scripts.txt"

# 12. Systemd services (optional)
echo "[+] Listing active systemd services..."
systemctl list-units --type=service --state=running > "$output_dir/active_services.txt"

echo "? Inventory complete. Output saved to: $output_dir"
