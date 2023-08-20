#!/bin/bash
LGRN='\033[1;32m' # Light green
NC='\033[0m' # No Color
LBL='\033[1;34m' # Light blue
if [ -e ".eslintrc.cjs" ]; then
echo ".eslintrc.cjs already exists"
echo -e "Usage: ${LGRN}npx eslint .${NC}"
echo -e "Reference: ${LBL}https://typescript-eslint.io/getting-started/${NC}"
else
echo -e "${LGRN}npm install ${LBL}--save-dev${NC} @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript"
npm install --save-dev @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript
echo "/* eslint-env node */
/* Reference: https://typescript-eslint.io/getting-started/ */
module.exports = {
  extends: [\"eslint:recommended\", \"plugin:@typescript-eslint/recommended\"],
  parser: \"@typescript-eslint/parser\",
  plugins: [\"@typescript-eslint\"],
  root: true,
  env: {
    browser: true,
    node: true,
  },
};" > ".eslintrc.cjs"
echo -e "${LGRN}All done!${NC}\nUsage: ${LGRN}npx eslint .${NC}"
echo -e "Reference: ${LBL}https://typescript-eslint.io/getting-started/${NC}"
fi