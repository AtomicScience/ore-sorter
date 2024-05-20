export const helloWorld = () => {
  print('Hello, World! Now error!!!');
  noFunc();
}

declare function noFunc(): unknown;
