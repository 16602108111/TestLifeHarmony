
//json解析
export function parse(text: string): any{
  const res = JSON.parse(text)
  return res
}

export function stringify(value: any): string{
  const res = JSON.stringify(value);
  return res;
}

export default {
  parse,
  stringify
}