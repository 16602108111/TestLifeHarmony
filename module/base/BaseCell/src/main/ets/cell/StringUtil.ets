

/*判断字符串存在不为空*/
export function isNonEmptyString(str) {
  return typeof str === 'string' && str.length > 0;
}

//判断是否包含中文
export function validateContainsChinese(str: string): boolean {
  const pattern = /[\u4e00-\u9fa5]/; // 匹配中文字符的正则表达式范围
  return pattern.test(str);
}

// 判断是否不包含中文
export function validateNoChinese(str: string): boolean {
  return !validateContainsChinese(str); // 如果字符串中包含中文字符，则返回 false；否则返回 true。
}
