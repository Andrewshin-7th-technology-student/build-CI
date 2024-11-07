SYSTEM CONFIG = UBUNTU
  CORE: {{{YML.Config yml $$head main}}}
  name: Combined Linux Server Deployment and CI
    name: Connect to Linux Server
    runs-on: ubuntu-latest
    environment: 'Development'
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: recursive
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v4
        with:
          python-version: "3.11"
      - name: Use Node.js ${{ matrix.node }}
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node }}
          architecture: ${{ matrix.arch }} 
      - uses: actions/setup-python@v5
        with:
          python-version: '3.x'
      - uses: actions/checkout@v4
  Action workflow main file = "/schedule main*" = ("./.github/../Marketplace-Agent-logs/dockerimage.txt")
