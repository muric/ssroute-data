# ssroute-data

Route data files for [ssroute](https://github.com/muric/ssroute) — IP ranges and default route JSON files.

## Contents

- **`data/`** — IP ranges routed through the TUN interface (via Shadowsocks)
- **`default_route/`** — IP ranges routed through the default interface (bypassing Shadowsocks)

## Installation

```bash
wget -q "https://github.com/muric/ssroute-data/releases/latest/download/ssroute-data_all.deb"
sudo dpkg -i ssroute-data_all.deb
```

Files are installed to `/etc/ssroute/data/` and `/etc/ssroute/default_route/`.

## Updating

```bash
wget -q "https://github.com/muric/ssroute-data/releases/latest/download/ssroute-data_all.deb"
sudo dpkg -i ssroute-data_all.deb
sudo systemctl restart ssroute
```

## Building deb locally

```bash
make deb
```

## License

MIT — see [LICENSE](LICENSE).
