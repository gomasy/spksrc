# spksrc

A personal fork of [SynoCommunity/spksrc](https://github.com/SynoCommunity/spksrc), the cross-compilation framework for building Synology NAS packages (SPK files).

## Usage

```bash
git clone https://github.com/gomasy/spksrc
cd spksrc
docker build -t spksrc .
docker run -it --platform=linux/amd64 -v $(pwd):/spksrc -w /spksrc spksrc /bin/bash

cd spk/<package>
make arch-x64-7.2
```

Built packages are written to `packages/`.

See the upstream [Developer Guide](https://docs.synocommunity.com/developer-guide/) for details.

## License

When not explicitly set, files are placed under a [3 clause BSD license](LICENSE.md).
