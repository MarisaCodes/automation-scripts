# Scripts Form Automating Tasks

## Scripts

1. [ESlint For Typescript](#eslint-for-typescript)

## Eslint For Typescript:

This is a fairly simple and straightforward shell script for setting up ESlint for typescript. Linting is "...the process of running a program that will analyse code for potential errors." ~[ref](https://stackoverflow.com/a/8503586/18999644)

This can be quite useful and especially powerful with typescript for avoiding common or even major errors while development.

The script can be found in `scripts/tslint/tslint.sh`

I upload the tests along with my code. To test on your own you can create a completely empty `tests` folder then (assuming you have the `tslint.sh` file locally):

```bash
$ shc -o ./tslint -f ./tslint.sh # compile tslint.sh file output an executable at ./ called tslint

$ sudo mv ./tslint /usr/local/bin/tslint # to make it a global script. If something goes wrong you may have to use chmod u+x but I did not need it

$ rm ./tslint.sh.x.c # remove the c source file generated while compiling

$ mkdir test

$ tslint # run the command tslint
# runs:

# npm install --save-dev @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript
# creates .eslintrc.cjs file
# Writes boilerplate into .eslintrc.cjs file

# outputs:
# All done!
# Usage: npx eslint .
# Reference: https://typescript-eslint.io/getting-started/


$ tsc --init # create tsconfig.json

$ npx eslint . # after you create .ts source files run this command
```

**Running tslint on a directory that already as .eslintrc.cjs file:**

You get the output:

```
.eslintrc.cjs already exists
Usage: npx eslint .
Reference: https://typescript-eslint.io/getting-started/
```

So, it just reminds you of the usage command for eslint and the reference I used to get the package and the boilerplate for the `.eslintrc.cjs` file.

Ooh, speaking of, you don't need to configure anything. All the boilerplate is `echo`ed into the file during its creation via the `tslint` command. That was also the point of automating this, no need for memorizing the `module.exports` boilerplate for the eslint file.

(a few missing steps between `$ tsc --init` and `$ npx eslint .`, assuming sufficient typescript and general frontend knowledge)

For my example in the `tests/tslint` folder my output was:

```
1:12  error  Don't use `Function` as a type. The `Function` type accepts any function-like value.
It provides no type safety when calling the function, which can be a common source of bugs.
It also accepts things like class declarations, which will throw at runtime as they will not be called with `new`.
If you are expecting the function to accept certain arguments, you should explicitly define the function shape  @typescript-eslint/ban-types

✖ 1 problem (1 error, 0 warnings)
```

My problematic code:

```ts
const add: Function = (a: number, b: number): number => {
  // gives error check below
  return a + b;
};
const sum = add(2, 3);

console.log(sum);
```

Initially I was going crazy thinking my intellisense stopped working when vscode won't suggest me what arguments the function takes in. But then I got into the `eslint` rabbit hole somehow and now I am here automating the script for typescript-eslint setup.

Hopefully more scripts to come...
