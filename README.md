<p align="center">
<img src="moollixx.svg" alt="moollixx-logo: the Gentoo mascot Larry the cow with wings from the llvm dragon" />
</p>

# Moollixx Repository

Moollixx is a Gentoo ebuild repository for `musl/llvm/libcxx/hardened` profiles. The goal is to identify issues with this profile and upstream patches. 

From the Gentoo download page:
> [!CAUTION]
> The LLVM-based stages are experimental and use libc++, meaning they aren't ABI compatible with other stages using libstdc++. They are NOT the same as just using Clang globally. Only use with extreme caution. They are not supported at this time unless bug reports come with investigation and analysis.==

## Install

```bash
emerge -av app-eselect/eselect-repository dev-vcs/git
eselect repository add moollixx git https://github.com/moollixx/moollixx
emerge --sync moollixx
```

## Profiles

Multiple profiles should cover all major moving parts:

#### Desktop

|                                      |               |                   |                 |         |
|--------------------------------------|---------------|-------------------|-----------------|---------|
| **Architecture**                     | amd64         | arm64             | loong64         | riscv64 |
| **Mandatory Access Control**         | SELinux       | AppArmor          |                 |         |
| **Init system**                      | OpenRC        | systemd           |                 |         |
| **Display server protocol**          | Wayland       |                   |                 |         |
| **Compositor**                       | river         | _custom_          |                 |         |
| **Toolkit**                          | GTK           | Qt                | iced            |         |
| **Window manager (stacking, heavy)** | Gnome _(GTK)_ | Plasma _(Qt)_     | Cosmic _(iced)_ |         |
| **Window manager (stacking, light)** | Xfce _(GTK)_  | LXQt _(Qt)_       |                 |         |
| **Window manager (tiling)**          | niri _(n/a)_  | river _(n/a)_     |                 |         |


#### Mobile/Touch & VR

tbd

## Disclaimer

This project is an independent, unofficial effort and is not officially affiliated with, endorsed by, or sponsored by the Gentoo Project or LLVM. Logos are property of their respective owners.
